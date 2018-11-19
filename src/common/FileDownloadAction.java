package common;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Properties;

import vo.Board;
import bbs.BbsDAO;

import com.opensymphony.xwork2.ActionSupport;

public class FileDownloadAction extends ActionSupport {
	int boardnum;		
	
	File fileName;
	String contentType;
	String contentDisposition;
	InputStream inputStream;	
	long contentLength;			
	Board board = null;
	File file = null;
	
	
	public String fileDownload() throws Exception{
		String savedfile = null;
		String originalfile = null;
		
		
		
		System.out.println("��");
	/*	String basePath = getText("board.uploadpath");	*/
		String basePath = "C:/eclipse/workspace/LMS_SCmaster/WebContent/upload/file";
		System.out.println("��");
		System.out.println(basePath);

		board = new BbsDAO().bbsDetail(boardnum);
		savedfile = board.getSavedfile();
		originalfile = board.getOriginalfile();
		
		
		file = new File(basePath + "/" + savedfile);
		contentLength = file.length();
		contentDisposition = "attachment;filename="+URLEncoder.encode(originalfile,"UTF-8");
		inputStream = new FileInputStream(file);
		return SUCCESS;
	}

	
	//getter . setter

			
	public int getBoardnum() {
		return boardnum;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public File getFileName() {
		return fileName;
	}

	public void setFileName(File fileName) {
		this.fileName = fileName;
	}


	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	

	public String getContentDisposition() {
		return contentDisposition;
	}

	public void setContentDisposition(String contentDisposition) {
		this.contentDisposition = contentDisposition;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}


	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}	
	
}
