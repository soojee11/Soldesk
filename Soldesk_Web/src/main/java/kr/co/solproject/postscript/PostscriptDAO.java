package kr.co.solproject.postscript;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class PostscriptDAO {

	private SqlMapClient mybatis = null;

	public PostscriptDAO() {
		mybatis = GetSqlMapClient.get();
		System.out.println("---------------PostscriptDAO 객체 생성");
	}

	/** 후기 리스트 조회 **/
	public List getList(Map map) {
		List list = null;
		try {
			System.out.println(map.toString());
			list = mybatis.queryForList("sol_postscript.postList", map);
			System.out.println(list.toString());
		} catch (Exception e) {
			System.out.println("postList error" + e);
		}
		return list;
	}// end

	/** 후기 리스트 갯수 조회 **/
	public int getTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_postscript.postTotal", map);
		} catch (Exception e) {
			System.out.println("postTotal error: " + e);
		}
		return res;
	}

	public int postInsert(PostscriptDTO dto) {
		int res = 0;
		try {
			res = mybatis.update("sol_postscript.insert", dto);
		} catch (Exception e) {
			System.out.println("post create error: " + e);
		}
		return res;

	}
}
