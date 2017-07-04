package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MagazineDao;
import dao.ManagerDao;

public class MagazineDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int result=0;
		int ma_num=Integer.parseInt(request.getParameter("ma_num"));
		String pageNum=request.getParameter("pageNum");
		String m_id=request.getParameter("m_id");
		String m_passwd=request.getParameter("m_passwd");
		
		ManagerDao mnd=ManagerDao.getInstance();
		MagazineDao md=MagazineDao.getInstance();
		
		if(mnd.check(m_id, m_passwd)!=1){
			result=0;
		}else{
			result=md.delete(ma_num);
		}
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("ma_num", ma_num);
		
		return "delete.jsp";
	}

}
