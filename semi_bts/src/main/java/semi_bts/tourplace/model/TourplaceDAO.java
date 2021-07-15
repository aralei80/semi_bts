package semi_bts.tourplace.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bts.db.ConnectionPoolMgr2;

public class TourplaceDAO {
	private ConnectionPoolMgr2 pool;
	
	public TourplaceDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<TourplaceDTO> selectByCatNo(int catNo) throws SQLException{
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TourplaceDTO> list = new ArrayList<TourplaceDTO>();
		try {
			//1,2
			conn = pool.getConnection();
			
			//3
			String sql = "select * from tourplace where catNo = ? ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, catNo);
			
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				
				int placeNo = rs.getInt("placeNo");
				String placeName  = rs.getString("placeName");
				String placetitle = rs.getString("placetitle");
				String placeAddress  = rs.getString("placeAddress");
				String placeTel  = rs.getString("placeTel");
				String homepage  = rs.getString("homepage");
				String placeInfo  = rs.getString("placeInfo");
				String latitude  = rs.getString("latitude");
				String longitude  = rs.getString("longitude");
				String imageURL  = rs.getString("imageURL");
				String imagemain  = rs.getString("imagemain");
			
				TourplaceDTO dto = new TourplaceDTO(placeNo,placeName,placetitle,placeAddress,placeTel,homepage,placeInfo,latitude,longitude,catNo,imageURL,imagemain);
				list.add(dto);
			}
			
			System.out.println("글 목록 조회 결과 list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}

	
	
	public List<TourplaceDTO> selectAll(String condition, String keyword) throws SQLException{
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TourplaceDTO> list = new ArrayList<TourplaceDTO>();
		try {
			//1,2
			conn = pool.getConnection();
			
			//3
			String sql = "select * from tourplace  ";
			
			if(keyword!=null && !keyword.isEmpty()) {
				sql+="  where "+ condition +" like '%' || ? || '%'";
			}
			sql+="  order by placeNo";
			
			ps = conn.prepareStatement(sql);
			
			
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				
				int placeNo = rs.getInt("placeNo");
				String placeName  = rs.getString("placeName");
				String placetitle = rs.getString("placetitle");
				String placeAddress  = rs.getString("placeAddress");
				String placeTel  = rs.getString("placeTel");
				String homepage  = rs.getString("homepage");
				String placeInfo  = rs.getString("placeInfo");
				String latitude  = rs.getString("latitude");
				String longitude  = rs.getString("longitude");
				int catNo = rs.getInt("catNo");
				String imageURL  = rs.getString("imageURL");
				String imagemain  = rs.getString("imagemain");
			
				TourplaceDTO dto = new TourplaceDTO(placeNo,placeName,placetitle,placeAddress,placeTel,homepage,placeInfo,latitude,longitude,catNo,imageURL,imagemain);
				list.add(dto);
			}
			
			System.out.println("글 목록 조회 결과 list.size="+list.size()
			+ ", 매개변수 condition="+condition+", keyword="+keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	

	public TourplaceDTO selectByNo(int no) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		TourplaceDTO dto = new TourplaceDTO();
		try {
			//1, 2
			conn = pool.getConnection();
					
			//3
			String sql = "select * from tourplace where placeNo = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			
			//4
			rs = ps.executeQuery();
			if(rs.next()) {
				dto.setPlaceNo(no);
				dto.setPlaceName(rs.getString("placeName")); 
				dto.setPlacetitle(rs.getString("placetitle"));
				dto.setPlaceAddress(rs.getString("placeAddress"));
				dto.setPlaceTel(rs.getString("placeTel"));
				dto.setHomepage(rs.getString("homepage")); 
				dto.setPlaceInfo(rs.getString("placeInfo")); 
				dto.setLatitude(rs.getString("latitude"));  
				dto.setLongitude(rs.getString("longitude")); 
				dto.setCatNo(rs.getInt("catNo"));
				dto.setImageURL(rs.getString("imageURL"));  
				dto.setImagemain(rs.getString("imagemain")); 
			
			}
			System.out.println("여행지 상세조회 결과, vo="+dto+", 매개변수 no="+no);
			return dto;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}	
	
}
