package member.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import util.MyBatisUtil;
import vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {

	private static IMemberDao memDao = new MemberDaoImpl();
	
	private MemberDaoImpl() {
	}
	
	public static IMemberDao getInstance() {
		return memDao;
	}
	
	@Override
	public List<MemberVO> memberList() {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		List<MemberVO> mvList = null;
		
		try {
			mvList = session.selectList("member.memberList");
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return mvList;
	}

	@Override
	public MemberVO detailMember(String memId) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		MemberVO mv = null;
		
		try {
			mv = session.selectOne("member.detailMember", memId);
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return mv;
	}

	@Override
	public int insertMember(MemberVO mv) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.insert("member.insertMember", mv);
			
			if (cnt > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();			
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int updateMember(MemberVO mv) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.update("member.updateMember", mv);
			
			if (cnt > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();			
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public int deleteMember(String memId) {
		SqlSession session = MyBatisUtil.getSqlSession();
		
		int cnt = 0;
		
		try {
			cnt = session.delete("member.deleteMember", memId);
			
			if (cnt > 0) {
				session.commit();
			}
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();			
		} finally {
			session.close();
		}
		return cnt;
	}

	@Override
	public String checkMember(String memId) {
		SqlSession session = MyBatisUtil.getSqlSession(true);
		
		String check = "";
		
		try {
			check = session.selectOne("member.checkMember", memId);
			
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return check;
	}

}
