package member.dao;

import java.util.List;

import vo.MemberVO;

public interface IMemberDao {
	/**
	 * DB에 존재하는 모든 회원정보를 가져오기 위한 메서드
	 * @return 모든 회원정보를 담은 List객체
	 */
	public List<MemberVO> memberList ();
	

	/**
	 * 해당 회원의 상세정보를 조회하기 위한 메서드
	 * @param memId 회원 ID
	 * @return 해당 회원의 상세정보를 담은 MemberVO 객체를 리턴함
	 */
	public MemberVO detailMember (String memId);
	
	
	/**
	 * MemberVO에 담겨진 회원정보를 DB에 Insert하기 위한 메서드
	 * @param mv 회원정보를 담은 MemberVO 객체
	 * @return DB작업이 성공하면 1, 실패하면 0 반환됨.
	 */
	public int insertMember (MemberVO mv);
	
	
	/**
	 * MemberVO에 담겨진 회원정보를 DB에 update하기 위한 메서드
	 * @param mv 회원정보를 담은 MemberVO 객체
	 * @return DB작업이 성공하면 1, 실패하면 0 반환됨.
	 */
	public int updateMember (MemberVO mv);
	
	

	/**
	 * 해당 회원정보를 삭제하기 위한 메서드
	 * @param memId 삭제하고자 하는 회원 ID
	 * @return 삭제 처리가 성공하면 1, 실패하면 0 반환됨
	 */
	public int deleteMember (String memId);
	
	

	/**
	 * 해당 회원의 존재여부를 확인하기 위한 메서드
	 * @param memId 존재여부 확인하기 위한 회원 ID
	 * @return 해당 회원이 존재하면  true, 존재하지 않으면 false 리턴함
	 */
	public String checkMember (String memId);
	
	
}
