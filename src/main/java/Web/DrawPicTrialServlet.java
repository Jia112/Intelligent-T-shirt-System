package Web;

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
import domain.userPic;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/DrawPicTrialServlet")
public class DrawPicTrialServlet extends HttpServlet
{

    private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//数据库连接
	//System.out.println(";");
		Connection cn = null;
PreparedStatement pst = null;
ResultSet rs = null;
//到数据库中查询有没有该用户

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
    double[] Temp = new double[50];
    double[] Humi = new double[50];
    double[] somaTemp = new double[50];
    double[] xale = new double[50];
    double[] yale = new double[50];
    double[] zale = new double[50];
    userPic pp = new userPic();
    int ff = 0;
    int g = 0;
    if (number < 50)
    {
        pst = cn.prepareStatement("select temp,humi,somatempa from somatemp where UID=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            Temp[ff] = rs.getDouble("temp");
            Humi[ff] = rs.getDouble("humi");
            somaTemp[ff] = rs.getDouble("somatempa");
            ff++;
        }
        pst = cn.prepareStatement("select xale,yale,zale from triaxial_acceleration where UID=?");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            xale[g] = rs.getDouble("xale");
            yale[g] = rs.getDouble("yale");
            zale[g] = rs.getDouble("zale");
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
        pp.setTemp(Temp);
        pp.setHumi(Humi);
        pp.setSomaTemp(somaTemp);
        pp.setXale(xale);
        pp.setYale(yale);
        pp.setZale(zale);
    }

    ff = 49;
    g = 49;
    if (number >= 50)
    {
        pst = cn.prepareStatement("select temp,humi,somatempa from somatemp where UID=? order by time desc limit 50");
        pst.setString(1, id);
        //System.out.println(id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            Temp[ff] = rs.getDouble("temp");
            Humi[ff] = rs.getDouble("humi");
            somaTemp[ff] = rs.getDouble("somatempa");
            ff--;
        }
        pst = cn.prepareStatement("select xale,yale,zale from triaxial_acceleration where UID=? order by time desc limit 50");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            xale[g] = rs.getDouble("xale");
            yale[g] = rs.getDouble("yale");
            zale[g] = rs.getDouble("zale");
            g--;
        }
        pp.setTemp(Temp);
        pp.setHumi(Humi);
        pp.setSomaTemp(somaTemp);
        pp.setXale(xale);
        pp.setYale(yale);
        pp.setZale(zale);
    }
    response.setContentType("text/html;charset=utf-8");
    if (pp != null)
    {
        response.getWriter().write("获取成功");
        //保存用户（四个域 用session域）
        HttpSession session = request.getSession();
        session.setAttribute("userPic", pp);
        //跳转到温湿度页面
        response.sendRedirect("/work02/triaxial1.jsp");
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