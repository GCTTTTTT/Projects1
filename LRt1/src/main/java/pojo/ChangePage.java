package pojo;

public class ChangePage {
	private int page; //Ĭ�ϵ�һҳ
	private int limit; //Ĭ��һҳ10������
	private int startRow = (page-1)*limit;//mysql�������֮�����ı�
	private String sort;//�����ֶ�
	private String order;//����ؼ���
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getStartRow() {
		return (page-1)*limit;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
}
