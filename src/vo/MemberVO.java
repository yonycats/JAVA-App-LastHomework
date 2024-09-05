package vo;

public class MemberVO {
	
	private String memId; // 회원 아이디
	private String memPass; // 회원 비밀번호
	private String memName; // 회원 이름
	private String memTel; // 회원 전화번호
	private String memAddr; // 회원 주소
	private String memPhoto; // 회원 프로필사진
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPass() {
		return memPass;
	}
	public void setMemPass(String memPass) {
		this.memPass = memPass;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemTel() {
		return memTel;
	}
	public void setMemTel(String memTel) {
		this.memTel = memTel;
	}
	public String getMemAddr() {
		return memAddr;
	}
	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}
	public String getMemPhoto() {
		return memPhoto;
	}
	public void setMemPhoto(String memPhoto) {
		this.memPhoto = memPhoto;
	}
	
	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPass=" + memPass + ", memName=" + memName + ", memTel=" + memTel
				+ ", memAddr=" + memAddr + ", memPhoto=" + memPhoto + "]";
	}
	
}
