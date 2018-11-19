package prob;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Board;
import vo.Prob_List;
import vo.Problem;
import vo.Score;
import vo.TestVO;
import common.MybatisConfig;


public class ProbDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory(); 
	SqlSession ss = null;

	
	public void insertProb(Problem problem) {
		
		//문제가 객관식이라면 
		if(problem.getProb_type().equals("obj")){
		
		try {
			ss = factory.openSession();
			ss.insert("prob.insertProb", problem);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		}	
		//문제가 주관식이라면
		else{
			

			try {
				ss = factory.openSession();
				ss.insert("prob.insertProb2", problem);
				ss.commit();
			}
			
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}	
			
		}
	
		
	}//문제내기 끝
	
	
	public List<Problem> problist() {
		List<Problem> list= null;
		
		try {
			ss = factory.openSession();
			list = ss.selectList("prob.problist");
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		
		return list;
		}	
	
	
	/*문제하나 들고 오기*/	
	public Problem getProb(int prob_id) {
		Problem problem= null;
		
		try {
			ss = factory.openSession();
			problem = ss.selectOne("prob.getProb",prob_id);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		
		return problem;
		}	//문제내기 끝
		
	/*문제 하나씩 넣기 */
	public void submitTest(Prob_List problist){
		System.out.println("디비 잡입");
		System.out.println(problist);
		try {
			ss = factory.openSession();
			ss.insert("prob.submitTest", problist);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		
		}	//문제내기 끝
	
	
	
	/*시험문제 순서대로 뽑아오기*/
	public List<Prob_List> getTest(int test_seq){
		
		List<Prob_List> pblist=null;
		
		try {
			ss = factory.openSession();
			pblist = ss.selectList("prob.getTest", test_seq);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
			return pblist;
		}	//시험문제 순서대로 뽑아오기
	
	
	/*시험객체 새로 만들기*/
	public void createTest(TestVO testvo){
		
		
		try {
			ss = factory.openSession();
			ss.insert("prob.createTest", testvo);
			
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		}	//시험문제 순서대로 뽑아오기
	

	//시험 seq찾아오기
	public int findTestseq(int subject_seq){
		
		int test_seq=0;
		
		try {
			ss = factory.openSession();
			test_seq = ss.selectOne("prob.findTestseq", subject_seq);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		return test_seq;
		}
	
	
	
	
	//시험 seq찾아오기
		public void insertScore(Score scoreobject){
			
			
			try {
				
				ss = factory.openSession();
				ss.insert("prob.insertScore", scoreobject);
				
				ss.commit();
			}
			
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			
			}
	
		
		
	}
