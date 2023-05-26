package com.bitc.make_blog.Controller2;

import com.bitc.make_blog.model.Blog2DAO;
import com.bitc.make_blog.model.Blog2DTO;
import com.bitc.make_blog.model.BlogDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet("/blogBoard2/list.do")
public class ListController2 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        Blog2DAO dao = new Blog2DAO();
        List<Blog2DTO> blog = dao.selectBlogList2();
        dao.dbClose();
        req.setAttribute("blog", blog);
        req.getRequestDispatcher("/view2/guestbookview.jsp").forward(req,resp);

    }
}
