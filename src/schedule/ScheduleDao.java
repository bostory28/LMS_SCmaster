package schedule;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.MybatisConfig;
import vo.Schedule;
import vo.Subject;
import vo.TestVO;

public class ScheduleDao {
	
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession = null;
	

	public List<Subject> getSubjectList(String flag) {
		// TODO Auto-generated method stub
		List<Subject> subjectList  = null;
		
		try {
			sqlSession = factory.openSession();
			subjectList = sqlSession.selectList("schedule.getSubjectList", flag);
			sqlSession.commit();	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}
		return subjectList;
	}


	public List<TestVO> getTestList(String flag) {
		// TODO Auto-generated method stub
		List<TestVO> testList = null;
		
		try {
			sqlSession = factory.openSession();
			testList = sqlSession.selectList("schedule.getTestList", flag);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}
		return testList;
	}


	public void insertSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("schedule.insertSchedule", schedule);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}
	}


	public List<Schedule> getScheduleList(String flag) {
		// TODO Auto-generated method stub
		List<Schedule> scheduleList = null;
		try {
			sqlSession = factory.openSession();
			scheduleList = sqlSession.selectList("schedule.getScheduleList", flag);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}		
		return scheduleList;
	}


	public void updateSchedule(Schedule schedule) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.update("schedule.updateSchedule", schedule);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}	
	}


	public void deleteSchedule(int schedule_seq) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.delete("schedule.deleteSchedule", schedule_seq);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (sqlSession != null) sqlSession.close();
		}
	}
}
