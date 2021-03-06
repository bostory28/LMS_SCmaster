package bbs;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import vo.Admin;
import vo.Board;
import vo.Student;
import vo.Teacher;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import common.FileService;
import common.PageNavigator;

public class BbsAction extends ActionSupport implements SessionAware {
	
	String searchText;					//검색어 
	PageNavigator pagenavi;				//페이징 관련 정보
	List<Board> boardlist; 				//통합게시판 리스트
	int currentPage = 1;				//게시물 목록의 현재 페이지
	int boardnum;						//게시판 글 번호
	Board board;						//하나의 게시글의 객체
	long currenttime;					//타입스탬프
	private File upload;					//업로드할 파일. Form의 <file> 태그의 name.
	private String uploadFileName;			//업로드할 파일의 파일명 (File타입 속성명 + "FileName")
	private String uploadContentType;		//업로드할 파일의 컨텐츠 타입 (File타입 속성명 + "ContentType")
	Admin admin;							//관리자 객체
	Teacher teacher;						//선생 객체
	Student student;						//학생 객체
	Map<String,Object> session;
	
	
	
	
	/*------통합 게시판 리스트 불러오기 액션 시작------- */
	public String bbsList() throws Exception
	{
		
	    if((session.get("userSign"))==null){
	    	System.out.println("로그인이 안되어있음");
	    	return "LOGIN";
	    }
		
		System.out.println("-----통합게시판 보기-------");	
		
		//user.properties에서 지정한 페이징 관련 상수들 읽기  그게 안되는 이유는?
		//페이지당 글목록수 그리고 그룹당 페이지수를 정해준다.
				int countPerPage = 10;	//페이지당 글목록 수
				int pagePerGroup = 5;	//그룹당 페이지 수
		
		//DAO를 만든다.
			BbsDAO db = new BbsDAO();
		//총게시물 수를 먼저 구한다. 이것이 스타트이다. 키위드가 있느냐 없느냐에 따라 총 게시물 숫자는 달라질 것이다.
			int totalRecordsCount = db.getTotal(searchText);	
			
			System.out.println(totalRecordsCount);
			
			pagenavi = new PageNavigator(countPerPage,pagePerGroup,currentPage,totalRecordsCount);
			//페이지당 글 수, 그룹당 페이지 수, 현재 페이지, 전체 글 수를 전달받음
			//페이지 빈 객체가 만들어졌다. 이것을 이용하여 보드게시물을 원하는 형식에 적절하게 배치할수 있게 되었다.
		
			boardlist=db.listBoard(searchText, pagenavi.getStartRecord() ,countPerPage);
			//보면서 느끼는것은 숫자와 객체를 따로 나눠서 처리한다는점이다. 이것은 흥미롭다.
			//그 리스트를 list형식으로 받아서 리턴한후
			//이곳에서 boardlist라는 이름으로 받아서 리턴시켜준다.
			//나머지는 이것을 부르는 get메서드로부터 형식을 정의해주고
			//view단에 해당되는 boardList에서 boardList를 써주면 된다.
			System.out.println(boardlist.size()+"크기");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			
			for(int i=0 ; i<boardlist.size(); i++){
				long inputdate = boardlist.get(i).getInputdate();//각 게시물의 입력시간
				long now = System.currentTimeMillis();		//현재 시간
				//게시물 입력시간 - 현재시간 < 30분 이전 
				if(now - inputdate <1800000){
					 boardlist.get(i).setNewornot("true");
					 System.out.println("새로운 게시물");
					
					 
				}
				 //게시물당 댓글수 적기
				boardlist.get(i).setReplycount(db.replyCount( boardlist.get(i).getBoardnum()));
				boardlist.get(i).setPfdreplycount(db.pdfreplyCount( boardlist.get(i).getBoardnum()));
				boardlist.get(i).setRfInputdate(sdf.format(inputdate));
			
			}
			
				//각각의 게시물의 댓글 수를 구한다.
			
			    
		
			
			currenttime = System.currentTimeMillis();
			
		
		return SUCCESS;
	}
	/*---------통합 게시판 리스트 불러오기 액션 끝 ------*/

	
	
	
	/*---------통합 게시판 글정보 자세히 보기  시작------*/

	public String bbsDetail() throws Exception
	{
		System.out.println("-----통합게시판 글정보 자세히 보기-------");	
		System.out.println(boardnum);	
		BbsDAO db = new BbsDAO();
		board = db.bbsDetail(boardnum);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		board.setRfInputdate(sdf.format(board.getInputdate()));
		System.out.println(board);
		
		return SUCCESS;
	}
	/*---------통합 게시판 글정보 자세히 보기  끝------*/
	
	

	/*---------통합 게시판 새로운 글 쓰기 시작 ------*/

	public String writeNew() throws Exception
	{
		System.out.println("-----통합게시판 새로운 글 쓰기-------");	
		BbsDAO db = new BbsDAO();
		System.out.println(board);
		
		//세션 객체에 담긴 멤버 객체 불러오기
				ActionContext context = ActionContext.getContext();
				Map<String, Object> session = (Map<String, Object>) context.getSession();
				
				///------------------성현이랑 도킹--------------------------------////
			
						//새로운 글입력폼에서 #session.userSign.id를 hidden폼에 넣어서 처리함
				
				///------------------성현이랑 도킹--------------------------------////
				
				
				//객체에서 아이디 추출해 세팅하기
				
				
			
				
				//글입력 날짜 세팅하기(타임스탬프형식)
						
				 long millis = System.currentTimeMillis();
				
				/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String inputDate = sdf.format(date);*/
				board.setInputdate(millis);	
				board.setViewcount(0);
				
				if(upload != null){
					FileService fs = new FileService();
					String basePath = "C:/eclipse/workspace/LMS_SCmaster/WebContent/upload/file";
					String savedfile = fs.saveFile(
							upload, basePath, uploadFileName);
					
					board.setSavedfile(savedfile);		//20140804_2938472.jap
					board.setOriginalfile(uploadFileName);	//사진.jpg
				}
				
		System.out.println(board);
		
		db.writeNew(board);
		
		return SUCCESS;
	}
	/*---------통합 게시판 새로운 글 쓰기 끝------*/
	

	/*---------통합 게시판 특정글 하나 지우기 시작------*/
	public String bbsDelete() throws Exception
	{
		System.out.println("-----통합게시판 특정한 글 한개 지우기-------");	
		BbsDAO db = new BbsDAO();
		db.bbsDelete(boardnum);
		
		return SUCCESS;
	}
	/*---------/통합 게시판  특정글 하나 지우기 끝------*/
	
	/*---------통합 게시판 특정글 하나 지우기 시작------*/
	public String bbsEditForm() throws Exception
	{
		System.out.println("-----통합게시판 특정한 글 수정하기폼 (bbsDetail과 기본적으로 같음)-------");	
		BbsDAO db = new BbsDAO();
		board = db.bbsDetail(boardnum);
		
		return SUCCESS;
	}
	/*---------/통합 게시판  특정글 하나 지우기 끝------*/
	
	
	/*---------통합 게시판 특정글 하나 수정하기 시작------*/
	public String bbsEdit() throws Exception
	{
		System.out.println("-----통합게시판 특정게시물 수정-------");	
		BbsDAO db = new BbsDAO();
	    board.setBoardnum(boardnum);
	  //첨부파일이 null이 아니면 기존 파일 먼저 삭제하고 새로운 첨부파일 정보 포함하여 수정
	  		if (upload != null) {
	  			String basePath = getText("board.uploadpath");		//user.properties에 지정된 파일 저장 경로
	  			Board beforeBoard = db.bbsDetail(board.getBoardnum());	//수정 전의 파일 정보
	  			FileService fs = new FileService();
	  			fs.fileDelete(basePath + "/" + beforeBoard.getSavedfile());	//저장된 파일의 전체경로를 전달하여 파일 삭제
	  			
	  			String savedfile = fs.saveFile(upload, basePath, uploadFileName);	//서버에 임시 업로드된 파일객체, 저장경로, 업로드당시의 파일명 전달하고 실제 저장된 파일명 리턴받음
	  			board.setSavedfile(savedfile);
	  			board.setOriginalfile(uploadFileName);
	  		}
	    
	    
	    
	    
	    System.out.println(board);
		
		db.bbsEdit(board);
		
		return SUCCESS;
	}
	/*---------/통합 게시판  특정글 하나 수정하기 끝------*/
	
	/*---------통합 게시판  댓글 달기 시작 끝------*/
	
	

	public long getCurrenttime() {
		return currenttime;
	}


	public Admin getAdmin() {
		return admin;
	}




	public void setAdmin(Admin admin) {
		this.admin = admin;
	}




	public Teacher getTeacher() {
		return teacher;
	}




	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}




	public Student getStudent() {
		return student;
	}




	public void setStudent(Student student) {
		this.student = student;
	}




	public File getUpload() {
		return upload;
	}




	public void setUpload(File upload) {
		this.upload = upload;
	}




	public String getUploadFileName() {
		return uploadFileName;
	}




	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}




	public String getUploadContentType() {
		return uploadContentType;
	}




	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}




	public void setCurrenttime(long currenttime) {
		this.currenttime = currenttime;
	}


	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public Board getBoard() {
		return board;
	}


	public void setBoard(Board board) {
		this.board = board;
	}


	public String getSearchText() {
		return searchText;
	}


	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}


	public PageNavigator getPagenavi() {
		return pagenavi;
	}



	public void setPagenavi(PageNavigator pagenavi) {
		this.pagenavi = pagenavi;
	}


	public List<Board> getBoardlist() {
		return boardlist;
	}


	public void setBoardlist(List<Board> boardlist) {
		this.boardlist = boardlist;
	}


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}




	public Map<String, Object> getSession() {
		return session;
	}




	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	
	
}
