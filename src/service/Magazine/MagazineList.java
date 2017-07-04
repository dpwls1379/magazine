package service.Magazine;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.MagazineDao;
import dao.RecipeDao;
import model.Magazine;
import model.Recipe;

public class MagazineList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		final int ROWPERPAGE=10;
		final int PAGEPERBLOCK=7;
		
		String pageNum=request.getParameter("pageNum");
		
		int ma_kind = Integer.parseInt(request.getParameter("ma_kind") == null ? "0" : request.getParameter("ma_kind"));
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";// 무조건 1페이지
		}
		
		MagazineDao md= MagazineDao.getInstance();
		
		
		int currentPage=Integer.parseInt(pageNum);//1page
		int total=md.getTotal(ma_kind); 
		int totPage=(int)Math.ceil((double)total/ROWPERPAGE);
		int startPage=currentPage-(currentPage-1)%PAGEPERBLOCK;
		int endPage=startPage+PAGEPERBLOCK-1;
		if(endPage>totPage){
			endPage=totPage;
		}
		int startRow=(currentPage-1)*ROWPERPAGE+1;//시작번호(1번부터)
		int endRow=startRow+ROWPERPAGE-1;//마지막번호(10번까지 갖고와)
		int number=total-startRow+1;
		
		List<Magazine> list=md.list(startRow,endRow,ma_kind);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("number", number);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("total", total);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startRow", startRow);
		request.setAttribute("endRow", endRow);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGEPERBLOCK", PAGEPERBLOCK);
		request.setAttribute("ROWPERPAGE", ROWPERPAGE);
		request.setAttribute("list", list);
		
		
		return "list.jsp";
	}

}
