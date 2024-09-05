<%@page import="vo.MemberVO"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
.formInput {
	width: 250px;
}
.table {
	width: 380px;
}
.img {
	margin-bottom: 15px;
   	margin-left: 20px;
    width: 300px;
    height: 300px;
    border: 1px solid #6385ff;
    border-radius: 10%;
}
.card {
	width: 380px;
}
</style>

		<%
			MemberVO mv = (MemberVO)request.getAttribute("mv");
		%>
		<c:set value="${pageContext.request.contextPath }" var="route" />

        <div><h3>회원 정보 입력 폼</h3></div>
        <br><br><br>

		<form class="form-inline" method="post" action="${pageContext.request.contextPath }/memberUpdate.do" enctype="multipart/form-data" id="updateForm">
			<input type="hidden" id="id" name="id" value="<%=mv.getMemId() %>">
			<input type="hidden" id="memPhoto" name="memPhoto" value="<%=mv.getMemPhoto() %>">
			
			<div class="card">            
	            <div class="card-header">
	            	<div style="text-align: center;">'<%=mv.getMemId() %>'님의 정보</div>
	            </div>
	            
	            <div class="card-body">
						<table class="table table-responsive">
							<tr>
								<td colspan="2" style="border-top: 1px;">
									<%
										if (mv.getMemPhoto() == null) {
									%>
									<div style="height: 80px; text-align: center; margin-top: 50px;">
										프로필 사진이 없습니다.
									</div>
									<%
										} else {
									%>
									<div>
										<img class="img" alt="프로필 사진" src="${pageContext.request.contextPath }/resources/images/<%=mv.getMemPhoto() %>">
									</div>
									<%
										}
									%>
								</td>						
							</tr>
							
							<tr>
								<th>회원ID</th>						
								<td><%=mv.getMemId() %></td>						
							</tr>
							
							<tr>
								<th><label for="pw">비밀번호 </label></th>					
								<td>
									<input type="password" class="form-control formInput" id="pw" name="pw" placeholder="비밀번호를 입력하세요" style="width: 250px;">
								</td>					
							</tr>
							
							<tr>	
								<th>
									<label for="name">회원이름 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="name" name="name" value="<%=mv.getMemName() %>" style="width: 250px;">
								</td>
							</tr>
							
							<tr>	
								<th>
									<label for="name">전화번호 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="tel" name="tel" value="<%=mv.getMemTel() %>" style="width: 250px;">
								</td>
							</tr>
							
							<tr>	
								<th>
									<label for="name">회원주소 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="addr" name="addr" value="<%=mv.getMemAddr() %>" style="width: 250px;">
								</td>
							</tr>
							
							<tr>	
								<th>
									<label for="name">프로필 사진 </label>
								</th>
								<td>
									<input type="file" class="form-control formInput" id="fileName" name="fileName" style="width: 250px;">
								</td>
							</tr>
						</table>
	            </div>
	            
	            <div class="card-footer" style="height: 45px;">
					<div style="width: 198px; margin-left: auto; margin-right: auto;">
						<input class="btn btn-info" type="button" value="저장" onclick="checkMember()"/>
						<input class="btn btn-danger" type="button" value="취소" onclick="location.href='<%=request.getContextPath() %>/memberDetail.do?memId=<%=mv.getMemId() %>'"/>
						<input class="btn btn-secondary" type="button" value="회원목록" onclick="location.href='<%=request.getContextPath() %>/memberList.do'"/>
					</div>
	            </div>
	         </div>
		</form>
	
<script>
function checkMember() {
	let pass = document.getElementById("pw").value.trim();
	
	if (pass == "") {
		alert("비밀번호를 입력해주세요.")
		return false;
	}
	updateForm.submit();
}
</script>