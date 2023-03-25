package Web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import domain.user;
import jdbcUtils.JDBCUtils;
import java.sql.*;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/forgetPasswordServlet")
public class forgetPasswordServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
	//System.out.println(";");
		String username = request.getParameter("username");
//到数据库中查询有没有该用户
QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
String sql = "select * from user where username=?";
user u = null;
try
{
	u = qr.query(sql, new BeanHandler<>(user.class),username);
} catch (SQLException e)
{
	e.printStackTrace();
}
response.setContentType("text/html;charset=utf-8");
//判断有没有值
if (u != null)
{
	Connection cn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
    try
    {
		Class.forName("com.mysql.jdbc.Driver");//修改
		String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
		String username1 = "root";
		String password1 = "123456";
		cn = DriverManager.getConnection(url, username1, password1);
		pst = cn.prepareStatement("select password from user where username=?");
		pst.setString(1,username) ;//引用user包
		rs = pst.executeQuery();
		String password = new String();
		while(rs.next())
        {
			password = rs.getString("password");
        }
		u.password = password;
	}
	catch (SQLException e)
	{
		e.printStackTrace();
	} catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//跳转到主页面
    HttpSession session = request.getSession();
    session.setAttribute("user", u);
	response.sendRedirect("/work02/returnPassword.jsp");
	//response.sendRedirect("/work02/index.jsp");
}
else
{
	response.getWriter().write("查询失败");
	//跳转回注册页面
	response.sendRedirect("/work02/forgetPassword.jsp");
}
	}
}
