package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.*;
import model.Board;

public class BoardAUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		BoardADao bad=BoardADao.getInstance();
		Board board=bad.select(b_num);
		String pageNum=request.getParameter("pageNum");
		String b_title=request.getParameter(board.getB_title());
		String b_content=request.getParameter(board.getB_content());
		
		request.setAttribute("board", board);
		
		request.setAttribute("b_num", b_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("b_title", b_title);
		request.setAttribute("b_content", b_content);
		
		return "updateForm.jsp";
	}

}
