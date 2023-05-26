package com.bitc.make_blog.Controller;

import com.bitc.make_blog.model.BlogDAO;
import com.bitc.make_blog.model.BlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blogBoard/Edit.do")
public class EditController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException {
        int blogIdx = Integer.parseInt(req.getParameter("idx"));
        BlogDAO dao = new BlogDAO();
        BlogDTO blog = dao.selectBlogDetail(blogIdx);
        dao.dbClose();

        req.setAttribute("blog", blog);
        req.getRequestDispatcher("/view/edit.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException,ServletException{
        req.setCharacterEncoding("UTF-8");

        BlogDTO blog = new BlogDTO();

        blog.setBlog1Idx(Integer.parseInt(req.getParameter("blogIdx")));
        blog.setBlog1Title(req.getParameter("blogTitle"));
        blog.setBlog1Content("postContent");

        BlogDAO dao = new BlogDAO();
        int result = dao.updateBlog(blog);
        dao.dbClose();

        if(result ==1){
            resp.sendRedirect("/blogBoard/List.do");
        }
        else{
            resp.sendRedirect("/blogList/Edit.do?idx="+blog.getBlog1Idx());
        }


    }
}

