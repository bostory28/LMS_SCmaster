package attendance;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Attendance;
import vo.StatementVo;
import vo.Student;
import common.MybatisConfig;

public class AttendanceDao {

	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession = null;
	
	public List<Student> getListname(int flag, String class_num) {
		List<Student> studentList = null;
		// TODO Auto-generated method stub
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("class_num",class_num);
		System.out.println(flag);
		System.out.println(class_num);
		
		try {
			sqlSession = factory.openSession();
			studentList = sqlSession.selectList("attendance.getNameList", hashmap);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		return studentList;
	}
	
	public void insertAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("attendance.insertAttendance", attendance);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}
	public void updateAttendance(Attendance attendance) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("attendance.updateAttendance", attendance);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}
	public List<Attendance> getAttendanceList(int flag, String class_num,
			String year, String month) {
		// TODO Auto-generated method stub
		List<Attendance> attendanceList = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		
		hashmap.put("flag", flag);
		hashmap.put("class_num", class_num);
		hashmap.put("attendance_date", year+month);
		
		try {
			sqlSession = factory.openSession();
			attendanceList = sqlSession.selectList("attendance.selectAttendanceList", hashmap);
			System.out.println(attendanceList.size());
			System.out.println(attendanceList.size());
			System.out.println(attendanceList+"aaa");
			
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		return attendanceList;
	}

	public List<Attendance> getAttendanceList2(int flag, String class_num,
			String year, String month, String day) {
		System.out.println("getAttendanceList2 들어옴!!");
		// TODO Auto-generated method stub
		List<Attendance> attendanceList = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		
		hashmap.put("flag", flag);
		hashmap.put("class_num", class_num);
		hashmap.put("attendance_date", year+month+day);
		
		try {
			sqlSession = factory.openSession();
			attendanceList = sqlSession.selectList("attendance.selectAttendanceList2", hashmap);
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		return attendanceList;
	}

	public List<String> getFlagList() {
		List<String> flagList = null;
		
		try {
			sqlSession = factory.openSession();
			flagList = sqlSession.selectList("attendance.getFlagList");
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		
		return flagList;
	}

	public List<String> getClass_numList() {
		List<String> class_numList = null;
		
		try {
			sqlSession = factory.openSession();
			class_numList = sqlSession.selectList("attendance.getClass_numList");
			sqlSession.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
		
		return class_numList;
	}

	
	/*
	 * 
	 * 
	 * 여기서 부터는 사유서 관련 다오 입니다.
	 * 
	 * 
	 * */
	
	public StatementVo getStatement(String statement_key) {
		// TODO Auto-generated method stub
		StatementVo statement = null;
		
		try {
			sqlSession = factory.openSession();
			statement = sqlSession.selectOne("attendance.getStatement", statement_key);
			sqlSession.commit();	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return statement;
	}

	public void insertStatement(StatementVo statementVo) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("attendance.insertStatement", statementVo);
			sqlSession.commit();	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}

	public void updateStatement(StatementVo statementVo) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.update("attendance.updateStatement", statementVo);
			sqlSession.commit();	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}



	

	
	
}
