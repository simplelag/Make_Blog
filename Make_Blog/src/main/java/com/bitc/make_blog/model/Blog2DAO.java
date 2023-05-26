package com.bitc.make_blog.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Blog2DAO extends JDBConnect {
    public int insertblogList2(Blog2DTO blog) {
        int result = 0;
        pstmt =null;
        String sql = "insert into blog_board2(name,content,postdate)Values(?,?,now() );";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, blog.getName());
            pstmt.setString(2, blog.getContent());
            result = pstmt.executeUpdate();
            pstmt.close();
        } catch (SQLException e) {
            System.out.println("DB에 Insert중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return result;
    }

    public List<Blog2DTO> selectBlogList2() {
        List<Blog2DTO> lists = new ArrayList<Blog2DTO>();
        try {
            String sql = "select name,content,postdate,idx from blog_board2 order by idx desc;";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                Blog2DTO blog = new Blog2DTO();
                blog.setName(rs.getString("name"));
                blog.setContent(rs.getString("content"));
                blog.setPostdate(rs.getString("postdate"));
                blog.setIdx(rs.getInt("idx"));
                lists.add(blog);
            }
        } catch (SQLException e) {
            System.out.println("리스트를 불러오는중 오류가 발생했습니다.");
            e.printStackTrace();
        }
        return lists;
    }

    public int deleteBoard(int idx) {
            int result = 0;
//    DELETE 쿼리 작성
            String sql = "DELETE FROM blog_board2 WHERE idx = ? ";

            try {
//      PreparedStatement 객체 생성
                pstmt = conn.prepareStatement(sql);
//      SQL 쿼리의 ? 에 실제 데이터 대입
                pstmt.setInt(1,idx);

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

