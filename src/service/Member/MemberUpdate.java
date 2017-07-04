package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;
import model.Member;

public class MemberUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		HttpSession session=request.getSession();
		
		String u_id=(String) session.getAttribute("u_id");
		String u_passwd=request.getParameter("u_passwd");
		String u_name=request.getParameter("u_name");
		String u_address=request.getParameter("u_address");
		String u_tel=request.getParameter("u_tel");
		String u_email=request.getParameter("u_email");
		String u_nickname=request.getParameter("u_nickname");
		String u_job=request.getParameter("u_job");
		String u_postcode=request.getParameter("u_postcode");
		
		MemberDao md=MemberDao.getInstance();
		Member member=new Member();
		
		member.setU_address(u_address);
		member.setU_id(u_id);
		member.setU_name(u_name);
		member.setU_passwd(u_passwd);
		member.setU_tel(u_tel);
		if(u_nickname!=null){
			member.setU_nickname(u_nickname);
		}else{
			member.setU_nickname(u_id);
		}
		member.setU_job(u_job);
		member.setU_email(u_email);
		member.setU_postcode(u_postcode);
		
		int result=md.update(member);
		
		session.setAttribute("u_id", u_id);
		request.setAttribute("result", result);
		
		return "update.jsp";
	}

}
