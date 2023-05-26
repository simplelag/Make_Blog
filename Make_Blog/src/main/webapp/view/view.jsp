<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오전 11:57
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
    <script>
        $(document).ready(function() {
            $("#btn-list").on("click", function () {
                location.href="/blogBoard/List.do"
            });
            $("#btn-edit").on("click", function () {
                const blog1Idx = $("#blog_idx").val();
                location.href = "/blogBoard/Edit.do?mode=edit&idx=" + blog1Idx;
            });

            $("#btn-delete").on("click", function () {
                let confirmed = confirm("정말로 삭제하시겠습니까?");
                if(confirmed) {
                    const blog1Idx = $("#blog_idx").val();
                    let url ="/view/DeleteProcess.jsp?blog1Idx=" + blog1Idx;
                    location.href = url;
                }
                });
            var blog1Idx = ${blogList.blog1Idx};
            if(blog1Idx === 0 ){
                alert("마지막 글입니다!!");
                history.back();
            }
        });
    </script>
    <title>끄적끄적</title>
</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<main class="container my-3">
    <div class="my-3 row">
        <div class="col-sm">
            <label for="blog_idx" class="form-label">번호</label>
            <input type="text" class="form-control" id="blog_idx" name="blog1Idx" value="${blogList.blog1Idx}" readonly>
        </div>
        <div class="col-sm">
            <label for="blog_Id" class="form-label">작성자 : </label>
            <input type="text" class="form-control" id="blog_Id" name="blogId" value="${blogList.blog1Id}" readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="blog_date" class="form-label">작성일 : </label>
            <input type="text" class="form-control" id="blog_date" name="blogDate" value="${blogList.blog1Postdate}" readonly>
        </div>
        <div class="col-sm">
            <label for="blog_visit" class="form-label">조회수 : </label>
            <input type="text" class="form-control" id="blog_visit" name="blogVisit" value="${blogList.blog1Visitcount}" readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="blog_title" class="form-label">제목 : </label>
            <input type="text" class="form-control" id="blog_title" name="blogTitle" value="${blogList.blog1Title}" readonly>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <label for="blog_contents" class="form-label">내용 : </label>
            <textarea class="form-control" id="blog_contents" name="blogContents" rows="10" readonly>${blogList.blog1Content}</textarea>
        </div>
    </div>
    <div class="my-3 row">
        <div class="col-sm">
            <button type="button" class="btn btn-secondary" id="btn-list">목록</button>
        </div>
        <div class="col-sm d-flex justify-content-end">
            <%
                if(session.getAttribute("grade") == null){
            %>
            <%
            }
            else if((int)session.getAttribute("grade") == 1 ){

            %>
            <button type="button" class="btn btn-warning me-2" id="btn-edit">수정</button>
            <button type="button" class="btn btn-danger" id="btn-delete">삭제</button
                <%
                    }
                %>
        </div>
    </div>
    <a href="/blogBoard/View.do?idx=${blogList.blog1Idx+1}" class="text-decoration-none mb-2 mt-2" style="color: black">윗글</a><hr>
    <a href="/blogBoard/View.do?idx=${blogList.blog1Idx-1}" class="text-decoration-none" style="color: black">아랫글</a>
</main>
<c:import url="/layout/Footer.jsp"></c:import>
</body>
</html>
