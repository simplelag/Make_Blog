package com.bitc.make_blog.Controller;

import com.bitc.make_blog.model.BlogDAO;
import com.bitc.make_blog.model.BlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/blogBoard/List.do")
public class ListController  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        BlogDAO dao = new BlogDAO();
        List<BlogDTO> blogList = dao.selectBlogList();
        dao.dbClose();
        req.setAttribute("blogList",blogList);

        req.getRequestDispatcher("/view/list.jsp").forward(req,resp);

    }
}
