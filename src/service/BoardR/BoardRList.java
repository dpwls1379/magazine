package service.BoardR;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardRDao;
import model.BoardR;

public class BoardRList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		BoardRDao brd=BoardRDao.getInstance();
		
		List<BoardR> boardR=new ArrayList<>();
		boardR=brd.list(r_num);
		
		request.setAttribute("r_num", r_num);
		request.setAttribute("boardR", boardR);
		
		return "replyList.jsp";
	}

}
