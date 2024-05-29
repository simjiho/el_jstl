package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import common.DBUtils;
import vo.MemberVO;

public class MemberDAO {
	public ArrayList<MemberVO> getList(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement("SELECT USERID, USERNAME, SUBSTR(JUMIN,5,2) JUMIN, \r\n"
					+ " DECODE(GENDER,'1','남','2','여') GENDER,\r\n"
					+ " ADDRESS, DECODE(JOBCD,'1','학생','2','회사원','3','공무원','4','군인','5','기타') JOBCD, \r\n"
					+ " DECODE(MAILRCV,'Y','수신함','N','수신하지않음') MAILRCV, INTRO FROM MEMBER_2024");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setAddress(rs.getString("address"));
				vo.setJobcd(rs.getString("jobcd"));
				vo.setMailrcv(rs.getString("mailrcv"));
				vo.setIntro(rs.getString("intro"));
				list.add(vo);
			}
			rs.close();
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<MemberVO> getSearch(String choice, String find){
		
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
						"SELECT USERID, USERNAME, SUBSTR(JUMIN,1,2) ||'-'||SUBSTR(JUMIN,3,2)||'-'||SUBSTR(JUMIN,5,2) JUMIN, \r\n"
						+ " DECODE(GENDER,'1','남','2','여') GENDER,\r\n"
						+ " DECODE(JOBCD,'1','학생','2','회사원','3','공무원','4','군인','5','기타')JOBCD \r\n"
						+ " FROM MEMBER_2024 WHERE "+choice+" like ? "
					);
			ps.setString(1, "%"+find+"%");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setUserid(rs.getString("userid"));
				vo.setUsername(rs.getString("username"));
				vo.setJumin(rs.getString("jumin"));
				vo.setGender(rs.getString("gender"));
				vo.setJobcd(rs.getString("jobcd"));
				list.add(vo);
			}
		} catch (Exception e) {
				e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}
	public int input(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"INSERT INTO MEMBER_2024 "
					+" VALUES(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, vo.getUserid());
			ps.setString(2, vo.getUsername());
			ps.setString(3, vo.getPasswd());
			ps.setString(4, vo.getJumin());
			ps.setString(5, vo.getGender());
			ps.setString(6, vo.getAddress());
			ps.setString(7, vo.getJobcd());
			ps.setString(8, vo.getMailrcv());
			ps.setString(9, vo.getIntro());
			n = ps.executeUpdate();
			
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	public MemberVO listOne(String userid) {
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		MemberVO vo = new MemberVO();
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					"SELECT * FROM MEMBER_2024 WHERE userid = ?");
			ps.setString(1, userid);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				vo.setUserid(rs.getString(1));
				vo.setUsername(rs.getString(2));
				vo.setPasswd(rs.getString(3));
				vo.setJumin(rs.getString(4));
				vo.setGender(rs.getString(5));
				vo.setAddress(rs.getString(6));
				vo.setJobcd(rs.getString(7));
				vo.setMailrcv(rs.getString(8));
				vo.setIntro(rs.getString(9));
			}
			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	public int update(MemberVO vo) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					" UPDATE MEMBER_2024 SET "
					+" USERNAME = ?, "
					+" PASSWD = ?, "
					+" JUMIN = ?, "
					+" GENDER = ?, "
					+" ADDRESS = ?, "
					+" JOBCD = ?, "
					+" MAILRCV = ?, "
					+" INTRO = ? "
					+" WHERE USERID = ? "
					);
			ps.setString(1, vo.getUsername());
			ps.setString(2, vo.getPasswd());
			ps.setString(3, vo.getJumin());
			ps.setString(4, vo.getGender());
			ps.setString(5, vo.getAddress());
			ps.setString(6, vo.getJobcd());
			ps.setString(7, vo.getMailrcv());
			ps.setString(8, vo.getIntro());
			ps.setString(9, vo.getUserid());
			
			n = ps.executeUpdate();
			
			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
	public int delete(String userid) {
		Connection con = null;
		PreparedStatement ps = null;
		int n = 0;
		
		try {
			con = DBUtils.getConnection();
			ps = con.prepareStatement(
					" DELETE FROM MEMBER_2024 "
					+" WHERE USERID = ? "
					);
			ps.setString(1, userid);
			n = ps.executeUpdate();
			
			ps.close();
			con.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return n;
	}
}