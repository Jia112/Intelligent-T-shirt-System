
package domain;

import java.security.Timestamp;

public class userPic
{
	private String uid;
	private int[] num = new int[50];
	private double[] temp = new double[50];
	private double[] humi = new double[50];
	private double[] somaTemp = new double[50];
	private String[] somaKind = new String[50];
	private double[] xale = new double[50];
	private double[] yale = new double[50];
	private double[] zale = new double[50];
	private double[] energy = new double[50];
	private String[] sportKind = new String[50];
	private double[] precentKind = new double[7];
	public static String[] healthKind = new String[50];
	private java.sql.Timestamp[] time = new java.sql.Timestamp[50];
	public String getUid()
	{
		return uid;
	}
	public void setUid(String uid)
	{
		this.uid = uid;
	}
	public double[] getTemp()
	{
		return temp;
	}
	public void setTemp(double[] temp)
	{
		this.temp = temp;
	}
	public double[] getHumi()
	{
		return humi;
	}
	public void setHumi(double[] humi)
	{
		this.humi = humi;
	}
	public double[] getSomaTemp()
	{
		return somaTemp;
	}
	public void setSomaTemp(double[] somaTemp)
	{
		this.somaTemp = somaTemp;
	}
	public double[] getXale()
	{
		return xale;
	}
	public void setXale(double[] xale)
	{
		this.xale = xale;
	}
	public double[] getYale()
	{
		return yale;
	}
	public void setYale(double[] yale)
	{
		this.yale = yale;
	}
	public double[] getZale()
	{
		return zale;
	}
	public void setZale(double[] zale)
	{
		this.zale = zale;
	}

	public int[] getNum()
	{
		return num;
	}
	public void setNum(int[] num)
	{
		this.num = num;
	}
	public String[] getSomaKind()
	{
		return somaKind;
	}
	public void setSomaKind(String[] somaKind)
	{
		this.somaKind = somaKind;
	}
	public double[] getEnergy()
	{
		return energy;
	}
	public void setEnergy(double[] energy)
	{
		this.energy = energy;
	}
	public String[] getSportKind()
	{
		return sportKind;
	}
	public void setSportKind(String[] sportKind)
	{
		this.sportKind = sportKind;
	}
	public double[] getPrecentKind()
	{
		return precentKind;
	}
	public void setPrecentKind(double[] precentKind)
	{
		this.precentKind = precentKind;
	}
	public String[] getHealthKind()
	{
		return healthKind;
	}
	public void setHealthKind(String[] healthKind)
	{
		this.healthKind = healthKind;
	}
	public java.sql.Timestamp[] getTime()
	{
		return time;
	}
	public void setTime(java.sql.Timestamp[] time)
	{
		this.time = time;
	}
}

