package kr.co.solproject.player;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.solproject.player.PlayerDAO;
import kr.co.solproject.study.StudyDAO;
import net.utility.UploadSaveManager;
import net.utility.Utility;

@Controller
public class PlayerCont {

	@Autowired
	private PlayerDAO dao = null;

	public PlayerCont() {
		System.out.println("PlayerCont ��ü ����");
	}

	@RequestMapping(value = "/player/player.do", method = RequestMethod.GET)
	public String createForm() {
		// ���⼭ ������ ������ ��������
		return "sol_player/player";
	}

	// admin ������ ���
	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.GET)
	public String adminPlayInsert() {
		return "sol_admin/player/playerInsert";
	}

	// admin ������ ��� form
	@RequestMapping(value = "sol_admin/lecinsert.do", method = RequestMethod.POST)
	public String adminPlayInsertForm(PlayerDTO dto, HttpServletRequest req) {

		// ���۵� ������ ����� ���� �������� ��� �ľ�
		String basePath = Utility.getRealPath(req, "/sol_admin/player/storage");

		// 1)postMF ���� ����
		MultipartFile posterMF = dto.getPosterMF();
		// ���� ���� �� �����ӵ� ���ϸ� ��ȯ
		String poster = UploadSaveManager.saveFileSpring30(posterMF, basePath);
		dto.setPoster(poster);

		// 2) filenameMF ���� ����
		MultipartFile filenameMF = dto.getFilenameMF();
		String filename = UploadSaveManager.saveFileSpring30(filenameMF, basePath);
		dto.setFilename(filename);
		dto.setFilesize(filenameMF.getSize());
		
		// categoryno
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
				req.setAttribute("msg1", "������ ���ε� ����<br/><br/>");
				req.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
				req.setAttribute("link2", "<input type='button' value='������ ���' onclick=\"location.href='./leclist.do'\">");

				return "sol_admin/error";
			}
			
		}else {
			req.setAttribute("msg", "ī�װ� ��Ͽ� �����Ͽ����ϴ�.<br /><br /> �ٽ� �õ��� �ֽʽÿ�.");
			req.setAttribute("link1", "<input type='button' value='�ٽýõ�' onclick=\"history.back();\">");
			req.setAttribute("link2", "<input type='button' value='������ ���' onclick=\"location.href='leclist.do';\">");
		
			return "sol_admin/error";
		}
	}//end
	
	


}
