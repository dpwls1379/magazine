<%
String path=request.getContextPath();
String m_id=(String)session.getAttribute("m_id");
String u_id=(String)session.getAttribute("u_id");
System.out.println("m_id2="+m_id);
System.out.println("u_id2="+u_id);
if(u_id!=null){%>
<script type="text/javascript">
alert("Not a manager");
history.back();
</script>
<%
}else{
	response.sendRedirect(path+"/manager/loginForm.jsp");
}
%>