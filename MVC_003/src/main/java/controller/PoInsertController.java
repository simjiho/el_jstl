package controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.PoService;
import vo.GradeVO;

public class PoInsertController implements Controller{
	
	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
	
		if(req.getMethod().equals("POST")) {
			return processInsertService(req, resp);
		}else if (req.getMethod().equals("GET")) {
			return "poInsert";
		}
		return "redirect::/";
	}
	private String processInsertService(HttpServletRequest req, HttpServletResponse resp) {
		
		String studentid = req.getParameter("studentid");
		String subjectcode = req.getParameter("subjectcode");
		int mid = Integer.parseInt(req.getParameter("mid"));
		int finals = Integer.parseInt(req.getParameter("finals"));
		int attend = Integer.parseInt(req.getParameter("attend"));
		int report = Integer.parseInt(req.getParameter("report"));
		int etc = Integer.parseInt(req.getParameter("etc"));
		
		GradeVO grade = new GradeVO();
		grade.setStudentid(studentid);
		grade.setSubjectcode(subjectcode);
		grade.setMid(mid);
		grade.setFinals(finals);
		grade.setAttend(attend);
		grade.setReport(report);
		grade.setEtc(etc);
		
		PoService service = new PoService();
		int n = 0;
		try {
			n = service.PoInsert(grade);
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		if(n>0) {
			return "redirect::PoList";
		}else {
			return "PoInsert";
		}
	}
}
