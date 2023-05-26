<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오전 9:46
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
                });
            });
    </script>
    <title>끄적끄적</title>
</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<main class="container my-3">
    <div class="my-3 row">
        <div class="col-sm mx-auto">
            <form action="/blogBoard/Write.do" method="post">
                <div class="my-5">
                <label for="title" class="form-label">제목 : </label>
                <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력 해 주세요">
                </div>
                <div class="my-5">
                    <label for="id" class="form-label">ID</label>
                    <input type="text" class="form-control" id="id" name="id" value="blog_admin" readonly>
                </div>
                <div class="my-5">
                <label for="contents" class="form-label">내용 : </label>
                <textarea class="form-control" id="contents" name="contents" rows="10"></textarea>
                </div>
                <div class="my-5">
                    <div class="row">
                        <div class="col-sm d-grid">
                            <button type="submit" class="btn btn-primary">글 등록</button>
                        </div>
                        <div class="col-sm d-grid">
                            <button type="reset" class="btn btn danger" id="btn-list">취소</button>
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
