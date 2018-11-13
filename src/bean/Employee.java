package bean;

import java.sql.Date;

public class Employee {

	private int id;			   //学号
	private String name;       //姓名
	private int typeid;          //职位
	private int age;           //年龄
	private Date entrydate;     //入职时间
	private String staffdesc;   //描述
	private String typename;
	public Employee(int id,String name,int typeid,int age,Date entrydate,String staffdesc,String typename){
		this.id=id;
		this.name=name;
		this.age=age;
		this.typeid=typeid;
		this.entrydate=entrydate;
		this.staffdesc=staffdesc;
		this.typename=typename;
	}
	public Employee(int id,String name,int typeid,int age,Date entrydate,String staffdesc){
		this.id=id;
		this.name=name;
		this.age=age;
		this.typeid=typeid;
		this.entrydate=entrydate;
		this.staffdesc=staffdesc;
	}
	public Employee(int id,String name,String typename,int age,Date entrydate,String staffdesc){
		this.id=id;
		this.name=name;
		this.age=age;
		this.typename=typename;
		this.entrydate=entrydate;
		this.staffdesc=staffdesc;
	}
	
	public Employee() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTypeid() {
		return typeid;
	}
	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Date getEntrydate() {
		return entrydate;
	}
	public void setEntrydate(Date entrydate) {
		this.entrydate = entrydate;
	}
	public String getStaffdesc() {
		return staffdesc;
	}
	public void setStaffdesc(String staffdesc) {
		this.staffdesc = staffdesc;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}

