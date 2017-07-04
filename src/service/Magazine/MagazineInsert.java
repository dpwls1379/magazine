package service.Magazine;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.CommandProcess;
import dao.MagazineDao;
import model.Magazine;

public class MagazineInsert implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = 0;
		
		MagazineDao md=MagazineDao.getInstance();
		Magazine magazine=new Magazine();	

		MultipartRequest mr=null;
		String real=request.getSession().getServletContext().getRealPath("/uploadM");
		int maxSize=10*1024*1024;//10mb
			
		try {
			mr=new MultipartRequest(request, real, maxSize, 
					"utf-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		
		String ma_image=mr.getFilesystemName("file");//input type name
		
		
		String m_id=mr.getParameter("m_id");
		int ma_kind=Integer.parseInt(mr.getParameter("ma_kind"));
		String ma_title=mr.getParameter("ma_title");
		String ma_content=mr.getParameter("ma_content");
		
		magazine.setM_id(m_id);
		magazine.setMa_kind(ma_kind);
		magazine.setMa_image(ma_image);
		magazine.setMa_title(ma_title);
		magazine.setMa_content(ma_content);
		
		result=md.insert(magazine);
		
		request.setAttribute("result", result);
		
		return "insert.jsp";
	}

}
