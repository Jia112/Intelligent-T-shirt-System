package domain;

public class user
{
	private static String uid;
	public static String username;
	public static String password;
	private String phone;
	private String code;
	private String device_id;
	private String relativephone;
	public static String getUid()
	{
		return uid;
	}
	public void setUid(String uid)
	{
		this.uid = uid;
	}
	public String getUsername()
	{
		return username;
	}
	public void setUsername(String username)
	{
		this.username = username;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPhone()
	{
		return phone;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}
	public String getRelativePhone()
	{
		return relativephone;
	}
	public void setRelativePhone(String relativephone)
	{
		this.relativephone = relativephone;
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	
	
	 public String getDevice_id() {
			return device_id;
		}
	public void setDevice_id(String device_id) {
		this.device_id = device_id;
	}
		
	


}
