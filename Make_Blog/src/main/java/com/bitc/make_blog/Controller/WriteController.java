package com.bitc.make_blog.Controller;

import com.bitc.make_blog.model.BlogDAO;
import com.bitc.make_blog.model.BlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blogBoard/Write.do")
public class WriteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req,HttpServletResponse resp) throws  IOException,ServletException{
        req.getRequestDispatcher("/view/write.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws IOException, ServletException{
        req.setCharacterEncoding("UTF-8");

        BlogDTO blog = new BlogDTO();

        blog.setBlog1Title(req.getParameter("title"));
        blog.setBlog1Id(req.getParameter("id"));
        blog.setBlog1Content(req.getParameter("contents"));

        BlogDAO dao = new BlogDAO();
        int result = dao.insertBlogList(blog);
        dao.dbClose();

        if(result == 1){
            resp.sendRedirect("/blogBoard/List.do");
        }
        else{
            resp.sendRedirect("/blogBoard/Write.do");
        }
    }
}
