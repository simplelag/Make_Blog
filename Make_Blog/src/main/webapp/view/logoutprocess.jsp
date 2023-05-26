<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-25
  Time: 오전 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    session.removeAttribute("id");
    session.removeAttribute("pass");

    session.invalidate();

    String msg = "<script>";
    msg += "alert('로그 아웃 합니다.');";
    msg += "location.href='/blogBoard/List.do';";
    msg += "</script>";

    out.println(msg);
%>