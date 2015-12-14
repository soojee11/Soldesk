package kr.co.solproject.player;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.player.PlayerDAO;
import kr.co.solproject.study.StudyDAO;
import kr.co.solproject.study.StudyDTO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PlayerCont {

	@Autowired
	private PlayerDAO dao = null;

	public PlayerCont() {
		System.out.println("PlayerCont 객체 생성");
	}

	@RequestMapping(value = "/player/player.do", method = RequestMethod.GET)
	public String createForm() {
		return "sol_player/player";
	}

	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.GET)
	public String adminPlayInsert() {
		return "sol_admin/player/playerInsert";
	}

	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.POST)
	public String adminPlayInsertForm(PlayerDTO dto, HttpServletRequest req) {

		String basePath = Utility.getRealPath(req, "/sol_admin/player/storage");

		MultipartFile posterMF = dto.getPosterMF();
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster);

		MultipartFile filenameMF = dto.getFilenameMF();
		String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
		dto.setFilename(filename);
		dto.setFilesize(filenameMF.getSize());
		
		int grade = Integer.parseInt(req.getParameter("grade"));
		String gwamok = req.getParameter("gwamok").trim();
		
		Map map = new HashMap();
		map.put("grade", grade);
		map.put("gwamok", gwamok);

		boolean flag = dao.categoryIns(map);
		
		if(flag) {
			
			int categoryno = dao.getCategoryno(map);
			System.out.println("---cateno:" +categoryno);
			dto.setCategoryno(categoryno);

			boolean flag2 = dao.playerInsert(dto);
			
			if (flag2) {
				req.setAttribute("flag", true);
				
				return "redirect:./leclist.do";
			} else {
				req.setAttribute("msg1", "동영상 업로드 실패<br/><br/>");
				req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
				req.setAttribute("link2", "<input type='button' value='동영상 목록' onclick=\"location.href='./leclist.do'\">");

				return "sol_admin/error";
			}
			
		}else {
			req.setAttribute("msg", "카테고리 등록에 실패하였습니다.<br /><br /> 다시 시도해 주십시오.");
			req.setAttribute("link1", "<input type='button' value='다시시도' onclick=\"history.back();\">");
			req.setAttribute("link2", "<input type='button' value='문제지 목록' onclick=\"location.href='leclist.do';\">");
		
			return "sol_admin/error";
		}
	}//end
	
}
