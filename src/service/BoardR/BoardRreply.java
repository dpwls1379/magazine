package service.BoardR;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardRDao;
import model.BoardR;

public class BoardRreply implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		int br_re_level=0,br_re_step=0,br_ref=0;
		String pageNum=request.getParameter("pageNum");
		if(request.getParameter("br_re_level")!=""){
			br_re_level=Integer.parseInt(request.getParameter("br_re_level"));
			br_re_step=Integer.parseInt(request.getParameter("br_re_step"));
			br_ref=Integer.parseInt(request.getParameter("br_ref"));
		}
		String id=request.getParameter("id");
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String br_content=request.getParameter("br_content");
		
		BoardRDao brd=BoardRDao.getInstance();
		BoardR boardR=new BoardR();
		
		boardR.setId(id);
		boardR.setR_num(r_num);
		boardR.setBr_content(br_content);
		
		if(request.getAttribute("br_num")!=""){
			boardR.setBr_ref(br_ref);
			boardR.setBr_re_level(br_re_level);
			boardR.setBr_re_step(br_re_step);
			boardR.setBr_num(Integer.parseInt(request.getParameter("br_num")));
		}else{
		}
		
		result=brd.insert(boardR);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("r_num", r_num);
		
		return "reply.jsp";
	}

}
