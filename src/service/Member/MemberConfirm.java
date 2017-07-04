package service.Member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;

public class MemberConfirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int result=0;
		String u_id=request.getParameter("u_id");
		MemberDao md=MemberDao.getInstance();
		if(u_id.equals("master")){
			result=-1;
		}else{
			result=md.confirm(u_id);
		}
		
		session.setAttribute("u_id", u_id);
		request.setAttribute("u_id", u_id);
		request.setAttribute("result", result);
		
		return "confirm.jsp";
	}

}
