package com.bitc.make_blog.Controller;

import com.bitc.make_blog.model.BlogDAO;
import com.bitc.make_blog.model.BlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/blogBoard/View.do")
public class ViewController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException{
        int idx = Integer.parseInt(req.getParameter("idx"));

        BlogDAO dao = new BlogDAO();
        dao.updateBlogVisits(idx);
        BlogDTO blogList = dao.selectBlogDetail(idx);
        dao.dbClose();

        req.setAttribute("blogList",blogList);
        req.getRequestDispatcher("/view/view.jsp").forward(req,resp);
    }
}
