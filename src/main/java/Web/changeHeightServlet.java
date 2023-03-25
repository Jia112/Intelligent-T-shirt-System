package Web;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import domain.user;
import domain.userheight;

import java.sql.*;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/changeHeightServlet")
public class changeHeightServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
		String height1 = new String();
		height1 = request.getParameter("newHeight");
		
		
//到数据库中查询有没有该用户
//user u = null;
		
Connection cn = null;
PreparedStatement pst = null;
ResultSet rs = null;
double height2 = 0.0;
try
{
	
	userheight gg = new userheight();
	//System.out.println(";");
	Class.forName("com.mysql.jdbc.Driver");//修改
	String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
	String username = "root";
	String password = "123456";
	cn = DriverManager.getConnection(url, username, password);
	pst = cn.prepareStatement("update user set height=? where UID=?");
	pst.setDouble(1, Double.valueOf(height1));
	pst.setString(2, user.getUid());//引用user包
	pst.executeUpdate();
	
	pst = cn.prepareStatement("select height from user where UID=?");
	pst.setString(1, user.getUid());//引用user包
	rs = pst.executeQuery();
	while(rs.next())
	{
		gg.setHeight(rs.getDouble("height"));
		height2 = rs.getDouble("height");
	}
	//user.setHeight(height2);
	
	if (gg != null)
	{
		response.getWriter().write("修改成功");
		HttpSession session = request.getSession();
        session.setAttribute("userheight", gg);
		response.sendRedirect("/work02/myroom2.jsp");
	}
	else
	{
		response.getWriter().write("未修改成功");
		response.sendRedirect("/work02/changeHeight.jsp");
	}
}
catch (SQLException e)
{
	e.printStackTrace();
} catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
response.setContentType("text/html;charset=utf-8");
//判断有没有值


}
}