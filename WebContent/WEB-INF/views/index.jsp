<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	String menu = (String)request.getAttribute("menu");

%>



<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>회원관리 프로그램</title>
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
	<%@ include file="../../pageModule/headPart.jsp" %>
	
<style>
.main {
	padding-top: 30px;
    padding-bottom: 30px;
}

</style>
</head>
<body>
	<%@ include file="../../pageModule/header.jsp" %>

    <div class="breadcrumbs" style="padding-top:40px;">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 col-md-6 col-12">
                    <div class="breadcrumbs-content">
                        <h1 class="page-title">회원관리 프로그램</h1>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-12">
                    <ul class="breadcrumb-nav">
                        <li><a href="/">INDEX</a></li>
                        <li>회원관리</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <section class="main section">
        <div class="container">
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="content-left wow fadeInLeft" data-wow-delay=".3s">
						<!-- 여기에 내용을 입력해주세요 -->
						
						<% if (menu.equals("memberMain")) { %>
						<a href="${pageContext.request.contextPath }/memberList.do">회원 목록 보기</a>
						<% } %>

						<% if (menu.equals("memberList")) { %>
						<%@ include file="member/memberList.jsp" %>
						<% } %>

						<% if (menu.equals("memberInsert")) { %>
						<%@ include file="member/memberInsert.jsp" %>
						<% } %>
						
						<% if (menu.equals("memberDetail")) { %>
						<%@ include file="member/memberDetail.jsp" %>
						<% } %>
						
						<% if (menu.equals("memberUpdate")) { %>
						<%@ include file="member/memberUpdate.jsp" %>
						<% } %>

                    </div>
                </div>
            </div>
        </div>
    </section>
	<%@ include file="../../pageModule/footer.jsp" %>

	<%@ include file="../../pageModule/footerPart.jsp" %>
</body>
</html>