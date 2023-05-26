package com.bitc.make_blog.Controller;

import com.bitc.make_blog.model.userDAO;
import com.bitc.make_blog.model.userDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static java.lang.System.out;

@WebServlet("/blogBoard/join.do")
public class JoinController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
        req.getRequestDispatcher("/view/joinaction.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException,ServletException {
        userDTO user = new userDTO();
        user.setId(req.getParameter("id"));
        user.setPass(req.getParameter("pass"));
        user.setName(req.getParameter("name"));

        userDAO dao = new userDAO();
        int result = dao.join(user);
        dao.dbClose();
        if(result == 1){
            String sucmsg = "<script>";
            sucmsg += "alert('환영합니다.');";
            sucmsg += "history.back();";
            sucmsg += "</script>";
            out.println(sucmsg);
            resp.sendRedirect("/blogBoard/List.do");
        }
        else if(result == -1){
            String errmsg = "<script>";
            errmsg += "alert('이미 존재하는 아이디입니다.');";
            errmsg += "history.back();";
            errmsg += "</script>";
            out.println(errmsg);
            resp.sendRedirect("/view/joinaction.jsp");
        }
    }
    }

