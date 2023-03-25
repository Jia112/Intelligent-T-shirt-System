package Web;

//import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.*;
import domain.user;
import domain.userInformation;
import domain.userPic;
import domain.userenergy;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/DrawPicHistoryServlet")
public class DrawPicHistoryServlet extends HttpServlet
{

    private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//数据库连接
	//System.out.println(";");
		Connection cn = null;
PreparedStatement pst = null;
ResultSet rs = null;
//到数据库中查询有没有该用户
//System.out.println(";");

try
{

    //System.out.println(";");

    Class.forName("com.mysql.jdbc.Driver");//修改
    String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
    String username = "root";
    String password = "123456";
   
    cn = DriverManager.getConnection(url, username, password);
    //String sql = "select UID from user where username=?";
    pst = cn.prepareStatement("select UID from user where username=?");
    pst.setString(1, user.username);//引用user包
    rs = pst.executeQuery();
    String id = null;
    while (rs.next())
    {
        id = rs.getString("UID");
    }
    pst = cn.prepareStatement("select count(*) from triaxial_acceleration where UID=?");
    pst.setString(1, id);
    rs = pst.executeQuery();
    int number = 0;
    while (rs.next())
    {
        number = rs.getInt("count(*)");
    }
    int[] num = new int[50];
    double[] Temp = new double[50];
    double[] Humi = new double[50];
    double[] somaTemp = new double[50];
    String[] somaKind = new String[50];
    double[] xale = new double[50];
    double[] yale = new double[50];
    double[] zale = new double[50];
    double[] energy = new double[50];
    double[] kind = new double[50];
    double[] temperature = new double[50];
    String[] sportKind = new String[50];
    String[] healthKind = new String[50];
    java.sql.Timestamp[] time = new java.sql.Timestamp[50];

    userPic pp = new userPic();
    int ff = 0;
    int g = 0;
    if (number < 50)
    {
    	//System.out.println(";");
        pst = cn.prepareStatement("select time,temp,humi,somatempa,temperature from somatemp where UID=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
        	//System.out.println(";");
            num[ff] = ff;
            time[ff] = rs.getTimestamp("time");
            Temp[ff] = rs.getDouble("temp");
            Humi[ff] = rs.getDouble("humi");
            somaTemp[ff] = rs.getDouble("somatempa");
            temperature[ff] = rs.getDouble("temperature");
            //System.out.println(";");
            System.out.println(time[ff]);
           
            
            if (rs.getDouble("somatempa") > 33)
            {
                somaKind[ff] = "非常炎热";
            }
            
            
            
            if (temperature[ff] > 25)
            {
            	if(rs.getDouble("somatempa")>65.642)
            	{
            		somaKind[ff] = "非常炎热";
            	}
            	else if(rs.getDouble("somatempa") > 52.085)
            	{
            		somaKind[ff] = "感到炎热";
            	}
            	else if(rs.getDouble("somatempa") > 37.194)
            	{
            		somaKind[ff] ="正常";
            	}
            	else if(rs.getDouble("somatempa") >29.324)
            	{
            		somaKind[ff] ="感到寒冷";
            	}
            	else 
            	{
            		somaKind[ff] ="非常寒冷";
            	}
            }
            else
            {
            	if(rs.getDouble("somatempa") > 26.141)
            	{
            		somaKind[ff] ="非常炎热";
            	}
            	else if(rs.getDouble("somatempa") > 19.690)
            	{
            		somaKind[ff] ="感到炎热";
            	}
            	else if(rs.getDouble("somatempa") > 17.028)
            	{
            		somaKind[ff] ="正常";
            	}
            	else if(rs.getDouble("somatempa") > 14.821)
            	{
            		somaKind[ff] ="感到寒冷";
            	}
            	else 
            	{
            		somaKind[ff] ="非常寒冷";
            	}
            }
            ff++;
        }
        pst = cn.prepareStatement("select xale,yale,zale,energy,kind from triaxial_acceleration where UID=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            xale[g] = rs.getDouble("xale");
            yale[g] = rs.getDouble("yale");
            zale[g] = rs.getDouble("zale");
            energy[g] = rs.getDouble("energy");
            kind[g] = rs.getInt("kind");
            if (rs.getInt("kind") == 0)
            {
                sportKind[g] = "未知运动";
            }
            if (rs.getInt("kind") == 1)
            {
                sportKind[g] = "平躺";
            }
            if (rs.getInt("kind") == 2)
            {
                sportKind[g] = "坐着工作";
            }
            if (rs.getInt("kind") == 3)
            {
                sportKind[g] = "站立";
            }
            if (rs.getInt("kind") == 4)
            {
                sportKind[g] = "走路";
            }
            if (rs.getInt("kind") == 5)
            {
                sportKind[g] = "跑步";
            }
            if (rs.getInt("kind") == 6)
            {
                sportKind[g] = "上楼梯";
            }
            g++;
        }
        for (int i = ff, j = g; i < 50 && j < 50; i++,j++)
        {
            Temp[i] = 0.0;
            Humi[i] = 0.0;
            somaTemp[i] = 0.0;
            xale[j] = 0.0;
            yale[j] = 0.0;
            zale[j] = 0.0;
        }
        for (int i = 0; i < ff; i++)
        {
            if ((somaTemp[i] > 33 && kind[i] == 0) || (somaTemp[i] <= 18 && kind[i] == 0))
            {
                healthKind[i] = "处于非常危险状态";
            }
            else if ((somaTemp[i] > 30 && somaTemp[i] <= 33) && kind[i] == 0)
            {
                healthKind[i] = "处于危险状态";
            }
            else if (((somaTemp[i] > 26 && somaTemp[i] <= 30) && kind[i] == 0) || ((somaTemp[i] > 18 && somaTemp[i] <= 22) && kind[i] == 0))
            {
                healthKind[i] = "处于亚健康状态";
            }
            else
            {
                healthKind[i] = "处于健康状态";
            }
        }
        pp.setNum(num);
        pp.setTemp(Temp);
        pp.setHumi(Humi);
        pp.setSomaTemp(somaTemp);
        pp.setSomaKind(somaKind);
        pp.setXale(xale);
        pp.setYale(yale);
        pp.setZale(zale);
        pp.setEnergy(energy);
        pp.setSportKind(sportKind);
        pp.setHealthKind(healthKind);
        pp.setTime(time);
    }

    ff = 49;
    g = 49;
    if (number >= 50)
    {
        pst = cn.prepareStatement("select time,temp,humi,somatempa from somatemp where UID=? order by time desc limit 50");
        pst.setString(1, id);
        //System.out.println(id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            num[ff] = ff;
            time[ff] = rs.getTimestamp("time");
            Temp[ff] = rs.getDouble("temp");
            Humi[ff] = rs.getDouble("humi");
            somaTemp[ff] = rs.getDouble("somatempa");
            if (rs.getDouble("somatempa") > 33)
            {
                somaKind[ff] = "非常炎热";
            }
            if (rs.getDouble("somatempa") > 30 && rs.getDouble("somatempa") <= 33)
            {
                somaKind[ff] = "炎热";
            }
            if (rs.getDouble("somatempa") > 26 && rs.getDouble("somatempa") <= 30)
            {
                somaKind[ff] = "微热";
            }
            if (rs.getDouble("somatempa") > 22 && rs.getDouble("somatempa") <= 26)
            {
                somaKind[ff] = "正常";
            }
            if (rs.getDouble("somatempa") > 18 && rs.getDouble("somatempa") <= 22)
            {
                somaKind[ff] = "感到寒冷";
            }
            if (rs.getDouble("somatempa") <= 18)
            {
                somaKind[ff] = "失温";
            }
            ff--;
        }
        pst = cn.prepareStatement("select xale,yale,zale,energy,kind from triaxial_acceleration where UID=? order by time desc limit 50");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            xale[g] = rs.getDouble("xale");
            yale[g] = rs.getDouble("yale");
            zale[g] = rs.getDouble("zale");
            energy[g] = rs.getDouble("energy");
            kind[g] = rs.getInt("kind");
            if (rs.getInt("kind") == 0)
            {
                sportKind[g] = "未知运动";
            }
            if (rs.getInt("kind") == 1)
            {
                sportKind[g] = "坐着工作";
            }
            if (rs.getInt("kind") == 2)
            {
                sportKind[g] = "站立";
            }
            if (rs.getInt("kind") == 3)
            {
                sportKind[g] = "走路";
            }
            if (rs.getInt("kind") == 4)
            {
                sportKind[g] = "上楼梯";
            }
            g--;
        }
        for(int i = 0;i < 50;i++)
        {
            if ((somaTemp[i] > 33 && kind[i] == 0) || (somaTemp[i] <= 18 && kind[i] == 0))
            {
                healthKind[i] = "处于非常危险状态";
            }
            else if ((somaTemp[i] > 30 && somaTemp[i] <= 33) && kind[i] == 0)
            {
                healthKind[i] = "处于危险状态";
            }
            else if (((somaTemp[i] > 26 && somaTemp[i] <= 30) && kind[i] == 0) || ((somaTemp[i] > 18 && somaTemp[i] <= 22) && kind[i] == 0))
            {
                healthKind[i] = "处于亚健康状态";
            }
            else
            {
                healthKind[i] = "处于健康状态";
            }
        }
        pp.setNum(num);
        pp.setTemp(Temp);
        pp.setHumi(Humi);
        pp.setSomaTemp(somaTemp);
        pp.setSomaKind(somaKind);
        pp.setXale(xale);
        pp.setYale(yale);
        pp.setZale(zale);
        pp.setEnergy(energy);
        pp.setSportKind(sportKind);
        pp.setHealthKind(healthKind);
        pp.setTime(time);
    }
    response.setContentType("text/html;charset=utf-8");
    //System.out.println(pp.healthKind[0]);
    if (pp != null)
    {
        response.getWriter().write("获取成功");
        //保存用户（四个域 用session域）
        HttpSession session = request.getSession();
        session.setAttribute("userPic", pp);
        //跳转到温湿度页面
        response.sendRedirect("/work02/history1.jsp");
    }
    else
    {
        response.getWriter().write("获取失败");
        //跳转回注册页面
        //response.sendRedirect("/work02/regist.jsp");
    }
}
catch (SQLException e)
{
    e.printStackTrace();
}
//判断有没有值
catch (ClassNotFoundException e)
{
    // TODO Auto-generated catch block
    e.printStackTrace();
}
      
	}
}