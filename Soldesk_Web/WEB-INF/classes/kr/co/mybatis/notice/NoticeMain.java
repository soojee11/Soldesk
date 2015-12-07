package kr.co.mybatis.notice;

import java.util.Iterator;
import java.util.List;

public class NoticeMain {

	public static void main(String[] args) {
		
		NoticeDAO dao=new NoticeDAO();
		NoticeDTO dto=new NoticeDTO();
		
		// 1)추가
		dto=new NoticeDTO(2,"개나리");
		dao.create(dto);
		System.out.println("행추가테스트");
		
		/*
		//2)추가2
		dto = new NoticeDTO("김민경");
		dao.create2(dto);
		System.out.println("행추가테스트");
		*/
	
		/*
		// 5)수정
		dto = new NoticeDTO(1,"해바라기");	//noticeno=1의 제목을 "해바라기"수정
		dao.update(dto);
		*/
		/*
		// 6)삭제
		//System.out.println("삭제된 행갯수: "+dao.delete(1));
		System.out.println("삭제된 행갯수: "+dao.delete(3));//noticeno<3 삭제
		*/
		
		// 3)목록
		//List<NoticeDTO> list = dao.list();
		/*
		// 7)검색
		//List<NoticeDTO> list = dao.search("종로");
		if(list==null){
			System.out.println("공지사항 없음.");
		}else{
			Iterator iter = list.iterator();
			while(iter.hasNext()){
				dto = (NoticeDTO)iter.next();
				System.out.println(dto.getNoticeno()+" "+dto.getTitle()+" "+dto.getRdate());
			}
		}
		*/
		/*
		//4)상세보기
		dto=dao.read(1); //noticeno=2 레코드 가져오기
		System.out.println("번호: "+dto.getNoticeno()+" 내용: "+dto.getTitle()+" 날짜: "+dto.getRdate());
		*/
	}

}
