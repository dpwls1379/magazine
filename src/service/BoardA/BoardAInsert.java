package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import model.Board;

public class BoardAInsert implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		int result = 0;
		int b_re_level=0,b_re_step=0,b_ref=0;
		String pageNum=request.getParameter("pageNum");
		if(request.getParameter("b_re_level")!=""){
			b_re_level=Integer.parseInt(request.getParameter("b_re_level"));
			b_re_step=Integer.parseInt(request.getParameter("b_re_step"));
			b_ref=Integer.parseInt(request.getParameter("b_ref"));
		}

		Board board = new Board();
		BoardADao bad = BoardADao.getInstance();
		
		board.setU_id((String)session.getAttribute("u_id"));
		board.setB_title(request.getParameter("b_title"));
		board.setB_content(request.getParameter("b_content"));
		
		if(request.getParameter("b_num")!=""){//답변일 경우
			board.setB_ref(b_ref);
			board.setB_re_level(b_re_level);
			board.setB_re_step(b_re_step);
			board.setB_num(Integer.parseInt(request.getParameter("b_num")));
		}else{
			
		}

		result = bad.insert(board);

		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);

		return "insert.jsp";
	}

}
