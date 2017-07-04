package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;
import model.Member;

public class MemberJoin implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		request.setCharacterEncoding("utf-8");
		
		String u_id=request.getParameter("u_id");
		
		MemberDao md = MemberDao.getInstance();
		Member member=new Member();
		
		member.setU_birthday(request.getParameter("u_birthday"));
		member.setU_address(request.getParameter("u_address"));
		member.setU_postcode(request.getParameter("u_postcode"));
		
		if(request.getParameter("u_nickname")!=null){
			member.setU_nickname(request.getParameter("u_nickname"));
		}else{
			member.setU_nickname(u_id);
		}
		
		member.setU_gender(request.getParameter("u_gender"));
		member.setU_job(request.getParameter("u_job"));
		member.setU_email(request.getParameter("u_email"));
		member.setU_id(u_id);
		member.setU_name(request.getParameter("u_name"));
		member.setU_passwd(request.getParameter("u_passwd"));
		member.setU_tel(request.getParameter("u_tel"));
		
		int result = md.insert(member);
		
		session.setAttribute("u_id", u_id);
		request.setAttribute("result", result);

		return "join.jsp";
	}

}
