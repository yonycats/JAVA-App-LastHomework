package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.IMemberService;
import member.service.MemberServiceImpl;

@WebServlet("/memberDelete.do")
public class MemberDeleteController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("삭제 포스트");
		
		String memId = req.getParameter("memId");
		System.out.println(memId);
		
		IMemberService memberService = MemberServiceImpl.getInstance();
		int cnt = memberService.deleteMemberSv(memId);
		
		resp.getWriter().print(cnt);
	}
	
}
