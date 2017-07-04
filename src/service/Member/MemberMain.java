package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;

public class MemberMain implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		/*HttpSession session=request.getSession();
		
		String u_id=(String) session.getAttribute("u_id");		
		String m_id=(String) session.getAttribute("m_id");
		
		session.setAttribute("m_id", m_id);
		session.setAttribute("u_id", u_id);
		*/
		return "main.jsp";
	}

}
