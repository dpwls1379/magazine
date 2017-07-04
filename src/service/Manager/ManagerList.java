package service.Manager;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardADao;
import dao.MagazineDao;
import dao.RecipeDao;
import model.Board;
import model.Magazine;
import model.Recipe;

public class ManagerList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		RecipeDao rd=RecipeDao.getInstance();
		BoardADao bd=BoardADao.getInstance();
		MagazineDao mnd=MagazineDao.getInstance();
		List<Recipe> recipe=new ArrayList<>();
		List<Board> board=new ArrayList<>();
		List<Magazine> magazine=new ArrayList<>();
		
		recipe=rd.mgrList();
		board=bd.mgrList();
		magazine=mnd.mgrList();
		
		request.setAttribute("recipe", recipe);
		request.setAttribute("board", board);
		request.setAttribute("magazine", magazine);
		
		
		return "managerList.jsp";
	}

}
