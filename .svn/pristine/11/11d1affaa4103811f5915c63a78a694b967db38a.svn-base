package trouble;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.opensymphony.xwork2.ActionContext;

import common.MybatisConfig;
import vo.Student;
import vo.Teacher;
import vo.Trouble;
import vo.TroubleResponse;

public class troubleDao {
	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession = null;
	public void troubleInsert(Trouble tro) {
		// TODO Auto-generated method stub
				try {
					sqlSession = factory.openSession();
					sqlSession.insert("trouble.troubleInsert", tro);
					sqlSession.commit();
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if(sqlSession!=null) sqlSession.close();
				}
		
	}
	public List<Trouble> troubleLists(String keyValue) {
		List<Trouble>troubleLists=null;
		try {
			sqlSession = factory.openSession();
			troubleLists=sqlSession.selectList("trouble.troubleLists",keyValue);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return troubleLists;
	}
	
	public Trouble troubleRead(int readKey) {
		Trouble trou=null;
		
		try {
			sqlSession = factory.openSession();
			trou=sqlSession.selectOne("trouble.troubleRead",readKey);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return trou;
	}
	public List<Teacher> teacherLists() {
		List<Teacher>teacherLists=null;
		try {
			sqlSession = factory.openSession();
			teacherLists=sqlSession.selectList("trouble.teacherLists");
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return teacherLists;
	}
	public void insertResponse(TroubleResponse trour) {
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("trouble.insertResponse", trour);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}
	public void updateCheck(int counsel_seq) {
		try {
			sqlSession = factory.openSession();
			sqlSession.update("trouble.updateCheck", counsel_seq);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}
	public List<Trouble> troubleStudent(String studentid) {
		List<Trouble>troubleLists=null;
		try {
			sqlSession = factory.openSession();
			troubleLists=sqlSession.selectList("trouble.troubleStudent",studentid);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return troubleLists;
		
	}
	public List<Trouble> troubleAdmin() {
		List<Trouble>troubleLists=null;
		try {
			sqlSession = factory.openSession();
			troubleLists=sqlSession.selectList("trouble.troubeAdmin");
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return troubleLists;
	}
	public TroubleResponse answerStudent(int readKey) {
		TroubleResponse tbrp=null;
		try {
			sqlSession = factory.openSession();
			tbrp=sqlSession.selectOne("trouble.answerStudent",readKey);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return tbrp;
	}

}
