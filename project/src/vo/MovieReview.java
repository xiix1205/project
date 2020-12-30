package vo;

public class MovieReview {

	private int m_id;
	private int m_star;
	private String m_review;
	private String m_date;
	private String id;
	
	public MovieReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MovieReview(int m_id, int m_star, String m_review, String m_date, String id) {
		super();
		this.m_id = m_id;
		this.m_star = m_star;
		this.m_review = m_review;
		this.m_date = m_date;
		this.id = id;
	}

	public int getM_id() {
		return m_id;
	}

	public void setM_id(int m_id) {
		this.m_id = m_id;
	}

	public int getM_star() {
		return m_star;
	}

	public void setM_star(int m_star) {
		this.m_star = m_star;
	}

	public String getM_review() {
		return m_review;
	}

	public void setM_review(String m_review) {
		this.m_review = m_review;
	}

	public String getM_date() {
		return m_date;
	}

	public void setM_date(String m_date) {
		this.m_date = m_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
}
