package service.Member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CommandProcess;
import dao.MemberDao;
import model.Member;

public class MemberList implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session=request.getSession();
		final int ROWPERPAGE=10;
		final int PAGEPERBLOCK=7;
		
		String m_id=(String)session.getAttribute("m_id");
		System.out.println("m_id ="+m_id);
		String pageNum=request.getParameter("pageNum");
		
		if(pageNum==null||pageNum.equals("")){
			pageNum="1";
		}
		
		MemberDao md=MemberDao.getInstance();
		
		int currentPage=Integer.parseInt(pageNum);
		int total=md.getTotal();
		int totPage=(int)Math.ceil((double)total/ROWPERPAGE);
		int startRow=(currentPage-1)*ROWPERPAGE-1;
		int endRow=startRow+ROWPERPAGE-1;
		int startPage=currentPage-(currentPage-1)%PAGEPERBLOCK;
		int endPage=startPage+PAGEPERBLOCK-1;
		if(endPage>totPage){
			endPage=totPage;
		}
		
		List<Member> list=md.list(startRow,endRow);
		
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
