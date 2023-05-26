<%@ page import="com.bitc.make_blog.model.BlogDAO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-25
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int blog1Idx = Integer.parseInt(request.getParameter("blog1Idx"));
     BlogDAO dao = new BlogDAO();

    int deleteResult = dao.deleteBoard(blog1Idx);
    dao.dbClose();


    if (deleteResult == 1) {
        response.sendRedirect("/blogBoard/List.do");
    }
    else {
        String errMsg = "<script>";
        errMsg += "alert('게시물 삭제 시 오류가 발생했습니다.');";
        errMsg += "history.back();";
        errMsg += "</script>";
        out.println(errMsg);
    }
%>