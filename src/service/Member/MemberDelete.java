package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;

public class MemberDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		MemberDao md= MemberDao.getInstance();
		String u_passwd=request.getParameter("u_passwd");
		String u_id=(String) session.getAttribute("u_id");
		int result=0;
		
		result=md.check(u_id, u_passwd);
		if(result>0){
			result=md.delete(u_id);
		}else{
			result=0;
		}
		
		request.setAttribute("result", result);
		
		return "delete.jsp";
	}

}
