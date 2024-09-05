<%@page import="vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<style>
.insert {
	text-align: right;
	margin-bottom: 20px;
	margin-right: 10px;
}
.textAlign {
	text-align: center;
}
th {
	text-align: center;
}
</style>

    	<div><h3>회원목록 보기</h3></div>
					<%
						List<MemberVO> mvList = (List<MemberVO>)request.getAttribute("mvList");
					%>
					<c:set value="<%=mvList %>" var="mvList" />
					
					<div class="insert">
						<input type="button" class="btn btn-primary" value="회원추가" 
								onclick="location.href='<%=request.getContextPath()%>/memberInsert.do'"/>
					</div>
					
					<table class="table table-bordered table-hover table-responsive">
								<tr style="background: aliceblue;">
									<th>ID</th>
									<th>비밀번호</th>
									<th>이 름</th>
									<th>전 화</th>
									<th>주 소</th>
								</tr>
								
							<c:forEach items="${mvList }" var="mv" varStatus="stat">
								<tr>
									<td class="textAlign">
										<a href="<%=request.getContextPath() %>/memberDetail.do?memId=${mv.memId }">
											${mv.memId }
										</a>
									</td>
									<td class="textAlign">${mv.memPass }</td>
									<td class="textAlign">${mv.memName }</td>
									<td class="textAlign">${mv.memTel }</td>
									<td>${mv.memAddr }</td>
								</tr>
							</c:forEach>
					</table>
