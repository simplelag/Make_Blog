<%@ page import="com.bitc.make_blog.model.userDAO" %>
<%@ page import="com.bitc.make_blog.model.userDTO" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2023-05-03
  Time: 오전 9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%-- 데이터 베이스 사용을 위한 DTO, DAO 클래스 import--%>


<%-- 클라이언트에서 전달한 데이터 가져오기--%>
<%
    request.setCharacterEncoding("UTF-8");
    String id = request.getParameter("id");
    String pass = request.getParameter("pass");

//  데이터 베이스 연결
    userDAO dao = new userDAO();
//  클라이언트에서 전달한 정보가 데이터 베이스에 존재하는지 확인
    int selectResult = dao.isMember(id, pass);

//  조회 결과가 1이면 데이터 베이스에 해당 정보가 있음, 1이 아니면 오류가 발생
    if (selectResult == 1) {
//    사용자 정보를 데이터베이스에서 가져옴
        userDTO member = dao.selectMember(id,pass);
//    세션에 데이터 저장
        session.setAttribute("id", member.getId());
        session.setAttribute("pass", member.getPass());
        session.setAttribute("name",member.getName());
        session.setAttribute("grade",member.getGrade());
        session.setMaxInactiveInterval(600);
        response.sendRedirect("/blogBoard/List.do");
    }
    else {
//    오류 메시지 출력, 이전 화면으로 이동
        String errMsg = "<script>";
        errMsg += "alert('ID나 비밀번호가 다릅니다.');";
        errMsg += "history.back();";
        errMsg += "</script>";

        out.println(errMsg);
    }
%>

