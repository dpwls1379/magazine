package service.Recipe;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MypageDao;
import dao.RecipeDao;
import model.Mypage;

public class RecipeSaveit implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		MypageDao myd=MypageDao.getInstance();
		RecipeDao rd=RecipeDao.getInstance();
		Mypage mypage=new Mypage();
		int result=0;
		String u_id=(String) session.getAttribute("u_id");
		String m_id=(String) session.getAttribute("m_id");
		int r_num=Integer.parseInt(request.getParameter("r_num"));
		String pageNum=request.getParameter("pageNum");
		rd.saveitUp(r_num);
		if(u_id!=null){
			mypage.setR_num(r_num);
			mypage.setU_id(u_id);
			result=myd.userSave(mypage);
		}
		if(m_id!=null){
			mypage.setM_id(m_id);
			mypage.setR_num(r_num);
			result=myd.mgrSave(mypage);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("r_num", r_num);
		request.setAttribute("pageNum", pageNum);
		
		return "save.jsp";
	}

}
