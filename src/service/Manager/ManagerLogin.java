package service.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.ManagerDao;

public class ManagerLogin implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		HttpSession session=request.getSession();
		
		int result=0;
		String m_id=request.getParameter("m_id");
		String m_passwd=request.getParameter("m_passwd");
		ManagerDao mnd=ManagerDao.getInstance();
		result=mnd.check(m_id,m_passwd);
		
		if (result >0 ) session.setAttribute("m_id", m_id);
		System.out.println("maLogin m_id = "+m_id);
		request.setAttribute("result", result);

		
		return "login.jsp";
	}

}
