package com.hanul.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.hanul.util.DBConnector;

public class BoardDAO {

	public int getCount(String kind, String search) throws Exception{
		Connection con = DBConnector.getConnect();
		String sql = "SELECT count(num) FROM board WHERE "+kind+" like ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		
		ResultSet rs = st.executeQuery();
		rs.next();
		
		int result = rs.getInt(1);
		
		DBConnector.disConnect(rs, st, con);
		
		return result;
		
	}
	
	public List<BoardDTO> selectList(String kind, String search, int startRow, int lastRow) throws Exception{
		
		
		Connection con = DBConnector.getConnect();
		String sql = "SELECT * FROM "
				+ "(select rownum R, N.* from "
				+ "(select num, subject, writer, reg_date, hit from board "
				+ "where "+kind+" like ? "
				+ "order by num desc) N) "
				+ "where R between ? and ?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, "%"+search+"%");
		st.setInt(2, startRow);
		st.setInt(3, lastRow);
		ResultSet rs = st.executeQuery();
		
		BoardDTO boardDTO = null;
		List<BoardDTO> ar = new ArrayList<>();
		
		
		while(rs.next()) {
			boardDTO = new BoardDTO();
			boardDTO.setNum(rs.getInt("num"));
			boardDTO.setSubject(rs.getString("subject"));
			//boardDTO.setContent(rs.getString("content"));
			//조회한 쿼리에 content가 없기에 sql문 오류남
			//db 자체에 content가 저장되어있기에 searchbar로 찾는 부분도 문제 없음
			boardDTO.setWriter(rs.getString("writer"));
			boardDTO.setReg_date(rs.getDate("reg_date"));
			boardDTO.setHit(rs.getInt("hit"));
			ar.add(boardDTO);
		}
		
		DBConnector.disConnect(rs, st, con);
		return ar;
		
		
	}
	
}
