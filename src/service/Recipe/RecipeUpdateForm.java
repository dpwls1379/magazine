package service.Recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.*;
import model.Recipe;

public class RecipeUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String pageNum=request.getParameter("pageNum");
		
		RecipeDao rd=RecipeDao.getInstance();
		
		Recipe recipe=rd.select(r_num);
		
		String r_title=request.getParameter(recipe.getR_title());
		String u_id=request.getParameter(recipe.getU_id());
		String r_content=request.getParameter(recipe.getR_content());
		
		request.setAttribute("recipe", recipe);
		
		request.setAttribute("r_num", r_num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("r_title", r_title);
		request.setAttribute("u_id", u_id);
		request.setAttribute("r_content", r_content);
		
		return "updateForm.jsp";
	}

}
