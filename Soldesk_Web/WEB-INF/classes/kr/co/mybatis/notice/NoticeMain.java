package kr.co.mybatis.notice;

import java.util.Iterator;
import java.util.List;

public class NoticeMain {

	public static void main(String[] args) {
		
		NoticeDAO dao=new NoticeDAO();
		NoticeDTO dto=new NoticeDTO();
		
		// 1)�߰�
		dto=new NoticeDTO(2,"������");
		dao.create(dto);
		System.out.println("���߰��׽�Ʈ");
		
		/*
		//2)�߰�2
		dto = new NoticeDTO("��ΰ�");
		dao.create2(dto);
		System.out.println("���߰��׽�Ʈ");
		*/
	
		/*
		// 5)����
		dto = new NoticeDTO(1,"�عٶ��");	//noticeno=1�� ������ "�عٶ��"����
		dao.update(dto);
		*/
		/*
		// 6)����
		//System.out.println("������ �హ��: "+dao.delete(1));
		System.out.println("������ �హ��: "+dao.delete(3));//noticeno<3 ����
		*/
		
		// 3)���
		//List<NoticeDTO> list = dao.list();
		/*
		// 7)�˻�
		//List<NoticeDTO> list = dao.search("����");
		if(list==null){
			System.out.println("�������� ����.");
		}else{
			Iterator iter = list.iterator();
			while(iter.hasNext()){
				dto = (NoticeDTO)iter.next();
				System.out.println(dto.getNoticeno()+" "+dto.getTitle()+" "+dto.getRdate());
			}
		}
		*/
		/*
		//4)�󼼺���
		dto=dao.read(1); //noticeno=2 ���ڵ� ��������
		System.out.println("��ȣ: "+dto.getNoticeno()+" ����: "+dto.getTitle()+" ��¥: "+dto.getRdate());
		*/
	}

}
