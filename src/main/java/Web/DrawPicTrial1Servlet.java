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
import domain.userPic;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/DrawPicTrial1Servlet")
public class DrawPicTrial1Servlet extends HttpServlet
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
    userPic pp = new userPic();
    //画统计图
    int[] count = new int[7];
    double[] precent = new double[7];
    int yy = 0;
    for (int i = 0; i < 7; i++)
    {
        count[i] = 0;
        precent[i] = 0.0;
    }
    //System.out.println(id);
    if (number < 86400 * 2)
    {
        pst = cn.prepareStatement("select kind,count(time) from triaxial_acceleration where UID=? group by kind");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            count[rs.getInt("kind")] = rs.getInt("count(time)");
          
            precent[rs.getInt("kind")] = Double.valueOf(Double.valueOf(rs.getInt("count(time)")) / number) * 100;
        }
    }
    if (number >= 86400 * 2)
    {
        pst = cn.prepareStatement("SELECT kind,COUNT(TIME) FROM (SELECT * FROM triaxial_acceleration ORDER BY TIME DESC LIMIT 172800 )AS test WHERE UID=?  GROUP BY kind");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            count[rs.getInt("kind")] = rs.getInt("count(time)");
            precent[rs.getInt("kind")] = Double.valueOf(Double.valueOf(rs.getInt("count(time)")) / number) * 100;
        }
    }
    
    pp.setPrecentKind(precent);
   
    response.setContentType("text/html;charset=utf-8");
    if (pp != null)
    {
        response.getWriter().write("获取成功");
        //保存用户（四个域 用session域）
        HttpSession session = request.getSession();
        session.setAttribute("userPic", pp);
        //跳转到温湿度页面
        response.sendRedirect("/work02/triaxial2.jsp");
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