package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;

public class MemberLogin implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		
		String u_id = request.getParameter("u_id");
		String u_passwd = request.getParameter("u_passwd");
		MemberDao md = MemberDao.getInstance();
		System.out.println(u_id);
		int result = md.check(u_id, u_passwd);
		
		session.setAttribute("u_id", u_id);

		request.setAttribute("result", result);
		
		return "login.jsp";
	}

}
