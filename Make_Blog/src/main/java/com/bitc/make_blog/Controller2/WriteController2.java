package com.bitc.make_blog.Controller2;

import com.bitc.make_blog.model.Blog2DAO;
import com.bitc.make_blog.model.Blog2DTO;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blogBoard/Write2.do")
public class WriteController2  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        req.getRequestDispatcher("/blogBoard2/list.do").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
        req.setCharacterEncoding("UTF-8");

        Blog2DTO blog = new Blog2DTO();
        blog.setName(req.getParameter("name"));
        blog.setContent(req.getParameter("content"));

        Blog2DAO dao = new Blog2DAO();
        int result = dao.insertblogList2(blog);
        dao.dbClose();
        if(result == 1){
            resp.sendRedirect("/blogBoard2/list.do");
        }
        else {
            resp.sendRedirect("/blogBoard2/list.do");
        }

    }
    }

