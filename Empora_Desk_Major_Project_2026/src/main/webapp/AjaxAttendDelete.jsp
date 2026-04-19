<%@page import="com.dto.*"%>
<%@page import="com.service.*"%>
<%@page import="java.util.ArrayList" %>

<%
attendencedto dto = new attendencedto();

String id=request.getParameter("Delete_attend");
attendenceservice pro_ser = new attendenceservice();

boolean b  = pro_ser.deleteattendenceinfo(id, request);

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