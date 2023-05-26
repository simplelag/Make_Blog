<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 12:47
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
                history.back();
            })
        });
    </script>
    <title>끄적끄적</title>
</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<main class="container my-4 py-4">
    <div class="row">
        <div class="col-sm-4 mx-auto">
            <form action="/blogBoard/Edit.do" method="post">
                <div class="my-3">
                    <label for="blog_idx" class="form-label">번호 : </label>
                    <input type="text" class="form-control" id="blog_idx" name="blogIdx" value="${blog.blog1Idx}" readonly>
                </div>
                <div class="my-3">
                    <label for="blog_title" class="form-label">제목 : </label>
                    <input type="text" class="form-control" id="blog_title" name="blogTitle" value="${blog.blog1Title}" placeholder="제목을 입력해주세요">
                </div>
                <div class="my-3">
                    <label for="blog_id" class="form-label">작성자 : </label>
                    <input type="text" class="form-control" id="blog_id" name="blogId" value="${blog.blog1Id}" readonly>
                </div>
                <div class="my-3">
                    <label for="blog-content" class="form-label">내용 : </label>
                    <textarea class="form-control" id="blog-content" name="postContent" rows="10">${blog.blog1Content}</textarea>
                </div>
                <div class="my-3">
                    <div class="row">
                        <div class="col-sm d-grid gap-3">
                            <button type="submit" class="btn btn-success">수정</button>
                        </div>
                        <div class="col-sm d-grid gap-3">
                            <button type="reset" class="btn btn-secondary" id="btn-list">취소</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</main>

<c:import url="/layout/Footer.jsp"></c:import>

</body>
</html>
