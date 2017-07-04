package service.BoardA;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardADao;
import model.Board;

public class BoardAInsertForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				int b_ref=0, b_re_step=0, b_re_level=0, b_num=0;
				String pageNum=request.getParameter("pageNum");
				BoardADao bad=BoardADao.getInstance();
				Board board=new Board();
				
				
				if(request.getParameter("b_num")!=null){//답변!
					b_num=Integer.parseInt(request.getParameter("b_num"));
					bad=BoardADao.getInstance();
					board=bad.select(b_num);
					b_num=board.getB_num();//원본글의 num,ref... 를 읽는답
					b_ref=board.getB_ref();
					b_re_level=board.getB_re_level();
					b_re_step=board.getB_re_step();
				}
				
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("b_num", b_num);
				request.setAttribute("b_ref", b_ref);
				request.setAttribute("b_re_level", b_re_level);
				request.setAttribute("b_re_step", b_re_step);
				
				return "insertForm.jsp";
			}

		
	
}
