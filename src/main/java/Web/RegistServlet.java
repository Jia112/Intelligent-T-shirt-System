package Web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.dbutils.QueryRunner;
import domain.user;
import jdbcUtils.JDBCUtils;


@WebServlet("/RegistServlet")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("RegistServlet");
		/**
		 * �ж��������֤���Ƿ���ȷ
		 * �������в���
		 * �Ѳ�����װ��user����
		 * ����uid
		 * д�뵽���ݿ�
		 * */
		//�����������
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//��ȡ����   ��֤��
		String code = request.getParameter("code");
		
		System.out.println("code="+code);
		//��ȡ���������ɵ���֤��
		String word = (String) this.getServletContext().getAttribute("checkCode");
		int i = 0;
		//�ж��������֤
		
		if (code.equals(word)) {
			//�����ȷ
			//1.�������в���
			
			String name = request.getParameter("username");
			String sex1 = request.getParameter("sex");
			int sex =Integer.valueOf(sex1);
			//System.out.println(sex);
			String pwd = request.getParameter("password");
			String phone = request.getParameter("phone");
			String device_id = request.getParameter("device_id");
			String relativephone = request.getParameter("relativephone");
			
			Connection cn = null;
			PreparedStatement pst = null;
			ResultSet rs = null;
			try 
			{
				//System.out.println(";");
				Class.forName("com.mysql.jdbc.Driver");//�޸�
			    String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
			    String username = "root";
			    String password = "123456";
			    cn = DriverManager.getConnection(url, username, password);
			    pst = cn.prepareStatement("select username from user");
			    rs = pst.executeQuery();
			    String id = null;
			    while(rs.next())
			    {
			    	id = rs.getString("username");
			    	if(id.equals(name))
			    	{
			    		i = 1;
			    	}
			    	
			    }
			}
			catch (SQLException e)
			{
			    e.printStackTrace();
			}
			//�ж���û��ֵ
 catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//System.out.println(i);
			
			if(i == 1)
			{
				response.getWriter().write("�û����ظ�");
				response.sendRedirect("/work02/regist.jsp");
			}
			else
			{
				//2.�ѽ��յĲ�����װ��user����
				user u = new user();
				
				//3.����uid
				u.setUid(UUID.randomUUID().toString());
			
				//4.д�����ݿ�
				//System.out.println(u.getRelativePhone());
				QueryRunner qr = new QueryRunner(JDBCUtils.getDataSource());
				String sql="insert into user(UID,username,password,phone,device_id,relativephone,sex) value(?,?,?,?,?,?,?)";
				try {
					qr.update(sql,user.getUid(),name,pwd,phone,device_id,relativephone,sex);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//��ת����¼ҳ��
				response.getWriter().write("ע��ɹ�");
				response.sendRedirect("/work02/login.jsp");
			} 
		}
		else {
			//����ȷ���û���֤�������ת��ע��ҳ
			response.getWriter().write("��֤�����");
			response.sendRedirect("/work02/regist.jsp");
			//response.setHeader("refresh", "3;url=/Mystore-RegisterAndLogin/regist.jsp");
		}

			}
	
			

}
