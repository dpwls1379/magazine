package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.ManagerDao;
import dao.MemberDao;

public class MemberSecession implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		HttpSession session=request.getSession();
		
		String m_id=(String) session.getAttribute("m_id");
		String m_passwd=request.getParameter("m_passwd");
		String u_id=request.getParameter("u_id");
		MemberDao md= MemberDao.getInstance();
		ManagerDao mnd=ManagerDao.getInstance();
		result=mnd.check(m_id,m_passwd);
		System.out.println("u_id="+u_id);
		if(result>0){
			result=md.delete(u_id);
		}else{
			result=0;
		}
		request.setAttribute("result", result);
		session.setAttribute("m_id", m_id);
		
		return "delete.jsp";
	}

}
