package subject;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import common.MybatisConfig;
import vo.Detail;
import vo.FlagVO;
import vo.Student;
import vo.StudentBan;
import vo.Subject;
import vo.Teacher;

public class subjectDao {


	SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory();
	SqlSession sqlSession = null;
	
	/*public List<Student> getListname(int flag, String class_num) {
		List<Student> studentList = null;
		// TODO Auto-generated method stub
		HashMap<String, Object> hashmap = new HashMap<>();
		hashmap.put("flag", flag);
		hashmap.put("class_num",class_num);
		
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
	}*/

	public void detailUpdate(HashMap<String, Object> map) {
		try {
			sqlSession = factory.openSession();
			sqlSession.update("subject.deleteUpdate", map);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}


	public void insertSubject(Subject sub) {
		// TODO Auto-generated method stub
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("subject.insertSubject", sub);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}

	public List<Teacher> teacherList(String subject) {
		List<Teacher>teacherLists=null;
		try {
			sqlSession = factory.openSession();
			teacherLists=sqlSession.selectList("subject.teacherLists",subject);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return teacherLists;
	}

	public List<Subject> subjectList() {
		List<Subject>subjectLists=null;
		try {
			sqlSession = factory.openSession();
			subjectLists=sqlSession.selectList("subject.subjectLists");
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return subjectLists;
	}

	public void deleteSubject(int deleteKey) {
		try {
			sqlSession = factory.openSession();
			sqlSession.delete("subject.deleteSubject", deleteKey);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}

	public Subject selectSubject(int deleteKey) {
		Subject subj=null;
		try {
			sqlSession = factory.openSession();
			subj=sqlSession.selectOne("selectSubject", deleteKey);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return subj;
		
	}

	public void detailInsert(Detail det) {
		System.out.println("들어와줭");
		try {
			sqlSession = factory.openSession();
			sqlSession.insert("subject.detailInsert", det);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}

	public List<Detail> detailLists(int deleteKey) {
		List<Detail>detailLists=null;
		try {
			sqlSession = factory.openSession();
			detailLists=sqlSession.selectList("subject.detailLists",deleteKey);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return detailLists;
	}

	public void detailDelete(int deleteKey) {
		System.out.println("들어와줭");
		try {
			sqlSession = factory.openSession();
			sqlSession.delete("subject.detailDelete", deleteKey);
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
	}

	public List<FlagVO> flagLists() {
		List<FlagVO>flagLists=null;
		try {
			sqlSession = factory.openSession();
			flagLists=sqlSession.selectList("subject.flagLists");
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return flagLists;
	}

	public List<StudentBan> selLists() {
		List<StudentBan>selLists=null;
		try {
			sqlSession = factory.openSession();
			selLists=sqlSession.selectList("subject.selLists");
			sqlSession.commit();
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return selLists;
	}

	public List<Teacher> selectTeacherLists2(String teacher1) {
		
		List<Teacher>teacherLists=null;
		try {
			sqlSession = factory.openSession();
			teacherLists=sqlSession.selectList("subject.selectTeacherLists2",teacher1);
			sqlSession.commit();
			System.out.println(teacherLists+"ppp");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return teacherLists;
	}

	public void deleteSubject1(HashMap<String, Object> map) {
		try {
			sqlSession = factory.openSession();
			sqlSession.delete("subject.deleteSubject1", map);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}

	public List<StudentBan> selLists1(String flag) {
		List<StudentBan>selLists=null;
		try {
			sqlSession = factory.openSession();
			selLists=sqlSession.selectList("subject.selLists1",flag);
		
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return selLists;
	}

	public String teachername(String id) {
		String key=null;
		try {
			sqlSession = factory.openSession();
			key=sqlSession.selectOne("subject.teachername",id);
			System.out.println(key+"dao");
			sqlSession.commit();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return key;
	}

	public List<Subject> subjectList1(HashMap<String, Object> map) {
		List<Subject>subjectLists=null;
		try {
			sqlSession = factory.openSession();
			subjectLists=sqlSession.selectList("subject.subjectLists1",map);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return subjectLists;
	}

	public void updateSubject(Subject subj) {
		System.out.println(subj+"bbb");
		System.out.println(subj+"bbb");
		try {
			sqlSession = factory.openSession();
			sqlSession.update("subject.updateSubject", subj);
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		
	}

	public List<Subject> selectIt() {
		List<Subject>subjectLists=null;
		try {
			sqlSession = factory.openSession();
			subjectLists=sqlSession.selectList("subject.selectIt");
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return subjectLists;
	}

	public List<Subject> selectNihon() {
		List<Subject>subjectLists=null;
		try {
			sqlSession = factory.openSession();
			subjectLists=sqlSession.selectList("subject.selectNihon");
			sqlSession.commit();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if(sqlSession!=null) sqlSession.close();
		}
		return subjectLists;
	}

}
