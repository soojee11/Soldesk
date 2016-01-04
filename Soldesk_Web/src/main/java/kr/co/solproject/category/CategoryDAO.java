package kr.co.solproject.category;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.co.solproject.GetSqlMapClient;

@Component
public class CategoryDAO {
	private SqlMapClient mybatis = null;

	public CategoryDAO() {
		mybatis = GetSqlMapClient.get();
	}
	
	public String checkCateinfo(int grade, String gwamok) {
		String categoryInfo = null;
		try {
			Map map = new HashMap();
			map.put("grade", grade);
			map.put("gwamok", gwamok);

			categoryInfo = (String) mybatis.queryForObject("sol_category.checkCateinfo", map);

		} catch (Exception e) {
			System.out.println("categoryInfo error: " + e);
		}
		return categoryInfo;
	}// end
	
	public boolean cateIns(CategoryDTO dto) {
		boolean flag = false;
		try {
			int cnt = mybatis.update("sol_category.cateIns", dto);
			if (cnt > 0)
				flag = true;
		} catch (Exception e) {
			System.out.println("cateIns error: " + e);
		}
		return flag;
	}// end
	
	public List readCateInfo(Map map) {
		List list = null;
		try {
			list = mybatis.queryForList("sol_category.readCateInfo", map);
		} catch (Exception e) {
			System.out.println("readCateInfo error" + e);
		}
		return list;
	}// end
	
	public int getCateTotal(Map map) {
		int res = 0;
		try {
			res = (Integer) mybatis.queryForObject("sol_category.getCateTotal", map);
		} catch (Exception e) {
			System.out.println("getCateTotal error: " + e);
		}
		return res;
	}//end

}
