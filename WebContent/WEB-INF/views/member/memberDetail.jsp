<%@page import="vo.MemberVO"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<style>
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
	    
	    <div><h3>회원정보 상세보기</h3></div>
		<hr>

		<%
			MemberVO mv = (MemberVO)request.getAttribute("mv");
		%>
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
							<th>비밀번호</th>					
							<td><%=mv.getMemPass() %></td>						
						</tr>
						<tr>
							<th>회원이름</th>						
							<td><%=mv.getMemName() %></td>						
						</tr>
						<tr>
							<th>전화번호</th>						
							<td><%=mv.getMemTel() %></td>						
						</tr>
						<tr>
							<th>회원주소</th>						
							<td><%=mv.getMemAddr() %></td>						
						</tr>
					</table>
            </div>
            
            <div class="card-footer" style="height: 45px;">
				<div style="width: 198px; margin-left: auto; margin-right: auto;">
					<input class="btn btn-info" type="button" value="수정" onclick="location.href='<%=request.getContextPath() %>/memberUpdate.do?memId=<%=mv.getMemId() %>'"/>
					<input class="btn btn-danger" type="button" value="삭제" onclick="deleteMember()"/>
					<input class="btn btn-secondary" type="button" value="회원목록" onclick="location.href='<%=request.getContextPath() %>/memberList.do'"/>
				</div>
            </div>
         </div>
		
		

<script>

function deleteMember() {
    let memId = '<%=mv.getMemId() %>';

    if (!confirm("정말로 삭제하시겠습니까?")) {
        return;
    }
	
	$.ajax({
 		type: 'post',
		url: "<%=request.getContextPath()%>/memberDelete.do",
 		data: { memId: memId },
		success: function(res) {
 			console.log(res);
			if(res > 0) {
				alert("회원정보가 삭제되었습니다.");
				location.href='<%=request.getContextPath() %>/memberList.do';
			} else {
				alert("회원정보 삭제에 실패했습니다.");
			}
		},
		error: function(xhr) {
			alert('상태 : ' + xhr.status);
		}
		, dataType: 'text'
	});	
};

</script>	