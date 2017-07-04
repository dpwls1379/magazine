package service.Recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.RecipeDao;

public class RecipeLikeit implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		int result=0;
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String pageNum=request.getParameter("pageNum");
		RecipeDao rd=RecipeDao.getInstance();
		if(session.getAttribute("u_id")!=null || session.getAttribute("m_id")!=null){
			rd.likeitUp(r_num);
		}else{
			result=-1;
			request.setAttribute("result", result);
		}
		
		
		
		request.setAttribute("r_num", r_num);
		request.setAttribute("pageNum", pageNum);
		
		return "like.jsp";
	}

}
