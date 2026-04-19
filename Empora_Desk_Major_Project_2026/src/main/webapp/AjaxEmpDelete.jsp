<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%@page import="java.util.ArrayList" %>

<%
Employeedto dto = new Employeedto();

String id=request.getParameter("Delete_emp");
Employeeservice pro_ser = new Employeeservice();

boolean b  = pro_ser.deleteemployeeinfo(id, request);

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