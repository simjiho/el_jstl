package biz;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.PoDao;
import vo.GradeVO;
import vo.StudentVO;
import vo.SubjectVO;

public class PoService {
	PoDao dao = new PoDao();
	
	public int PoInsert(GradeVO grade) throws SQLException{
		int n = dao.poInsert(grade);
		return n;
	}
	public ArrayList<StudentVO> poList(){
		ArrayList<StudentVO> polist = dao.poList();
		return polist;
	}
	public ArrayList<SubjectVO> scoreList(){
		ArrayList<SubjectVO> slist = dao.scoreList();
		return slist;
	}
}
