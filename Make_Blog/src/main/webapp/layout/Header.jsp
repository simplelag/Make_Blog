<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-22
  Time: 오후 4:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <script>
    $(document).ready(function() {
        $("#btn-login").on("click", function () {
            location.href="/view/login.jsp"
        })
    });
</script>
    <script>
    $(document).ready(function() {
        $("#btn-guest").on("click", function () {
            location.href="/blogBoard2/list.do"
        })
    });
    </script>
<script>
    $(document).ready(function() {
        $("#btn-logout").on("click", function () {
            location.href="/view/logoutprocess.jsp"
        })
    });
</script>

<header class="container">
    <nav class="navbar navbar-expend-lg bg-danger">
        <h4 style="color:white" class="d-flex justify-content-start my-3 ms-2"><a href="/blogBoard/List.do" class="text-decoration-none" style="color: white">끄적끄적</a></h4>
        </div>
        <div class="d-flex justify-content-end">
                <ul class="nav  justify-content-end ">
                <%

                    if(session.getAttribute("id") != null){
                %>
                    <li class="navbar-text me-2 float-end" style="font-size: 15pt"><%= session.getAttribute("name").toString()%>님 어서오세요</li>
                    <button type="button" class="btn btn-danger me-2" id="btn-logout">로그아웃</button>

                </ul>
                    <button type="button" class="btn btn-success" id="btn-guest">방명록</button>
                <%
                    }
                else {
                %>
                    <button type="button" id="btn-login" class="btn btn-success p-2 float-end me-3 mt-2">Log-in</button>
                <%
                    }
                %>
            </form>
        </div>
    </nav>
</header>