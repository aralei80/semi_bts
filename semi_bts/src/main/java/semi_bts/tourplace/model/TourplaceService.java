package semi_bts.tourplace.model;

import java.sql.SQLException;
import java.util.List;

public class TourplaceService {
	private TourplaceDAO tpDao;
	public static final int CAT_PLACE = 1;
	public static final int CAT_FOOD = 2;
	
	public TourplaceService() {
		tpDao = new TourplaceDAO();
	}

	public List<TourplaceDTO> selectAll(String condition, String keyword) throws SQLException{
		return tpDao.selectAll(condition, keyword);
	}
	public List<TourplaceDTO> selectByCatNo(int catNo) throws SQLException{
		return tpDao.selectByCatNo(catNo);
	}
	public TourplaceDTO selectByNo(int no) throws SQLException {
		return tpDao.selectByNo(no);
	}
}
