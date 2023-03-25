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
import domain.userweight;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/changeWeightServlet")
public class changeWeightServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//��ȡ�û���������
		String weight1 = request.getParameter("newWeight");
//�����ݿ��в�ѯ��û�и��û�
//user u = null;
		double weight2 = 0.0;
		weight2 = Double.valueOf(weight1);
Connection cn = null;
PreparedStatement pst = null;
ResultSet rs = null;
try
{
	userweight gg = new userweight();
	//System.out.println(";");
	Class.forName("com.mysql.jdbc.Driver");//�޸�
	String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
	String username = "root";
	String password = "123456";
	cn = DriverManager.getConnection(url, username, password);
	pst = cn.prepareStatement("update user set weight=? where UID=?");
	pst.setDouble(1, Double.valueOf(weight1));
	pst.setString(2, user.getUid());//����user��
	pst.executeUpdate();
	gg.setWeight(Double.valueOf(weight1));
	
	if (gg != null)
	{
		response.getWriter().write("�޸ĳɹ�");
		HttpSession session = request.getSession();
        session.setAttribute("userweight", gg);
		response.sendRedirect("/work02/myroom2.jsp");
	}
	else
	{
		response.getWriter().write("δ�޸ĳɹ�");
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
//�ж���û��ֵ


}
}