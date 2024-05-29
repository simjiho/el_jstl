package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.DBUtils;
import vo.GradeVO;
import vo.StudentVO;
import vo.SubjectVO;

public class PoDao {
	public int poInsert(GradeVO grade) throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			conn = DBUtils.getConnection();
			System.out.println("conn" + conn);
			ps = conn.prepareStatement("insert into grade_202205 values(?,?,?,?,?,?,?)");
			ps.setString(1, grade.getStudentid());
			ps.setString(2, grade.getSubjectcode());
			ps.setInt(3, grade.getMid());
			ps.setInt(4, grade.getFinals());
			ps.setInt(5, grade.getAttend());
			ps.setInt(6, grade.getReport());
			ps.setInt(7, grade.getEtc());
			n = ps.executeUpdate();
			if(n>0) {
				conn.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			conn.rollback();
		}finally {
			DBUtils.close(conn,ps);
		}
		return n;
	}
	public ArrayList<StudentVO> poList(){
		ArrayList<StudentVO> polist = new ArrayList<StudentVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("select a.studentid, a.studentname, a.jumin, b.subjectname, \r\n"
					+ " b.classification, b.professorname, \r\n"
					+ " c.mid, c.finals, c.attend, c.report, c.etc\r\n"
					+ " from  student_202205 a,  subject_202205 b, grade_202205 c\r\n"
					+ " where a.studentid = c.studentid and b.subjectcode = c.subjectcode\r\n"
					+ " order by b.subjectname asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				StudentVO vo = new StudentVO();
				vo.setStudentid(rs.getString("studentid"));
				vo.setStudentname(rs.getString("studentname"));
				vo.setJumin(rs.getString("jumin"));
				vo.setSubjectname(rs.getString("subjectname"));
				vo.setClassification(rs.getString("classification"));
				vo.setProfessorname(rs.getString("professorname"));
				vo.setMid(rs.getInt("mid"));
				vo.setFinals(rs.getInt("finals"));
				vo.setAttend(rs.getInt("attend"));
				vo.setReport(rs.getInt("report"));
				vo.setEtc(rs.getInt("etc"));
				polist.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBUtils.close(conn, ps, rs);
		}
		return polist;
	}
	public ArrayList<SubjectVO> scoreList(){
		ArrayList<SubjectVO> slist = new ArrayList<SubjectVO>();
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtils.getConnection();
			ps = conn.prepareStatement("select a.course, a.studentid, a.studentname, \r\n"
					+ " sum((b.mid*0.3)+(b.finals*0.3)+(b.attend*0.2)+(b.report*0.1)+(b.etc*0.1)) score, \r\n"
					+ " count(a.studentid) count, \r\n"
					+ " sum((b.mid*0.3)+(b.finals*0.3)+(b.attend*0.2)+(b.report*0.1)+(b.etc*0.1)) / count(a.studentid) score2\r\n"
					+ " from   student_202205 a, grade_202205 b\r\n"
					+ " where a.studentid = b.studentid\r\n"
					+ " group by a.course, a.studentid, a.studentname\r\n"
					+ " order by a.studentid asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				SubjectVO vo = new SubjectVO();
				vo.setCourse(rs.getString("course"));
				vo.setStudentid(rs.getString("studentid"));
				vo.setStudentname(rs.getString("studentname"));
				vo.setScore(rs.getInt("score"));
				vo.setCount(rs.getInt("count"));
				vo.setScore2(rs.getInt("score2"));
				slist.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			DBUtils.close(conn, ps, rs);
		}
		return slist;
	}
	
}
