<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*,dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Member mem=new Member();
MemberDao md=MemberDao.getInstance();
for(int i=1;i<10;i++){
	mem.setU_id("k"+i);
	mem.setU_birthday("900101");
	mem.setU_email("k"+i+"@k.com");
	mem.setU_nickname("k"+i);
	mem.setU_gender("man");
	mem.setU_postcode("12345");
	mem.setU_passwd("k"+i);
	mem.setU_job("학생");
	mem.setU_name("길동"+i);
	mem.setU_address("서울 강남"+i);
	mem.setU_tel("000-0000-000"+i);
	md.insert(mem);
}
%>
입력완료
</body>
</html>