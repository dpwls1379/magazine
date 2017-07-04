package service.BoardR;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.CommandProcess;
import dao.BoardRDao;
import model.BoardR;

public class BoardRDeleteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int r_num=Integer.parseInt(request.getParameter("r_num"));
		int br_num = Integer.parseInt(request.getParameter("br_num"));

		request.setAttribute("r_num", r_num);
		request.setAttribute("br_num", br_num);

		return "bRdeleteFrom.jsp";

	}
}
