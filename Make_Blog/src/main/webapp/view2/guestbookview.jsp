<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-25
  Time: 오전 10:37
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
        $(".button-delete").on("click", function () {
            const blog_idx = $(this).parent().children(".blog-idx").val();
            let confirmed = confirm("정말로 삭제하시겠습니까?");
            if(confirmed) {
                // const idx = $(this).siblings("#blog_idx").val();
                let url ="/view2/DeleteProcess.jsp?blog_idx="+ blog_idx;
                location.href = url;
            }
        });
    });
</script>

    <title>끄적끄적</title>
</head>
<body>
<c:import url="/layout/Header.jsp"></c:import>
<div class="container my-3">
<div id="writeguest">
    <form action="/blogBoard/Write2.do" method="post">
<%--        <input type="hidden" id="blog_idx" name="idx" value=${blog.idx} readonly>--%>
        <input type="text" class="form-control d-grid" id="name" name="name" value="<%= session.getAttribute("name")%>" readonly>
        <div class="row">
            <div class="col-sm-3">
                <label for="content" class="label-form">내용</label>
                </div>
            <div class="com-sm-3">
        <textarea name="content" id="content" cols="123" rows="3" class="mt-1"></textarea>
            </div>
            <div class="com-sm-3 mt-3">
                 <button type="submit" class="btn btn-primary mb-2">등록</button>
            </div>
        </div>
    </form>
    <div class="card mt-2">
        <div class="card-body">
    <c:choose>
        <c:when test="${empty blog}">
            <tr>
                <td colspan="3">등록된 방명록이 없습니다.</td>
            </tr>
        </c:when>
        <c:otherwise>
            <c:forEach items="${blog}" var="item" varStatus="loop">
                <div>
                    <input type="hidden" class="blog-idx" value="${item.idx}">
                    <h5 class="card-title">${item.name}</h5>
                    <h6 class="card-subtitle mb-2 text muted">${item.postdate}</h6><br>
                    <p class="card-text">${item.content}</p>
                    <button type="reset" name="button-delete" class="btn btn-danger my-3 d-flex justify-content-end button-delete">삭제</button>
                </div>
                <hr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
        </div>
    </div>
</div>
<br><br>
</div>
<c:import url="/layout/Footer.jsp"></c:import>
</body>
</html>
