package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.PoService;
import vo.SubjectVO;

public class PoScoreController implements Controller{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) throws 
	ServletException, IOException{
		PoService service = new PoService();
		ArrayList<SubjectVO> slist = service.scoreList();
		
		req.setAttribute("slist", slist);
		
		return "poScoreList";
	}
}
