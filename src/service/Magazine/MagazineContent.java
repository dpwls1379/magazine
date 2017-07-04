package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MagazineDao;
import dao.RecipeDao;
import model.Magazine;
import model.Recipe;

public class MagazineContent implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
				int ma_num=Integer.parseInt(request.getParameter("ma_num"));
				String pageNum=request.getParameter("pageNum");
				MagazineDao md=MagazineDao.getInstance();
				Magazine magazine=new Magazine();
				
				md.readcountUpdate(ma_num);
				
				magazine=md.select(ma_num);
				
				request.setAttribute("ma_num", ma_num);
				request.setAttribute("magazine", magazine);
				request.setAttribute("pageNum", pageNum);
				
				return "content.jsp";
	}

}
