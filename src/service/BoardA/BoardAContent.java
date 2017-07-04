package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardADao;
import model.Board;

public class BoardAContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int b_num=Integer.parseInt(request.getParameter("b_num"));
		String pageNum=request.getParameter("pageNum");
		BoardADao bad=BoardADao.getInstance();
		Board board=new Board();
		
		bad.readcountUpdate(b_num);
		
		board=bad.select(b_num);
		
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		
		return "content.jsp";
	}

}
