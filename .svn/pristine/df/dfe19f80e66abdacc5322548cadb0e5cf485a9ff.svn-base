package bbs;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.ArrayUtils;
import org.apache.struts2.interceptor.SessionAware;

import vo.Pfdreply;
import vo.Reply;

import com.opensymphony.xwork2.ActionSupport;

public class ReplyAction extends ActionSupport implements SessionAware{
	int boardnum; 					//게시물 번호(원글번호)
	int replynum;					//댓글 번호
	int pfdnum;						//첨삭글 번호
	String id;						//댓글 단 유저의 아이디
	String retext;					//댓글의 내용
	Map<String, Object> session;	//세션
	List<Reply> replylist;			//댓글 리스트
	String content;					//원글의 내용. array[]로 나눠서 전환
	String[] array;					//원글의 내용을 잘라서 보내기 위한 배열
	String pfdstr;				//삽입될 주석의 내용 한줄한줄
	String userid; 					//첨삭 댓글을 단 사람의 id
	String pfdcomment;					//첨삭 총평;
	List<Pfdreply> pfdreplylist;		//첨삭 댓글 리스트;
	List<String> stringlist;
	/*--------댓글 리스트 불러오기 ----------*/
	public String replyList() throws Exception{
		BbsDAO db = new BbsDAO();
		replylist = db.listReply(boardnum);
		
		return SUCCESS;
	}	
	/*--------댓글 리스트 불러오기 끝----------*/

	
	
	/*--------댓글 달기 시작----------*/
	
	public String writeReply() throws Exception {
		System.out.println("-----통합게시판 댓글달기 시작-------");	
		
		//세션 검사를 해도 좋을듯 하다.
		//세션에서 아이디를 가져온뒤 생성된 댓글의 객체에 삽입한다.
		
		
		
		
		//--------------------------------------
		Reply reply = new Reply();
		reply.setBoardnum(boardnum);
		reply.setId(id);
		reply.setRetext(retext);
		System.out.println(reply);
		BbsDAO db = new BbsDAO();
		db.insertReply(reply);
		
		
		return SUCCESS;
	}
	/*--------/댓글 달기 끝----------*/
	
	/*--------댓글 삭제 시작----------*/
	public String deleteReply() throws Exception{
		System.out.println("-----통합게시판 댓글삭제-------");	
		BbsDAO db = new BbsDAO();
		db.deleteReply(replynum);
		
		return SUCCESS;
	}	
	/*--------댓글 삭제 끝----------*/
	
	
	
	/*--------댓글 수정 시작----------*/
	public String updateReply() throws Exception{
		System.out.println("-----통합게시판 댓글수정-------");	
		BbsDAO db = new BbsDAO();
		Reply reply = new Reply();
		reply.setReplynum(replynum);
		reply.setRetext(retext);
		db.updateReply(reply);
		
		return SUCCESS;
	}	
	/*--------댓글 삭제 끝----------*/
	
	
	

	/*------- 일본어 첨삭 원문 가르기 시작----------*/
	public String splitContent() throws Exception{
	
		System.out.println("-----일본어 첨삭 원문가르기-------");	
		System.out.println(content);
		//<p>태그별로 나누기
		array =content.split("<p>");
		//0번째는 공백이 된다. 따라서 0번쨰는 없앤다.
		array = ArrayUtils.remove(array, 0); 
		
		
		int end = array.length;
		Set<String> set = new LinkedHashSet<String>();

		for(int i = 0; i < end; i++){
		  set.add(array[i]);
		}
	
	
		
		array = set.toArray(new String[set.size()]);
		//공백 삭제 리스트를 만든다.
		
		for(int j=0;j<array.length;j++){
			array[j]=array[j].trim();
			System.out.println(array[j]+j+"번째");
			if(array[j].equals("&nbsp;</p>")){
				System.out.println("엔에스비");
				array = ArrayUtils.remove(array, j); 
			}
		}
		
		System.out.println(array);
	

		
		/*List<Integer> dellist = new ArrayList<Integer>();
		
		
		for(int j=0;j<array.length;j++){
			array[j]=array[j].trim();
			System.out.println(array[j]+j+"번째");
			if(array[j].equals("&nbsp;</p>")){
				System.out.println("엔에스비");
				dellist.add(j);
			}
		}
		System.out.println(dellist+"리스트");
		System.out.println(dellist.size());
		
		for(int i=0; i<dellist.size();i++){
			array = ArrayUtils.remove(array, dellist.get(i)); 
		}*/
		
	
		
		
		for(int i=0; i<array.length;i++){
			//공백삭제
			array[i]=array[i].trim();
			
			//</p>삭제전
			System.out.println(array[i]+i+"번째");
			//삭제중
			array[i]= array[i].replace("</p>", "");
			//삭제후
			System.out.println(array[i]+i+"번째");
		}
		
		
	
		
		
		return SUCCESS;
	}	
	/*--------일본어 첨삭 원문 가르기 시작----------*/
	
	
	/*------- 일본어 첨삭 삽입 시작----------*/
	public String pfdWrite() throws Exception{
		System.out.println("-----일본어 첨삭 입력하기-------");	
		System.out.println(pfdstr);
		//우선 기본적인 정보모두 입력한다.
		BbsDAO db = new BbsDAO();
		
		//pfd첨삭도 갈라야?
		
		//////////////////////////
		//첨삭 댓글을 만든다
		Pfdreply pfdreply = new Pfdreply();
		pfdreply.setUserid(userid);
		pfdreply.setBoardnum(boardnum);
		pfdreply.setPfdstr(pfdstr);
		pfdreply.setPfdcomment(pfdcomment);
		
		System.out.println(pfdreply);
		//첨삭댓글 넣기
		db.insertPfdReply(pfdreply);
		//성공시 
	//=======================================	
		//첨삭 댓글 스트링을 하나씩 넣는다.
	/*	int currval = db.getcurrval();
		System.out.println("======="+currval+"========");
		//반복해서 3번 넣어준다.
		for(int i=0;i<pfdstr.length;i++){
			Pfdstr pfdstrone = new Pfdstr();//스트링 객체 하나
			
			pfdstrone.setPfdnum(currval); //첨삭댓글 번호를 잡아주고		
			pfdstrone.setPfdstr(pfdstr[i]);	//스트링객체 하나하나 순서에 맞게 집어 넣어준다.
			db.insertPfdOne(pfdstrone);
			System.out.println("====출====="+pfdstr[i]+"====력===");
		}
		*/
		
		//
	//========================================	
		return SUCCESS;
	}	
	/*--------일본어 첨삭 삽입 시작----------*/
	
	public String pfdReplyList() throws Exception{
		System.out.println("-----일본어 첨삭리스트 뺴기-------");	
		BbsDAO db = new BbsDAO();
		//리플 리스트
		pfdreplylist = db.pfdReplyList(boardnum);
		System.out.println(pfdreplylist );
		
		/*//리플리스트 크기에 맞추어 댓글들을 가져온다.
		for(int i=0;i<pfdreplylist.size();i++){
			//첨삭 댓글의 리플의 번호
			int pfnum = pfdreplylist.get(i).getPfdnum();
			//db에가서 해당 번호에 맞는 답글 목록을 전부 들고 온다. String리스트가 될것이다.
			db.getString(pfnum);
		}*/
		
		
		return SUCCESS;
	}

	public String deletePfdReply() throws Exception{
		System.out.println("-----첨삭 리플 지우기------");	
		BbsDAO db = new BbsDAO();
		db.deletePfdReply(pfdnum);
		
		
		return SUCCESS;
	}

	
	
	public int getBoardnum() {
		return boardnum;
	}

	public String[] getArray() {
		return array;
	}



	public void setArray(String[] array) {
		this.array = array;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public String getId() {
		return id;
	}



	public void setId(String id) {
		this.id = id;
	}



	public int getReplynum() {
		return replynum;
	}



	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}

	

	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public List<Reply> getReplylist() {
		return replylist;
	}



	public void setReplylist(List<Reply> replylist) {
		this.replylist = replylist;
	}



	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getRetext() {
		return retext;
	}

	public void setRetext(String retext) {
		this.retext = retext;
	}






	public String getPfdstr() {
		return pfdstr;
	}



	public void setPfdstr(String pfdstr) {
		this.pfdstr = pfdstr;
	}



	public String getPfdcomment() {
		return pfdcomment;
	}



	public void setPfdcomment(String pfdcomment) {
		this.pfdcomment = pfdcomment;
	}



	public List<Pfdreply> getPfdreplylist() {
		return pfdreplylist;
	}



	public void setPfdreplylist(List<Pfdreply> pfdreplylist) {
		this.pfdreplylist = pfdreplylist;
	}



	public int getPfdnum() {
		return pfdnum;
	}



	public void setPfdnum(int pfdnum) {
		this.pfdnum = pfdnum;
	}



	public List<String> getStringlist() {
		return stringlist;
	}



	public void setStringlist(List<String> stringlist) {
		this.stringlist = stringlist;
	}

	
	
	
	


	
	
	
}
