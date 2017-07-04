package service.Mypage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import dao.MagazineDao;
import dao.MypageDao;
import dao.RecipeDao;
import model.Board;
import model.Magazine;
import model.Mypage;
import model.Recipe;

public class MypageMysave implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		MypageDao myd=MypageDao.getInstance();
		MagazineDao mnd=MagazineDao.getInstance();
		RecipeDao rd=RecipeDao.getInstance();
		List<Mypage> mypage=new ArrayList<>();
		List<Magazine> magazine=new ArrayList<>();
		List<Recipe> recipe=new ArrayList<>(); 
		String u_id="";
		String m_id="";
		magazine=mnd.mylist();
		recipe=rd.allList();
		
		if(session.getAttribute("u_id")!=null){
			u_id=(String)session.getAttribute("u_id");
			mypage=myd.mylist(u_id, m_id);
			request.setAttribute("mypage", mypage);
		}else if(session.getAttribute("m_id")!=null){
			m_id=(String)session.getAttribute("m_id");
			mypage=myd.mylist(u_id, m_id);
			request.setAttribute("mypage", mypage);
		}else{
			
		}
		
		request.setAttribute("magazine", magazine);
		request.setAttribute("recipe", recipe);
		
		return "savelist.jsp";
	}

}
