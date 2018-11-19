package test.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sun.org.apache.bcel.internal.generic.ISUB;

import vo.FlagVO;
import vo.Teacher;
import vo.TestSubTeaVO;
import vo.TestVO;
import common.MybatisConfig;

public class TestDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
/*************************************과목별 시험등록*****************************************/
	//field별로 과목을 가져온다.
	public List<String> getSubject(String field, String flag) {
		List<String> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("field", field);
		try {
			session = factory.openSession();
			list = session.selectList("test.getSubject", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//flag를 가져온다.
	public List<FlagVO> getFlag() {
		List<FlagVO> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getFlag");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//
	public List<String> getClassOfFlag(String flag) {
		List<String> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getClassOfFlag", flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//검색기능
	public List<TestSubTeaVO> getTest(String flag, String online, String subject, String class_num, String field) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		if(subject.equals("전체")) {
			subject = "";
		}
		if(class_num.equals("전체")) {
			class_num = "";
		}
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("online", online);
		hashmap.put("subject", subject);
		hashmap.put("class_num", class_num);
		hashmap.put("field", field);
		try {
			session = factory.openSession();
			list = session.selectList("test.getTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//일괄 출력
	public List<TestSubTeaVO> getUnitedTest(String flag, String field) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("field", field);
		try {
			session = factory.openSession();
			list = session.selectList("test.getUnitedTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	
	public List<String> getSubjectOfFlag(String field, String flag) {
		List<String> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("field", field);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			list = session.selectList("test.getSubjectOfFlag", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	
	//시험을 일괄 등록한다.
	public void insertTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//과목명이 동일한 seq를 가져온다.
	public List<Integer> getSeqOfSubject(String subjectname) {
		List<Integer> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getSeqOfSubject", subjectname);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	public List<Integer> getSeqOfTest(String subjectname, String testname, String flag) {
		List<Integer> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("subjectname", subjectname);
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			list = session.selectList("test.getSeqOfTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험일괄삭제
	public void deleteTest(int test_seq) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.delete("test.deleteTest", test_seq);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//editForm을 구성하기 위해 선택한 data의 정보를 가져온다.
	public TestSubTeaVO getOneUnitedTest(String subjectname, String testname, String flag) {
		TestSubTeaVO vo = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("subjectname", subjectname);
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			vo = session.selectOne("test.getOneUnitedTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return vo;
	}
	//일괄수정한다.
	public void editTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.editTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//시험 본 학생의 리스트를 가져온다.
	public List<TestSubTeaVO> getStudentOfTest(TestSubTeaVO vo) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getStudentOfTest", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//학생의 시험 본 점수를 등록한다.
	public void insertScore(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertScore", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//이미 성적입력한 시험인지 알기위해 이미 등록한 시험이면 성적을 가져온다.
	public List<TestSubTeaVO> getAlreadyInsertGrade(TestSubTeaVO vo) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getAlreadyInsertGrade", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적수정입력폼을 만들기 위해 기존의 이름과 성적을 가져온다.
	public List<TestSubTeaVO> getGradeOfStudent(TestSubTeaVO vo) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getGradeOfStudent", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적을 수정한다.
	public void editScore(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.editScore", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
/*************************************역량평가 시험등록*****************************************/
	//이전에 입력했던 역량평가의 리스트를 출력한다.
	public List<TestSubTeaVO> getInitCapacity(String flag) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getInitCapacity", flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//기수에 몇개의 역량평가가 등록되었는지 확인한다.
	public List<String> getNumOfCapacity(String flag) {
		List<String> list = null;
		SqlSession session = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getNumOfCapacity", flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//역량평가시험을 등록한다.
	public void insertCapacityTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertCapacityTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//해당 flag와 해당 역량평가를 가져온다.수정을 위해서
	public TestSubTeaVO getCapacityForEdit(String flag, String testname) {
		TestSubTeaVO vo = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("testname", testname);
		try {
			session = factory.openSession();
			vo = session.selectOne("test.getCapacityForEdit", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return vo;
	}
	//역량평가 정보를 수정한다.
	public void updateValueOfCapacity(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.updateValueOfCapacity", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//선택한 역량평가의 정보를 가져온다.
	public List<TestSubTeaVO> getTestOfCapacity(String flag, String testname) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("testname", testname);
		try {
			session = factory.openSession();
			list = session.selectList("test.getTestOfCapacity", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//역량평가 삭제기능
	public void deleteTestOfCapacity(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.delete("test.deleteTestOfCapacity", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//역량평가를 본 학생을 가져온다.
	public List<TestSubTeaVO> getStudentOfCapacity(String flag, String testname) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("testname", testname);
		try {
			session = factory.openSession();
			list = session.selectList("test.getStudentOfCapacity", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//역량평가의 testid를 가져온다.성적을 입력하기 위해
	public List<Integer> getTestidOfCapacity(String flag, String testname) {
		List<Integer> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("testname", testname);
		try {
			session = factory.openSession();
			list = session.selectList("test.getTestidOfCapacity", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적을 입력한다. 
	public void insertScoreOfCapacity(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertScoreOfCapacity", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//수정을 위해 점수를 가져온다.
	public List<TestSubTeaVO> getScoreOfCapacity(String flag, String testname) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("testname", testname);
		try {
			session = factory.openSession();
			list = session.selectList("test.getScoreOfCapacity", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//점수를 수정한다.
	public void updateScoreOfCapacity(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.updateScoreOfCapacity", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
/************************************************일본어 매일시험********************************************	*/
	//반을 가져온다.
	public List<String> getClassOfJap(String field, String flag) {
		List<String> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("field", field);
		try {
			session = factory.openSession();
			list = session.selectList("test.getClassOfJap", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험의 목록을 가져온다.
	public List<TestSubTeaVO> getDailyOfTest(String field, String flag, String class_num) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("field", field);
		hashmap.put("class_num", class_num);
		try {
			session = factory.openSession();
			list = session.selectList("test.getDailyOfTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험을 등록한다.
	public void insertDailyTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertDailyTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//과목명과 과목id를 가져오기위해
	public List<TestSubTeaVO> getSubjectOfDaily(String class_num, String flag) {
		List<TestSubTeaVO> list = null;
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("class_num", class_num);
		try {
			session = factory.openSession();
			list = session.selectList("test.getSubjectOfDaily", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//매일성적을 보는 사람들을 가져온다.
	public List<TestSubTeaVO> getStudentOfDaily(int test_seq, String testname, String flag, String subjectname, String class_num) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("testname", testname);
		hashmap.put("test_seq", test_seq);
		hashmap.put("flag", flag);
		hashmap.put("subjectname", subjectname);
		hashmap.put("class_num", class_num);
		try {
			session = factory.openSession();
			list = session.selectList("test.getStudentOfDaily", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적을 입력한다.
	public void insertScoreOfDaily(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertScoreOfDaily", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//수정폼을 위해 학생의 점수를 가져온다.
	public List<TestSubTeaVO> getScoreOfDaily(int test_seq, String testname, String flag, String subjectname) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("test_seq", test_seq);
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		hashmap.put("subjectname", subjectname);
		try {
			session = factory.openSession();
			list = session.selectList("test.getScoreOfDaily", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험성적을 업데이트
	public void updateScoreOfDaily(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.updateScoreOfDaily", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//시험을 삭제한다.
	public void deleteTestOfDaily(int testid) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.delete("test.deleteTestOfDaily", testid);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//각 반의 학생의 수를 가져온다.
	public int getStudentNumOfDaily(String class_num, String flag) {
		SqlSession session = null;
		int num = 0;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("class_num", class_num);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			num = session.selectOne("test.getStudentNumOfDaily", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return num;
	}
/**********************************************월말평가시험**********************************************/
	//시험등록을 위해 사전에 반과 과목의 seq를 가져온다.
	public List<TestSubTeaVO> getJapTestOfMonth(String field, String flag) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("field", field);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			list = session.selectList("test.getJapTestOfMonth", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험을 등록한다.
	public void insertMonthOfTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertMonthOfTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//시험목록을 가져온다.
	public List<TestSubTeaVO> getMonthOfTest(String flag) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getMonthOfTest", flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//수정을 위해서 수정 정보를 가져온다.
	public TestSubTeaVO getMonthOfOneTest(String flag, String testname) {
		SqlSession session = null;
		TestSubTeaVO vo = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			vo = session.selectOne("test.getMonthOfOneTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return vo;
	}
	//같은 이름의 시험을 모두 가져온다. 수정하기 위해
	public List<TestSubTeaVO> getMonthPerTest(String flag, String testname) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			list = session.selectList("test.getMonthPerTest", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험을 수정한다.
	public void editMonthTest(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.editMonthTest", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//시험을 삭제한다.
	public void deleteMonthTest(String testname, String flag) {
		SqlSession session = null;
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("testname", testname);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			session.delete("test.deleteMonthTest", hashmap);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//검색한 내용을 가져온다.
	public List<TestSubTeaVO> getMonthSearched(String flag, String class_num) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		if(class_num.equals("전체")) {
			class_num = "";
		}
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("class_num", class_num);
		hashmap.put("flag", flag);
		try {
			session = factory.openSession();
			list = session.selectList("test.getMonthSearched", hashmap);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//시험을 본 학생을 가져온다.
	public List<TestSubTeaVO> getStudentOfMonth(TestSubTeaVO vo) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getStudentOfMonth", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적을 입력한다.
	public void insertGradeMonth(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.insert("test.insertGradeMonth", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//성적폼을 위해서 score를 가져온다.
	public List<TestSubTeaVO> getScoreOfMonth(TestSubTeaVO vo) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		try {
			session = factory.openSession();
			list = session.selectList("test.getScoreOfMonth", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return list;
	}
	//성적 수정
	public void updateGradeMonth(TestSubTeaVO vo) {
		SqlSession session = null;
		try {
			session = factory.openSession();
			session.update("test.updateGradeMonth", vo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
	}
	//기수의 학생의 수를 가져온다.
	public int getNumOfFlag(String flag) {
		SqlSession session = null;
		int num = 0;
		try {
			session = factory.openSession();
			num = session.selectOne("test.getNumOfFlag", flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return num;
	}
	//이미있는 월말 시험을 가져온다.
	public boolean getAlreadyMonth(TestSubTeaVO vo) {
		SqlSession session = null;
		List<TestSubTeaVO> list = null;
		boolean check = false;
		try {
			session = factory.openSession();
			list = session.selectList("test.getAlreadyMonth", vo);
			if(list.size() == 0) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session != null) session.close(); 
		}
		return check;
	}
}
