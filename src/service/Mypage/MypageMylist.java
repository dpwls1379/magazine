package service.Mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import dao.MagazineDao;
import dao.RecipeDao;
import model.Board;
import model.Magazine;
import model.Recipe;

public class MypageMylist implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		
		RecipeDao rd=RecipeDao.getInstance();
		BoardADao bd=BoardADao.getInstance();
		MagazineDao mnd=MagazineDao.getInstance();
		List<Recipe> recipe=new ArrayList<>();
		List<Board> board=new ArrayList<>();
		List<Magazine> magazine=new ArrayList<>();
		
		String u_id="";
		String m_id="";
		
		if(session.getAttribute("u_id")!=null){
			u_id=(String)session.getAttribute("u_id");
			recipe=rd.mylist(u_id, "null");
			board=bd.mylist(u_id);
			request.setAttribute("board", board);
			request.setAttribute("recipe", recipe);
		}else if(session.getAttribute("m_id")!=null){
			m_id=(String)session.getAttribute("m_id");
			recipe=rd.mylist("null", m_id);
			magazine=mnd.mylist();
			request.setAttribute("magazine", magazine);
			request.setAttribute("recipe", recipe);
		}else{
			
		}	
		
		
		return "mylist.jsp";
	}

}
