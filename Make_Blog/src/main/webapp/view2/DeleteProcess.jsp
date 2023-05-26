
<%@ page import="com.bitc.make_blog.model.Blog2DAO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-25
  Time: 오후 12:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int idx = Integer.parseInt(request.getParameter("blog_idx"));
     Blog2DAO dao = new Blog2DAO();

    int deleteResult = dao.deleteBoard(idx);
    dao.dbClose();


    if (deleteResult == 1) {
        response.sendRedirect("/blogBoard2/list.do");
    }
    else {
        String errMsg = "<script>";
        errMsg += "alert('게시물 삭제 시 오류가 발생했습니다.');";
        errMsg += "history.back();";
        errMsg += "</script>";
        out.println(errMsg);
    }
%>