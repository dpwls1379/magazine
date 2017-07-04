package service.Recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.RecipeDao;
import model.Recipe;

public class RecipeDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String pageNum=request.getParameter("pageNum");
		
		RecipeDao rd=RecipeDao.getInstance();
		Recipe recipe=new Recipe();
		
		recipe=rd.select(r_num);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("r_num", r_num);
		request.setAttribute("recipe", recipe);
		
		return "deleteForm.jsp";
	}

}
