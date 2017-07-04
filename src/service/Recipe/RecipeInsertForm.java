package service.Recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;


public class RecipeInsertForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
				HttpSession session=request.getSession();
				
				String pageNum=request.getParameter("pageNum");
				if(session.getAttribute("u_id")!=null){
					String u_id=(String) session.getAttribute("u_id");
					session.setAttribute("u_id", u_id);
				}else if(session.getAttribute("m_id")!=null){
					String m_id=(String) session.getAttribute("m_id");
					session.setAttribute("m_id", m_id);
				}
				
				request.setAttribute("pageNum", pageNum);
				
				return "insertForm.jsp";
			}

		
	
}
