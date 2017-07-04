package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MagazineDao;
import dao.MypageDao;
import dao.RecipeDao;
import model.Mypage;

public class MagazineSaveit implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MypageDao myd = MypageDao.getInstance();
		Mypage mypage = new Mypage();
		int result = 0;
		String u_id = (String) session.getAttribute("u_id");
		String m_id = (String) session.getAttribute("m_id");
		int ma_num = Integer.parseInt(request.getParameter("ma_num"));
		String pageNum = request.getParameter("pageNum");
		if (u_id != null) {
			mypage.setMa_num(ma_num);
			mypage.setU_id(u_id);
			result = myd.userSave(mypage);
		}
		if (m_id != null) {
			mypage.setM_id(m_id);
			mypage.setMa_num(ma_num);
			result = myd.mgrSave(mypage);
		}

		request.setAttribute("result", result);
		request.setAttribute("ma_num", ma_num);
		request.setAttribute("pageNum", pageNum);

		return "save.jsp";
	}
}
