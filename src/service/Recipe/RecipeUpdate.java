package service.Recipe;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import controller.CommandProcess;
import dao.RecipeDao;
import model.Recipe;

public class RecipeUpdate implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

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
		
		
		String r_image=mr.getFilesystemName("file");//이미지받기: input type name
		
		int pageNum=Integer.parseInt(mr.getParameter("pageNum"));
		int r_num=Integer.parseInt(mr.getParameter("r_num"));
		int r_kind=Integer.parseInt(mr.getParameter("r_kind"));
		String r_title=mr.getParameter("r_title");
		String r_ingredients=mr.getParameter("r_ingredients");
		String r_content=mr.getParameter("r_content");
		
		recipe.setR_num(r_num);
		recipe.setR_image(r_image);
		recipe.setR_kind(r_kind);
		recipe.setR_title(r_title);
		recipe.setR_ingredients(r_ingredients);
		recipe.setR_content(r_content);
		
		result=rd.update(recipe);
		
		request.setAttribute("result", result);
		request.setAttribute("r_num", r_num);
		request.setAttribute("pageNum", pageNum);
		
		return "update.jsp";
	}

}
