package service.BoardR;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import dao.BoardRDao;
import model.BoardR;

public class BoardRreplyForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String id=null;
		int br_ref=0, br_re_step=0, br_re_level=0, br_num=0;
		BoardRDao brd=BoardRDao.getInstance();
		BoardR boardR=new BoardR();
		
		if(session.getAttribute("m_id")!=null){
			id=(String) session.getAttribute("m_id");
		}else if(session.getAttribute("u_id")!=null){
			id=(String) session.getAttribute("u_id");
		}
		
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String pageNum=request.getParameter("pageNum");
		System.out.println(request.getParameter("br_num"));
		if(request.getParameter("br_num")!=null){//답변!
			br_num=Integer.parseInt(request.getParameter("br_num"));
			brd=BoardRDao.getInstance();
			boardR=brd.select(br_num);
		//	br_num=boardR.getBr_num();//원본글의 num,ref... 를 읽는답
			r_num=boardR.getR_num();
			br_ref=boardR.getBr_ref();
			br_re_level=boardR.getBr_re_level();
			br_re_step=boardR.getBr_re_step();
		}
		
		request.setAttribute("id", id);
		request.setAttribute("br_num", br_num);
		request.setAttribute("br_ref", br_ref);
		request.setAttribute("br_re_level", br_re_level);
		request.setAttribute("br_re_step", br_re_step);
		request.setAttribute("r_num", r_num);
		request.setAttribute("pageNum", pageNum);
		
		return "replyForm.jsp";
	}

}
