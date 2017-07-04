package service.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.BoardADao;
import dao.BoardRDao;
import dao.MagazineDao;
import dao.ManagerDao;
import dao.RecipeDao;

public class MgrDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int r_num = 0, b_num = 0, ma_num = 0, result = 0;
		String m_id = (String) session.getAttribute("m_id");
		String m_passwd = request.getParameter("m_passwd");

		RecipeDao rd = RecipeDao.getInstance();
		MagazineDao mnd = MagazineDao.getInstance();
		BoardADao bd = BoardADao.getInstance();
		ManagerDao md = ManagerDao.getInstance();
		BoardRDao brd = BoardRDao.getInstance();

		result = md.check(m_id, m_passwd);

		if (result > 0) {
			if (request.getParameter("r_num") != null && request.getParameter("r_num") != "") {
				r_num = Integer.parseInt(request.getParameter("r_num"));
				result = rd.realDel(r_num);
				if (result > 0) {
					result = brd.realDel(r_num);
					System.out.println("boardR="+result);
				} else {
					result = 0;
				}
			} else if (request.getParameter("b_num") != null && request.getParameter("b_num") != "") {
				b_num = Integer.parseInt(request.getParameter("b_num"));
				result = bd.realDel(b_num);
			} else if (request.getParameter("ma_num") != null && request.getParameter("ma_num") != "") {
				ma_num = Integer.parseInt(request.getParameter("ma_num"));
				result = mnd.realDel(ma_num);
			} else {
				result = 0;
			}
		}

		request.setAttribute("result", result);

		return "mgrDel.jsp";
	}

}
