package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class MagazineInsertForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		String pageNum=request.getParameter("pageNum");
		String m_id=request.getParameter("m_id");
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("m_id", m_id);
		
		return "insertForm.jsp";
	}

}
