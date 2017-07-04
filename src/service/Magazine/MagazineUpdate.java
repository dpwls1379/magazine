package service.Magazine;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandProcess;
import dao.MagazineDao;
import model.Magazine;

public class MagazineUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		MagazineDao md=MagazineDao.getInstance();
		Magazine magazine=new Magazine();	
		int result=0;

		MultipartRequest mr=null;
		String real=request.getSession().getServletContext().getRealPath("/uploadM");
		int maxSize=10*1024*1024;//10mb
			
		try {
			mr=new MultipartRequest(request, real, maxSize, 
					"utf-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		String pageNum=request.getParameter("pageNum");
		
		String ma_image=mr.getFilesystemName("file");
		
		int ma_num=Integer.parseInt(mr.getParameter("ma_num"));
		String ma_title=mr.getParameter("ma_title");
		String ma_content=mr.getParameter("ma_content");
		int ma_kind=Integer.parseInt(mr.getParameter("ma_kind"));
		
		magazine.setMa_kind(ma_kind);
		magazine.setMa_num(ma_num);
		magazine.setMa_image(ma_image);
		magazine.setMa_content(ma_content);
		magazine.setMa_title(ma_title);
		
		result=md.update(magazine);
		
		request.setAttribute("result", result);
		request.setAttribute("ma_num", ma_num);
		request.setAttribute("pageNum", pageNum);
		
		return "update.jsp";
	}

}
