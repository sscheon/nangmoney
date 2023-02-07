<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<title>nangmoney_project</title>
<style>
	body{
	   font-family: 'Jua', sans-serif;
	   transform : rotate(0.04deg); 
	 }
	 strong, span {
		color : red;
	}

</style>
</head>
<body>

<h1><a href="${cpath }/">NangMoney</a></h1>

<h3><a href="${cpath }/member/join">회원가입</a></h3>
<h3><a href="${cpath }/member/login">로그인</a></h3>











