
<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>

<%@page import="java.util.ArrayList"%>

<%
String list_type = request.getParameter("type") == null ? "" : request.getParameter("type");
int parent_id = Integer.parseInt(request.getParameter("parent_id") == null ? "0" : request.getParameter("parent_id"));
System.out.println("Type: " + list_type + ", Parent Id: " + parent_id);
%>


<%
if (list_type.equalsIgnoreCase("party")) {
%>

<%
DepartmentService service1 = new DepartmentService();
ArrayList<DepartmentDto> list3 = service1.getdepartmentInfo(config, request);
for (DepartmentDto dto_path : list3) {
%>
<option data-id="<%=dto_path.getId()%>" value="<%=dto_path.getNAME()%>" />
<%
}
}
%>

<%
if (list_type.equalsIgnoreCase("good")) {
%>

<%
Employeeservice service1 = new Employeeservice();
ArrayList<Employeedto> list3 = service1.getemployeeInfo(config, request);
for (Employeedto dto_emp : list3) {
%>
<option data-id="<%=dto_emp.getId()%>" value="<%=dto_emp.getNAME()%>" />
<%
}
}
%>


<%-- 
<%
CompanyService bike_ser = new CompanyService();

ArrayList<CompanyDto> comp_list = bike_ser.getActiveCompanyInfo(config, request);

for (CompanyDto com_dto : comp_list) {
%>


<option data-id="<%=com_dto.getId()%>"

  data-name="<%=com_dto.getName() %>"
  data-code="<%=com_dto.getCode() %>"
  data-address="<%=com_dto.getAddress() %>"
  data-gst="<%=com_dto.getGstin_no()%>"
	 value="<%=com_dto.getName()%>" />

<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("city")) {
%>

<%
CityService city_ser = new CityService();
ArrayList<CityDto> city_list = city_ser.getActiveCityInfo(config, request);
for (CityDto city_dto : city_list) {
%>
<option data-id="<%=city_dto.getId()%>"
	data-district_id="<%=city_dto.getDistrict_id_fk()%>"
	value="<%=city_dto.getName()%>" />
<%
}
%>


<%
} else if (list_type.equalsIgnoreCase("district_name")) {
%>

<%
DistrictService district_ser = new DistrictService();
ArrayList<DistrictDto> district_list = district_ser.getActiveDistrictInfo(config, request);
for (DistrictDto district_dto : district_list) {
%>
<option data-id="<%=district_dto.getId()%>"
	value="<%=district_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("vehicle")) {
%>

<%
VehicleInfoService city_ser = new VehicleInfoService();
ArrayList<VehicleInfoDto> city_list = city_ser.getActiveVehicleInfo(config, request);
for (VehicleInfoDto city_dto : city_list) {
%>
<option data-id="<%=city_dto.getId()%>"
	data-veh="<%=city_dto.getName()%>" value="<%=city_dto.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("bank")) {
%>

<%
BankService ser1 = new BankService();

ArrayList<BankDto> list1 = ser1.getBankInfo(config, request);

for (BankDto Bank_dto : list1) {
%>
<option data-id="<%=Bank_dto.getId()%>" value="<%=Bank_dto.getName()%>" />
<%
}
%>






<%
} else if (list_type.equalsIgnoreCase("other_dealer")) {
%>

<%
DealerOtherService service1 = new DealerOtherService();
ArrayList<PurchaseOtherDto> list3 = service1.getActiveDealerOtherInfo(config, request);
for (PurchaseOtherDto dto_deal : list3) {
%>
<option data-id="<%=dto_deal.getId()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("vehicle")) {
%>

<%
VehicleInfoService service1 = new VehicleInfoService();
ArrayList<VehicleInfoDto> list3 = service1.getActiveVehicleInfo(config, request);
for (VehicleInfoDto dto_deal : list3) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-veh="<%=dto_deal.getName()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("customer_consignee")) {
%>

<%
CustomerService service_one = new CustomerService();
ArrayList<CustomerDto> list_one = service_one.getActiveCustomerInfo("Reciver", config, request);
for (CustomerDto dto_deal : list_one) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-name1="<%=dto_deal.getName()%>"
	data-mobile="<%=dto_deal.getMobile_no()%>"
	data-address1="<%=dto_deal.getAddress()%>"
	data-gst1="<%=dto_deal.getGst_no()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("Billed_party")) {
%>
<%
CustomerService service_acc_party = new CustomerService();
ArrayList<CustomerDto> list_acc_party = service_acc_party.getActiveCustomerInfo("Account_Party", config, request);
for (CustomerDto dto_deal : list_acc_party) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-mobile="<%=dto_deal.getMobile_no()%>"
	value="<%=dto_deal.getName()%>" />
<%
}
%>

<%
} else if (list_type.equalsIgnoreCase("product")) {
%>


<%
ProductInfoService pro_ser = new ProductInfoService();
ArrayList<ProductInfoDto> list_pro = pro_ser.getActiveInfo(config, request);
for (ProductInfoDto dto_pro : list_pro) {
%>
<option data-id="<%=dto_pro.getId()%>"
	data-weight="<%=dto_pro.getWeight()%>" value="<%=dto_pro.getName()%>" />
<%
}
%>





<%
} else if (list_type.equalsIgnoreCase("personal_vehicle_company")) {
%>

<%
DealerService service_one2 = new DealerService();
ArrayList<DealerDto> list_one2 = service_one2.getActiveDealerInfo(config, request);
for (DealerDto dto_deal : list_one2) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-name3="<%=dto_deal.getName()%>"
	data-address3="<%=dto_deal.getAddress()%>"
	data-gst3="<%=dto_deal.getGst_no()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>



<%
} else if (list_type.equalsIgnoreCase("personal_vehicle_party")) {
%>

<%
PersonalVehivlePartyService service_one2 = new PersonalVehivlePartyService();
ArrayList<PersonalVehiclePartyDto> list_one2 = service_one2.getPersonalVehiclePartyInfoActive(config, request);
for (PersonalVehiclePartyDto dto_deal : list_one2) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-name3="<%=dto_deal.getName()%>"
	data-address3="<%=dto_deal.getAddress()%>"
	data-gst3="<%=dto_deal.getGst_no()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>





<%
} else if (list_type.equalsIgnoreCase("transporter")) {
%>

<%
TranspoterService service_one2 = new TranspoterService();
ArrayList<TranspoterDto> list_one2 = service_one2.getTranspoterInfoActive(config, request);
for (TranspoterDto dto_deal : list_one2) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-name3="<%=dto_deal.getName()%>"
	data-address3="<%=dto_deal.getAddress()%>"
	data-gst3="<%=dto_deal.getGst_no()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>



<%
} else if (list_type.equalsIgnoreCase("Petrol_Pump_Company")) {
%>

<%
DealerOtherService service_one2 = new DealerOtherService();
ArrayList<PurchaseOtherDto> list_one2 = service_one2.getDealerOtherAActiveInfo(config, request);
for (PurchaseOtherDto dto_deal : list_one2) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-name3="<%=dto_deal.getName()%>"
	data-address3="<%=dto_deal.getAddress()%>"
	data-gst3="<%=dto_deal.getGst_no()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>
<%
} else if (list_type.equalsIgnoreCase("purchase")) {
%>

<%
ProductInfoService service1 = new ProductInfoService();
ArrayList<ProductInfoDto> list3 = service1.getProductInfo(config, request);
for (ProductInfoDto dto_deal : list3) {
%>
<option data-id="<%=dto_deal.getId()%>"
	data-weight="<%=dto_deal.getWeight()%>" value="<%=dto_deal.getName()%>" />
<%
}
%>



<%
}
%>
 --%>

