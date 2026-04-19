<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%@page import="java.util.ArrayList" %>

<%
DepartmentDto dto = new DepartmentDto();

String id=request.getParameter("Delete_Dept");
DepartmentService pro_ser = new DepartmentService();

boolean b  = pro_ser.deletedepartmentinfo(id, request);

if (b) {
%>
<input id="check" type="hidden" value="done" />

<%
} else {
%>
<input id="check" type="hidden" value="notdone" />
<%
}
%>