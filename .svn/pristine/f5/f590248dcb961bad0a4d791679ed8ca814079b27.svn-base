package bbs;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import vo.Board;
import vo.Pfdreply;
import vo.Reply;
import common.MybatisConfig;


public class BbsDAO {
	private SqlSessionFactory factory = MybatisConfig.getSqlSessionFactory(); 
	SqlSession ss = null;

	
	
	/*총게시물의 숫자 구하기 */
	public int getTotal(String searchText) throws SQLException {
		int total = 0;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchText", searchText);

		try {
			ss = factory.openSession();
			total = ss.selectOne("bbs.getTotal", map);
			ss.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if (ss != null) ss.close();
		}
		return total;
	}
	
	/*총게시물의 리스트 구하기*/
	public List<Board> listBoard(String searchText, int startRecord, int countPerPage) {
		List<Board> boardlist = null;
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("searchText", searchText);
		
		RowBounds bound = new RowBounds(startRecord, countPerPage);
		
		try {
			ss = factory.openSession();
			boardlist = ss.selectList("bbs.listBoard", map, bound);
			ss.commit();
		}
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		return boardlist;
		}	
	
	/*통합게시판 글정보 자세히 보기*/
	public Board bbsDetail(int boardnum) {
		
		Board selbd = null;
		
		try {
			ss = factory.openSession();
			selbd = ss.selectOne("bbs.bbsDetail", boardnum);
			ss.update("bbs.viewCount", boardnum);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		return selbd;
		}	
	
	
		/*새로운 게시물 삽입 */
	
		public void writeNew(Board board) {
				
		try {
			ss = factory.openSession();
			ss.insert("bbs.writeNew", board);
			ss.commit();
		}
		
		catch (Exception e) {e.printStackTrace();}
		finally {if (ss != null) ss.close();}
		
		}	
	
	
		/*통합게시판 특정글 1개 삭제*/
		public void bbsDelete(int boardnum) {
			
			
			try {
				ss = factory.openSession();
				ss.delete("bbs.bbsDelete", boardnum);
				ss.commit();
			}
			
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			
			}	
		
		
		/*통합게시판 특정글 1개 수정*/
		public void bbsEdit(Board board) {
			
			
			try {
				ss = factory.openSession();
				ss.update("bbs.bbsEdit", board);
				ss.commit();
			}
			
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			
		}	
		
		public List<Reply> listReply(int boardnum) {
			List<Reply> replylist = null;
			
			try {
				ss = factory.openSession();
				replylist = ss.selectList("bbs.listReply", boardnum);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				ss.close();
			}		
			return replylist;
		}
		
		
		/*통합게시판 댓글 삽입*/
		public void insertReply(Reply reply) {
			try {
				ss = factory.openSession();
				ss.insert("bbs.insertReply", reply);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
		}
		
		/*통합게시판 댓글 삽입*/
		public int replyCount(int boardnum) {
			int count=0;
			try {
				ss = factory.openSession();
				count = ss.selectOne("bbs.replyCount", boardnum);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			return count;
		}
		
		/*통합게시판 댓글 삭제*/
		public void deleteReply(int replynum) {
		
			try {
				ss = factory.openSession();
				ss.delete("bbs.deleteReply", replynum);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			
		}
		
		/*통합게시판 댓글 수정*/
		public void updateReply(Reply reply) {
		
			try {
				ss = factory.openSession();
				ss.update("bbs.updateReply", reply);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			
		}
		
		/*첨삭 댓글 입력 */
		public void insertPfdReply(Pfdreply pfdreply) {
		
			try {
				ss = factory.openSession();
				ss.insert("bbs.insertPfdReply", pfdreply);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			
		}
		
		
		/*현재 첨삭 번호 들고오기*/
		public int getcurrval() {
			int currval=0;
			try {
				ss = factory.openSession();
				currval = ss.selectOne("bbs.getcurrval");
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			
			return currval;
		}
		
		
		
		public List<Pfdreply> pfdReplyList(int boardnum) {
			
			List<Pfdreply> pfdlist = null;
			
			try {
				ss = factory.openSession();
				pfdlist= ss.selectList("bbs.pfdReplyList", boardnum);
				ss.commit();
			}
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			return pfdlist;
			}	
		

		public List<String> getString (int pfnum) {
			
			List<String> strlist = null;
			
			try {
				ss = factory.openSession();
				strlist= ss.selectList("bbs.getString", pfnum);
				ss.commit();
			}
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			
			return strlist;
			}	
		
		
		public void deletePfdReply (int pfdnum) {
			
			
			try {
				ss = factory.openSession();
				ss.delete("bbs.deletePfdReply", pfdnum);
				ss.commit();
			}
			catch (Exception e) {e.printStackTrace();}
			finally {if (ss != null) ss.close();}
			
			}

		
		
		/*통합게시판 댓글 삽입*/
		public int pdfreplyCount(int boardnum) {
			int count=0;
			try {
				ss = factory.openSession();
				count = ss.selectOne("bbs.pdfreplyCount", boardnum);
				ss.commit();
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				if (ss != null) ss.close();
			}
			return count;
		}
		
		
}
