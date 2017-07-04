package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.SendResult;

import controller.CommandProcess;
import dao.MagazineDao;
import model.Magazine;

public class MagazineDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String pageNum=request.getParameter("pageNum");
		int ma_num=Integer.parseInt(request.getParameter("ma_num"));
		
		HttpSession session=request.getSession();
		
		String m_id=(String) session.getAttribute("m_id");
		if(m_id==null){
			response.sendRedirect("notmgr.jsp");
		}
		MagazineDao md=MagazineDao.getInstance();
		Magazine magazine=new Magazine();
		
		magazine=md.select(ma_num);
		
		session.setAttribute("m_id", m_id);
		request.setAttribute("magazine", magazine);
		request.setAttribute("pageNum", pageNum);
		
		return "deleteForm.jsp";
	}

}
