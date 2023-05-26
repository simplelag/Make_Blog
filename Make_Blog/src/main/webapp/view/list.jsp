<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오전 9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"
            integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
    <title>끄적끄적</title>

</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<div class="container-fluid my-2">
    <img src="/Resource/notebook.jpg" alt="낙서장" class="rounded mx-auto d-block" style="width: 1300px; height:200px;">
</div>
<main class="container my-3">
    <div>
        <form>
        </form>
        <table class="table table-hover table-stripe table-center">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
            </thead>
            <c:choose>
                <c:when test="${empty blogList}">
                    <tr>
                        <td colspan="4">등록된 게시글이 없습니다.</td>
                    </tr>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${blogList}" var="item" varStatus="loop">
                        <tr>
                            <td>${item.blog1Idx}</td>
                            <td class="text-start"><a href="/blogBoard/View.do?idx=${item.blog1Idx}"class="text-decoration-none">${item.blog1Title}</a></td>
                            <td>${item.blog1Visitcount}</td>
                            <td>${item.blog1Postdate}</td>
                        </tr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </table>
    </div>
<div>

    <div class="my-3 d-flex justify-content-end">
        <%
            if(session.getAttribute("grade") == null){
        %>
        <%
            }
            else if(session.getAttribute("grade") != null){
        %>
        <a href="/blogBoard/Write.do" class="btn btn-danger">글쓰기</a>
        <%
            }
        %>
        </div>
</div>
</main>
<c:import url="/layout/Footer.jsp"></c:import>
</body>
</html>
