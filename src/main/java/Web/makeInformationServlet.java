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
import java.sql.*;
import domain.userheight;
import domain.usermakeInfor;
import domain.userweight;


/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/makeInformationServlet")
public class makeInformationServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//获取用户名和密码
		String height1 = request.getParameter("height");
String weight1 = request.getParameter("weight1");
//System.out.println(name + "|密码：" + pwd);
System.out.println(height1);
System.out.println(weight1);
//到数据库中查询有没有该用户
//user u = null;
Connection cn = null;
PreparedStatement pst = null;
//ResultSet rs = null;
try
{

	//System.out.println(";");
	usermakeInfor gg = new usermakeInfor(); 
	userheight gg1 = new userheight();
	userweight gg2 = new userweight();
	Class.forName("com.mysql.jdbc.Driver");//修改
	String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
	String username = "root";
	String password = "123456";
	cn = DriverManager.getConnection(url, username, password);
	//System.out.println(";");
	pst = cn.prepareStatement("update user set height=? where UID=?");
	//System.out.println(";");
	pst.setDouble(1, Double.valueOf(height1));
	pst.setString(2, user.getUid());//引用user包
	pst.executeUpdate();
	pst = cn.prepareStatement("update user set weight=? where UID=?");
	//System.out.println(";");
	pst.setDouble(1, Double.valueOf(weight1));
	//System.out.println(";");
	pst.setString(2, user.getUid());//引用user包
	pst.executeUpdate();
	//System.out.println(";");
	gg.setHeight(Double.valueOf(height1));
	gg1.setHeight(Double.valueOf(height1));
	//System.out.println(";");
	gg.setWeight(Double.valueOf(weight1));
	gg2.setWeight(Double.valueOf(weight1));
	//System.out.println(";");
	if(gg != null)
	{
		response.getWriter().write("补充材料成功");
		HttpSession session = request.getSession();
        session.setAttribute("usermakeInfor", gg);
        session.setAttribute("userheight", gg1);
        session.setAttribute("userweight", gg2);
		response.sendRedirect("/work02/index.jsp");
	}
	else
	{
		response.getWriter().write("补充材料未成功");
		response.sendRedirect("/work02/makeInformation.jsp");
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