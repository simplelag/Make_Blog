<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-24
  Time: 오후 4:32
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

    <title>Title</title>
    <script>
        $(document).ready(function() {
            $("#btn-list").on("click", function () {
                history.back();
            })
        });
    </script>
</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<main class="container my-3">
    <div class="col-sm">
        <h1 class="text-center">로그인</h1>
        <form action="loginprocess.jsp" method="post">
            <label for="id" class="form-label">id :</label>
            <input type="text" class="form-control" id="id" name="id" placeholder="ID를 입력해 주세요">

            <label for="pass" class="form-label">비밀번호 : </label>
            <input type="password" class="form-control" id="pass" name="pass" placeholder="비밀번호를 입력해 주세요">
            <a href="joinaction.jsp" class="text-decoration-none">계정이 없으세요?</a>
            <div class="my-5">
                <div class="row">
                    <div class="col-sm d-grid">
                        <button type="submit" class="btn btn-primary">로그 인</button>
                    </div>
                    <div class="col-sm d-grid">
                        <button type="reset" class="btn btn danger" id="btn-list">취소</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
</main>
<c:import url="/layout/Footer.jsp"></c:import>
</body>
</html>
