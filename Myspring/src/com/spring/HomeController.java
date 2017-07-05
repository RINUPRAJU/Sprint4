package com.spring;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pkgdbconnection.DBinsert;

import com.bean.LoginBean;

@Controller
public class HomeController {
	
	@RequestMapping(value="/login",method=RequestMethod.POST)

	public String submit(HttpSession session,Model model,HttpServletRequest request,HttpServletResponse response, @ModelAttribute("loginbean") LoginBean loginbean) throws SQLException

	{
	String uname =loginbean.getUsername();
	System.out.println("uname"+uname);

	DBinsert obj =new DBinsert();


	ResultSet y=obj.select(loginbean.getUsername(),loginbean.getPassword());
    ResultSet y1=obj.emailerror(loginbean.getUsername());
System.out.println(y1);
	System.out.println("register="+y);
	if(y.next())
	{
		if((loginbean.getUsername().equals(y.getString("Email")))&&(loginbean.getPassword().equals(y.getString("Password"))))
			
		{
			/* model.addAttribute("firstname",y.getString("Firstname"));
			    model.addAttribute("lastname",y.getString("Lastname"));*/
			HttpSession session1=request.getSession();
			session.setAttribute("userid", y.getInt("ID"));
			session1.setAttribute("firstname", y.getString("Firstname"));
			session1.setAttribute("lastname", y.getString("Lastname"));
			session1.setAttribute("file",y.getString("file"));
			
			
		return "home";
	}
	
	
	}
	
	
		 if(y1.next())
			{
				if((loginbean.getUsername().equals(y1.getString("Email"))))
						{
					System.out.println("username");
					model.addAttribute("firstname",y1.getString("Firstname"));
					model.addAttribute("lastname",y1.getString("Lastname"));
					model.addAttribute("username",loginbean.getUsername());
					return "pswdincrct";
						}
	}
	
		 else
		 {
	
	
	return "emailincrct";
	}
	return "";
	}
	
//	@RequestMapping(value="/file")
//	{
//		return "home";
//	}
//	
	
@RequestMapping(value="/logout")
 public String logout(HttpServletRequest request){
	HttpSession httpSession=request.getSession();
	httpSession.invalidate();
		return "index";
	}
		
	}

