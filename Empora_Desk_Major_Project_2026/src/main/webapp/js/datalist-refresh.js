$(document).ready(function() {
	$(".refresh-container").each(function() {
		let container = $(this);
		let listtype = container.data('list');
		let dataListID = 'dataList_' + generateRandomID(8); // Generate a unique ID for the datalist
		// append datalist and icon design in containier
		container.append('<div class="refresh-block"><a target="_blank" class="plus-add-icon" title="Add"><i class="fas fa-edit main-color"></i></a><a title="Refresh"><i class="fa fa-refresh main-color"></i></a></div>');
		container.append('<datalist id="' + dataListID + '"></datalist>');

		let parentId = getParentId(container.data('parentlist'));
		let hiddenInput = container.find('input:hidden');
		let textInput = container.find('input:text');
		getDataList(listtype, dataListID, parentId, function() {
			// Check if text input value is not empty ("")
			if (textInput.val() !== "") {
				let thisValue = textInput.val();
				let thisId = $("#" + dataListID + " option[value='" + thisValue + "']").data("id");
				hiddenInput.val(thisId);
			}

			// Check if hidden input value is greater than 0
			if (parseInt(hiddenInput.val()) > 0) {
				let thisId = hiddenInput.val();
				//alert(thisId);
				let thisValue = $("#" + dataListID + " option[data-id='" + thisId + "']").val();
				//alert(thisValue);
				textInput.val(thisValue);
			}
		});

		let allDataAttributes;

		// Add the dataListID to the list attribute of the text input box
		textInput.attr('list', dataListID);
		// Add onchange function to the text input box
		textInput.change(function() {
			let thisValue = $(this).val();
			let selectedOption = $("#" + dataListID + " option[value='" + thisValue + "']");
			let thisId = selectedOption.data("id");

			if (typeof thisId === 'undefined') {
				this.value = '';
				container.find('input:hidden').val(0);

				// clean attributes values into coresponding inputs....	

				for (let key in allDataAttributes) {
					if (allDataAttributes.hasOwnProperty(key)) {
						// Find input with attribute data-listtype-key
						let $input = $("input[data-" + listtype + "-" + key + "]");
						// Check if input is found
						if ($input.length > 0) {
							$input.val("");
						} else {
							//console.error("Input not found for data-" + listtype + "-" + key);
						}
					}
				}
				//warningAlert("Please Select Valid Detail.");
			} else {
				container.find('input:hidden').val(thisId);
				allDataAttributes = selectedOption.data();
				//console.log("data attributes:",allDataAttributes);


				// set attributes values into coresponding inputs....			

				for (let key in allDataAttributes) {
					if (allDataAttributes.hasOwnProperty(key)) {
						let inputValue = allDataAttributes[key];
						//console.log(allDataAttributes[key]);

						// Find input with attribute data-listtype-key
						let $input = $("input[data-" + listtype + "-" + key + "]");

						// Check if input is found
						if ($input.length > 0) {
							$input.val(inputValue);

						} else {
							//console.error("Input not found for data-" + listtype + "-" + key);
						}
					}
				}
			}
			refreshChild(listtype);
			//alert(inputValue);
		});


	});
});

// Handle When Click on refreshBlock
$(document).ready(function() {
	$(".refresh-container").each(function() {
		let container = $(this);
		container.find('a').eq(0).on('click', function() {
			let url = container.data('add');
			//alert(url);
			//addMain(url);
			window.open(url, '_blank');
		});
		container.find('a').eq(1).on('click', function() {
			refreshFunction(container);
		});
	});
	function refreshFunction(container) {
		let listtype = container.data('list');
		let dataListID = container.find("datalist").attr("id");
		let refreshIcon = container.find('.refresh-block a').eq(1).find('i');
		refreshIcon.addClass('spin-animation');
		let parentId = getParentId(container.data('parentlist'));
		getDataList(listtype, dataListID, parentId, function() {
			setTimeout(function() {
				refreshIcon.removeClass('spin-animation');
			}, 1000); // Remove the class after 2 seconds 
		});

	}
});

function getParentId(parentlist) {
	let parentContainer = $("[data-list='" + parentlist + "']");
	let hiddenInputValue = parentContainer.find('input:hidden').val();
	//alert(hiddenInputValue);
	return hiddenInputValue;
}

function getDataList(type, dataListID, parentId, callback) {
	if (typeof parentId === "undefined") {
		parentId = 0;
	}
	$.ajax({
		url: 'AjaxService/AjaxDataList.jsp',
		data: 'type=' + type + '&parent_id=' + parentId,
		type: 'post',
		success: function(msg) {
			$('#' + dataListID).html(msg);
			console.log(msg);
			if (typeof callback === 'function') {
				callback(); // Execute the callback function after the AJAX call is successful
			}
		},
		error: function(xhr, status, error) {
			console.error('Error:', error);
		}
	});
}

// Function to generate a random string of characters
function generateRandomID(length) {
	let result = '';
	let characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
	let charactersLength = characters.length;
	for (let i = 0; i < length; i++) {
		result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
	return result;
}

/*function refreshChild(listType) {
	//alert(listType);
	let childContainer = $("[data-parentlist='" + listType + "']");
	let childListType = childContainer.data('list');
	let childDatalistId = childContainer.find("datalist").attr("id");
	//alert(childListType);

	let parentId = getParentId(listType);
	//alert(parentId);

	getDataList(childListType, childDatalistId, parentId, function() { });

}*/


function refreshChild(listType) {
	let childContainers = $("[data-parentlist='" + listType + "']");
	childContainers.each(function() {
		let childContainer = $(this);
		let childListType = childContainer.data('list');
		let childDatalistId = childContainer.find("datalist").attr("id");
		let parentId = getParentId(listType);
		getDataList(childListType, childDatalistId, parentId, function() { });
	});
}