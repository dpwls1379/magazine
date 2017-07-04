package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import dao.ManagerDao;
import dao.MemberDao;

public class BoardADelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int result=0;
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		String pageNum=request.getParameter("pageNum");
		String u_id=null; String m_id=null,passwd=null;

		BoardADao bd=BoardADao.getInstance();
		MemberDao md=MemberDao.getInstance();
		ManagerDao mnd=ManagerDao.getInstance();
		
		if(session.getAttribute("u_id")!=null){
			u_id=(String) session.getAttribute("u_id");
			passwd=request.getParameter("passwd");
			result=md.check(u_id, passwd);
		}
		if(session.getAttribute("m_id")!=null){
			m_id=(String) session.getAttribute("m_id");
			passwd=request.getParameter("passwd");
			result=mnd.check(m_id, passwd);
		}
		
		if(result>0){
			result=bd.delete(b_num);
		}else{
			result=0;
		}
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		
		return "delete.jsp";
	}

}
