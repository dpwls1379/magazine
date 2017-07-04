package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;
import model.Member;

public class MemberUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String u_id=(String) session.getAttribute("u_id");
		
		MemberDao md=MemberDao.getInstance();
		Member member=md.select(u_id);
		
		session.setAttribute("u_id", u_id);
		request.setAttribute("member", member);
		
		
		return "updateForm.jsp";
	}

}
