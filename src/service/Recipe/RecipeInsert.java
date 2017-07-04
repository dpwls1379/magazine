package service.Recipe;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import controller.CommandProcess;
import dao.RecipeDao;
import model.Recipe;
public class RecipeInsert implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		int result = 0;
		
		RecipeDao rd=RecipeDao.getInstance();
		Recipe recipe=new Recipe();	

		MultipartRequest mr=null;
		String real=request.getSession().getServletContext().getRealPath("/uploadR");
		int maxSize=10*1024*1024;//10mb
			
		try {
			mr=new MultipartRequest(request, real, maxSize, 
					"utf-8",new DefaultFileRenamePolicy());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		
		String r_image=mr.getFilesystemName("file");//input type name
		
		if(session.getAttribute("u_id")!=null){
			String u_id=(String) session.getAttribute("u_id");
			recipe.setU_id(u_id);
		}else if(session.getAttribute("m_id")!=null){
			String m_id=(String) session.getAttribute("m_id");
			recipe.setM_id(m_id);
		}
		
		int r_kind=Integer.parseInt(mr.getParameter("r_kind"));
		String r_title=mr.getParameter("r_title");
		String r_ingredients=mr.getParameter("r_ingredients");
		String r_content=mr.getParameter("r_content");
		
		recipe.setR_image(r_image);
		recipe.setR_kind(r_kind);
		recipe.setR_title(r_title);
		recipe.setR_ingredients(r_ingredients);
		recipe.setR_content(r_content);
		
		result=rd.insert(recipe);
		
		request.setAttribute("result", result);
		
		return "insert.jsp";
	}

}
