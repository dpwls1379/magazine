package service.index;

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

public class BoardId implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<Board> board=new ArrayList<>();
		List<Recipe> recipe=new ArrayList<>();
		List<Magazine> magazine=new ArrayList<>();
		
		BoardADao bd=BoardADao.getInstance();
		RecipeDao rd=RecipeDao.getInstance();
		MagazineDao md=MagazineDao.getInstance();
		
		board=bd.bIndex();
		recipe=rd.rIndex();
		magazine=md.mIndex();
		
		request.setAttribute("board", board);
		request.setAttribute("recipe", recipe);
		request.setAttribute("magazine", magazine);
		
		
		return "boardId.jsp";
	}

}
