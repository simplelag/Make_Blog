package com.bitc.make_blog.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BlogDAO extends JDBConnect {
    public BlogDAO(){super();}
//    전체 게시물 목록 가져오기

        public List<BlogDTO> selectBlogList(){
            List<BlogDTO> blogList = new ArrayList<>();

        String sql = "select blog_idx,blog_title,blog_content,blog_id,blog_postdate,blog_visitcount from blog_board order by blog_idx desc";
        try{
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
                BlogDTO blog = new BlogDTO();

                blog.setBlog1Idx(rs.getInt("blog_idx"));
                blog.setBlog1Title(rs.getString("blog_title"));
                blog.setBlog1Content(rs.getString("blog_content"));
                blog.setBlog1Id(rs.getString("blog_id"));
                blog.setBlog1Postdate(rs.getString("blog_postdate"));
                blog.setBlog1Visitcount(rs.getInt("blog_visitcount"));

                blogList.add(blog);
            }

        }
        catch (SQLException e){
            System.out.println("게시물을 가져오는 도중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return blogList;
    }
    public int insertBlogList(BlogDTO blog){
        int result = 0;

        String sql = "insert into blog_board(blog_title,blog_id,blog_content,blog_postdate)";
        sql += "Values(?,?,?,now());";

        try{
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1,blog.getBlog1Title());
            pstmt.setString(2,blog.getBlog1Id());
            pstmt.setString(3,blog.getBlog1Content());
            result =pstmt.executeUpdate();
        }
        catch (SQLException e){
            System.out.println("DB에 Insert중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }
    public BlogDTO selectBlogDetail(int idx){
        BlogDTO blogList = new BlogDTO();

        String sql = "select blog_idx,blog_title,blog_content,blog_id,blog_postdate,blog_visitcount from blog_board where blog_idx = ?;";

        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,idx);
            rs= pstmt.executeQuery();

            while (rs.next()){
                blogList.setBlog1Idx(rs.getInt("blog_idx"));
                blogList.setBlog1Title(rs.getString("blog_title"));
                blogList.setBlog1Content(rs.getString("blog_content"));
                blogList.setBlog1Id(rs.getString("blog_id"));
                blogList.setBlog1Postdate(rs.getString("blog_postdate"));
                blogList.setBlog1Visitcount(rs.getInt("blog_visitcount"));
            }
        }
        catch (SQLException e){
            System.out.println("DB SELECT 작업중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return  blogList;
    }

    public void updateBlogVisits(int blog1Idx){
        String sql = "UPdate blog_board set blog_visitcount = blog_visitcount+1 where blog_idx = ?;";
        try {
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,blog1Idx);

                pstmt.executeUpdate();
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }
    public int updateBlog(BlogDTO blog){
        int result = 0;

        String sql ="update blog_board set blog_title = ?,blog_content = ?,blog_postdate =now() where blog_idx=?;";
        try{
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,blog.getBlog1Title());
            pstmt.setString(2,blog.getBlog1Content());
            pstmt.setInt(3,blog.getBlog1Idx());
            result = pstmt.executeUpdate();

        }
        catch (SQLException e){
            System.out.println("DB UPDATE 중 오류 발생");
            e.printStackTrace();
        }
        return  result;
    }


    //  게시물 삭제하기
    public int deleteBoard(int blog1Idx) {
        int result = 0;
//    DELETE 쿼리 작성
        String sql = "DELETE FROM blog_board WHERE blog_idx = ? ";

        try {
//      PreparedStatement 객체 생성
            pstmt = conn.prepareStatement(sql);
//      SQL 쿼리의 ? 에 실제 데이터 대입
            pstmt.setInt(1, blog1Idx);

//      PreparedStatement를 사용하여 데이터 베이스에 DELETE 쿼리문 전송 및 실행
            result = pstmt.executeUpdate();
        }
        catch (SQLException e) {
            System.out.println("게시물 삭제 시 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }
}
