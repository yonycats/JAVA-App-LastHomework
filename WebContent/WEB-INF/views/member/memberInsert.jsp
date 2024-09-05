<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
.formInput {
	width: 300px;
}
</style>

        <div><h3>회원 정보 입력 폼</h3></div>
        <br><br><br>

					<form class="form-inline" method="post" action="${pageContext.request.contextPath }/memberInsert.do" enctype="multipart/form-data" id="insertForm">
					
						<table class="table table-bordered table-responsive" style="width: 700px;">

							<tr>
								<th>
									<label for="id">회원ID </label>
								</th>
								<td style="margin-left: 20px;">
									<input type="text" class="form-control formInput" id="id" name="id" placeholder="아이디를 입력하세요">
									<input type="button" value="중복확인" onclick="idCheck()">
									<span id="disp" style="padding-left: 10px">
								</td>
							</tr>
							
							<tr>	
								<th>
									<label for="pw">비밀번호 </label>
								</th>
								<td>
									<input type="password" class="form-control formInput" id="pw" name="pw" placeholder="비밀번호를 입력하세요">
								</td>
							</tr>
									
														
							<tr>	
								<th>
									<label for="pwCheck">비밀번호 확인 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="pwCheck" name="pwCheck" placeholder="비밀번호를 다시 입력하세요">
								</td>
							</tr>
							
														
							<tr>	
								<th>
									<label for="name">회원이름 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="name" name="name" placeholder="이름을 입력하세요">
								</td>
							</tr>
							
														
							<tr>	
								<th>
									<label for="tel">전화번호 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="tel" name="tel" placeholder="전화번호를 입력하세요">
								</td>
							</tr>
							
														
							<tr>	
								<th>
									<label for="addr">회원주소 </label>
								</th>
								<td>
									<input type="text" class="form-control formInput" id="addr" name="addr" placeholder="주소를 입력하세요">
								</td>
							</tr>
							
														
							<tr>	
								<th>
									<label for="fileName">프로필 사진 </label>
								</th>
								<td>
									<input type="file" class="form-control formInput" id="fileName" name="fileName">
								</td>
							</tr>
									
									
							<tr>	
								<th style="text-align: center;" colspan="2">
									<input type="button" class="btn btn-primary" value="전송" onclick="memberInsert()">
									<input type="reset" class="btn btn-danger" value="리셋">
									<input type="button" class="btn btn-info" value="회원목록" onclick="location.href='${pageContext.request.contextPath }/memberList.do'">
								</th>
							</tr>

						</table>
					
					</form>

<script>

function idCheck() {
	let id = document.getElementById("id").value.trim();
	
	if (id == "") {
		alert("아이디를 입력해주세요.")
		return false;
	}
	
	$.ajax({
// 		type: 'get',
		url: "<%=request.getContextPath()%>/checkMember.do?id=" + $('#id').val(),
// 		data: ,
		success: function(res) {
 			console.log(res);
			if(res == 'null') {
				$('#disp').text("사용가능").css('color', 'green');
			} else {
				$('#disp').text("사용불가").css('color', 'red');
			}
		},
		error: function(xhr) {
			alert('상태 : ' + xhr.status);
		}
		, dataType: 'text'
	});	
};

function memberInsert() {
	let id = document.querySelector('#disp').innerText;
	let pw = document.querySelector('#pw').value;
	let pwCheck = document.querySelector('#pwCheck').value;
	let name = document.querySelector('#name').value;
	let tel = document.querySelector('#tel').value;
	let addr = document.querySelector('#addr').value;
	
	if (id != "사용가능") {
		alert("아이디 중복 확인이 필요합니다.")
		return false;
	}
	if (pw == "" || pwCheck == "" || name == "" || tel == "" || addr == "") {
		alert("빈칸을 입력해주세요.")
		return false;
	}
	insertForm.submit();
}

</script>		