package service.Manager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;

public class MgrDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int r_num=0,b_num=0,ma_num=0;
		if(request.getParameter("r_num")!=null && request.getParameter("r_num")!=""){
			r_num=Integer.parseInt(request.getParameter("r_num"));
			request.setAttribute("r_num", r_num);
		}else if(request.getParameter("b_num")!=null && request.getParameter("b_num")!=""){
			b_num=Integer.parseInt(request.getParameter("b_num"));
			request.setAttribute("b_num", b_num);
		}else if(request.getParameter("ma_num")!=null && request.getParameter("b_num")!=""){
			ma_num=Integer.parseInt(request.getParameter("ma_num"));
			request.setAttribute("ma_num", ma_num);
		}
		System.out.println("r_num"+r_num+", b_num"+b_num+", ma_num"+ma_num);
		
		return "mgrDelForm.jsp";
	}

}
