package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.*;
import model.Board;

public class BoardAUpdate implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {
			e.getMessage();
		}
		HttpSession session=request.getSession();
		int result=0;
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		String b_content=request.getParameter("b_content");
		String b_title=request.getParameter("b_title");
		String pageNum=request.getParameter("pageNum");
		String u_id=(String )session.getAttribute("u_id");
		String u_passwd=request.getParameter("u_passwd");
		MemberDao md=MemberDao.getInstance();
		BoardADao bad=BoardADao.getInstance();
		
		Board board=new Board();
		board.setB_num(b_num);
		board.setB_title(b_title);
		board.setB_content(b_content);
		result=md.check(u_id, u_passwd);
		if(result>0){
			result=bad.update(board);
		}else{
			result=0;
		}
				
		request.setAttribute("b_num", b_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "update.jsp";
	}

}
