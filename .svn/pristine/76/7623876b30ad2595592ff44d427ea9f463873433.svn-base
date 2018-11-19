package testlogin;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TestLoginAction extends ActionSupport {
	
	private String username; //유저아이디(임시)
	private String password; //패스워드(임시)
	Map<String, Object> session;//세션 
	
	
	//테스트 로그인을 시키는 부분
	public String testlogin() throws Exception{
		
		System.out.println("여기까지 오나요");
		//관리자인경우(admin)
		if(password.equals("admin") && username.equals("admin") ){
			
			System.out.println("------관리자 모드--------");
			ActionContext context = ActionContext.getContext();
			session = context.getSession();
			session.put("SIGNUSER",username );

			
			
		}
		
		
		//선생1인경우(teacher1)
		else if(password.equals("teacher1") && username.equals("teacher1") ){
			System.out.println("------선생님1모드--------");
			ActionContext context = ActionContext.getContext();
			session = context.getSession();
			session.put("SIGNUSER",username );
			
			
		
			
		}
		
		//선생2인경우(teacher2)
		else if(password.equals("teacher2") && username.equals("teacher2") ){
			
			System.out.println("------선생님2모드--------");
			
		}
		
		
		//학생1인경우(student1)
		else if(password.equals("student1") && username.equals("student1") ){
			
			System.out.println("------학생1모드--------");
			
		}
		
		//학생2인경우(student2)
		
		if(password.equals("student2") && username.equals("student2") ){
			
			System.out.println("------학생2 모드--------");
			
		}
		
		
		
		
		
		return SUCCESS;
	}


	
	//게터와 세터

	public String getUsername() {
		return username;
	}



	public void setUsername(String username) {
		this.username = username;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	
	

}
