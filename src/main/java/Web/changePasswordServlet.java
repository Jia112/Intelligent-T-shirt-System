package Web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import domain.user;
import jdbcUtils.JDBCUtils;
import java.sql.*;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
		String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
String newPassword1 = request.getParameter("newPassword1");
//System.out.println(name + "|密码：" + pwd);
//到数据库中查询有没有该用户
QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
String sql = "select * from user where username=? and password=?";
user u = null;
try
{
	u = qr.query(sql, new BeanHandler<>(user.class),user.username,oldPassword);
		} catch (SQLException e)
{
	e.printStackTrace();
}
response.setContentType("text/html;charset=utf-8");
//System.out.println(u.getPassword());
//判断有没有值
if (u != null)
{
	response.getWriter().write("密码输入正确");
	Connection cn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	try
	{

		//System.out.println(";");

		Class.forName("com.mysql.jdbc.Driver");//修改
		String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
		String username = "root";
		String password = "123456";
		cn = DriverManager.getConnection(url, username, password);
		//String sql = "select UID from user where username=?";
		pst = cn.prepareStatement("update user set password=? where username=?");
		pst.setString(1, newPassword);
		pst.setString(2, user.username);//引用user包
		pst.executeUpdate();
		//跳转到主页面
		//response.sendRedirect("SearchServlet");
		
	}
	catch (SQLException e)
	{
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	response.sendRedirect("/work02/login.jsp");
}
else
{
	
	response.getWriter().write("密码输入错误，请重新输入");
	//跳转回注册页面
	response.sendRedirect("/work02/ChangePasswd.jsp");
}
	}
}