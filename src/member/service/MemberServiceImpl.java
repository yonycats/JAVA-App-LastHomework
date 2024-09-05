package member.service;

import java.util.List;

import member.dao.IMemberDao;
import member.dao.MemberDaoImpl;
import vo.MemberVO;

public class MemberServiceImpl implements IMemberService {

	private static IMemberService memService = new MemberServiceImpl();
	
	private IMemberDao memDao;
	
	public MemberServiceImpl() {
		memDao = MemberDaoImpl.getInstance();
	}
	
	public static IMemberService getInstance() {
		return memService;
	}
	
	@Override
	public List<MemberVO> memberListSv() {
		return memDao.memberList();
	}

	@Override
	public MemberVO detailMemberSv(String memId) {
		return memDao.detailMember(memId);
	}

	@Override
	public int insertMemberSv(MemberVO mv) {
		return memDao.insertMember(mv);
	}

	@Override
	public int updateMemberSv(MemberVO mv) {
		return memDao.updateMember(mv);
	}

	@Override
	public int deleteMemberSv(String memId) {
		return memDao.deleteMember(memId);
	}

	@Override
	public String checkMemberSv(String memId) {
		return memDao.checkMember(memId);
	}

}
