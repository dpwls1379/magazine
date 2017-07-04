package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;

public class MemberSecessionForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String m_id=(String) session.getAttribute("m_id");
		String u_id=request.getParameter("u_id");
		
		request.setAttribute("u_id", u_id);
		session.setAttribute("m_id", m_id);
		
		return "secessionForm.jsp";
	}

}
