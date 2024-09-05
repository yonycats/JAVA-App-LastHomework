package member.controller;

import java.io.File;
import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.ws.Response;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileItem;

import member.service.IMemberService;
import member.service.MemberServiceImpl;
import vo.MemberVO;

@MultipartConfig
@WebServlet("/memberInsert.do")
public class MemberInsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute("menu", "memberInsert");
		req.getRequestDispatcher("/WEB-INF/views/index.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IMemberService memberService = MemberServiceImpl.getInstance();

		String memId = req.getParameter("id");
		String memPw = req.getParameter("pw");
		String memName = req.getParameter("name");
		String memTel = req.getParameter("tel");
		String memAddr = req.getParameter("addr");
		// 원래 파일명
		String fileName = "";
		// 랜덤으로 저장할 파일명
		String randomName = UUID.randomUUID().toString().replace("-", "");
		
		// fileName 가져오기 (사진.jpg)
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
	        if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
	            fileName = part.getSubmittedFileName(); // 파일명 가져오기
	            break; // 첫 번째 파일만 처리
	        }
		}

		// MemberVo 객체를 만들어서 회원 정보 넣기
		MemberVO mv = new MemberVO();
		mv.setMemId(memId);
		mv.setMemPass(memPw);
		mv.setMemName(memName);
		mv.setMemTel(memTel);
		mv.setMemAddr(memAddr);

		if ( !(fileName.equals("")) ) {
			// 확장자 추출하기
			String fileExtension = fileName.lastIndexOf(".") < 0 ? "" : fileName.substring(fileName.lastIndexOf(".") + 1);
			
			// 저장할 전체 파일명 = 랜덤이름.확장자
			String fullFileName = randomName + "." + fileExtension; 
			
			// 업로드할 경로 주소를 지정하기
			String uploadPath = req.getServletContext().getRealPath("/resources/images");
	
			// File의 객체를 생성해서 해당 경로에 폴더 만들기
			File uploadDir = new File(uploadPath);
			
			// 해당 경로에 폴더가 없으면 만들기
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
		    // Part를 통해 파일 저장하기
		    for (Part part : parts) {
		    	// 파일 이름이 null이 아니거나 비어있지 않다면 = 파일이 있다면
		        if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().isEmpty()) {
		        	// part에 있는 write() 내장함수로 파일 저장하기 (파일 복사하기)
		            part.write(uploadPath + "/" + fullFileName); 
		        }
		    }
		    mv.setMemPhoto(fullFileName);
		} else {
			fileName = "";
			mv.setMemPhoto(fileName);
		}

	    memberService.insertMemberSv(mv);

		resp.sendRedirect(req.getContextPath() + "/memberList.do"); 
	}
}