package service.Magazine;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MagazineDao;
import model.Magazine;

public class MagazineUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		int ma_num=Integer.parseInt(request.getParameter("ma_num"));
		String pageNum=request.getParameter("pageNum");
		
		Magazine magazine=new Magazine();
		MagazineDao md=MagazineDao.getInstance();
		
		magazine=md.select(ma_num);
		
		request.setAttribute("magazine", magazine);
		request.setAttribute("pageNum", pageNum);
		
		return "updateForm.jsp";
	}

}
