package Web;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.sql.*;
import domain.user;
import domain.userInformation;
import domain.userenergy;
import domain.userheight;
import domain.userweight;



/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet
{

    private static final long serialVersionUID = 1L;

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		//���ݿ�����
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
//�����ݿ��в�ѯ��û�и��û�

try
{

    //System.out.println(";");

    Class.forName("com.mysql.jdbc.Driver");//�޸�
    String url = "jdbc:mysql://localhost:3306/smarttshirt?useUnicode=true&characterEncoding=utf8";
    String username = "root";
    String password = "123456";
    int sex = 0;
    userInformation hh = new userInformation();
    userenergy gg = new userenergy();
    cn = DriverManager.getConnection(url, username, password);
    //String sql = "select UID from user where username=?";
    pst = cn.prepareStatement("select UID,sex from user where username=?");
    pst.setString(1, user.username);//����user��
    rs = pst.executeQuery();
    String id = null;
    while (rs.next())
    {
        id = rs.getString("UID");
        sex = rs.getInt("sex");
    }
    pst = cn.prepareStatement("select * from somatemp where UID=?");
    pst.setString(1, id);
    //System.out.println(id);
    rs = pst.executeQuery();
    double temparature = 0.0;;
    while (rs.next())
    {
        //System.out.println(rs.getDouble("temp"));
        hh.setTemp(rs.getDouble("temp"));
        hh.setHumi(rs.getDouble("humi"));
        hh.setSomatempa(rs.getDouble("somatempa"));
        temparature = rs.getDouble("temperature");
        //System.out.println(hh.getTemp());
    }
    if (temparature > 25)
    {
    	if(hh.getSomatempa()>65.642)
    	{
    		hh.setSomaKind("�ǳ�����");
    	}
    	else if(hh.getSomatempa() > 52.085)
    	{
    		hh.setSomaKind("�е�����");
    	}
    	else if(hh.getSomatempa() > 37.194)
    	{
    		hh.setSomaKind("����");
    	}
    	else if(hh.getSomatempa() >29.324)
    	{
    		hh.setSomaKind("�е�����");
    	}
    	else 
    	{
    		hh.setSomaKind("�ǳ�����");
    	}
    }
    else
    {
    	if(hh.getSomatempa() > 26.141)
    	{
    		hh.setSomaKind("�ǳ�����");
    	}
    	else if(hh.getSomatempa() > 19.690)
    	{
    		hh.setSomaKind("�е�����");
    	}
    	else if(hh.getSomatempa() > 17.028)
    	{
    		hh.setSomaKind("����");
    	}
    	else if(hh.getSomatempa() > 14.821)
    	{
    		hh.setSomaKind("�е�����");
    	}
    	else 
    	{
    		hh.setSomaKind("�ǳ�����");
    	}
    }
    pst = cn.prepareStatement("select * from triaxial_acceleration where UID=?");
    pst.setString(1, id);
    rs = pst.executeQuery();
    double number = 0.0;
    while (rs.next())
    {
        gg.setXale(rs.getDouble("xale"));
        gg.setYale(rs.getDouble("yale"));
        gg.setZale(rs.getDouble("zale"));
        number = rs.getDouble("energy");
        gg.setKind(rs.getInt("kind"));
    }
    double num = Math.sqrt(gg.getXale() * gg.getXale() + gg.getYale() * gg.getYale() + gg.getZale() * gg.getZale());
    BigDecimal bd = new BigDecimal(num);
    num = bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    BigDecimal bd2 = new BigDecimal(number);
    number = bd2.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
    gg.setEnergy(number);
    gg.setSynale(num);
    if (gg.getKind() == 0)
    {
        gg.setSportKind("δ֪�˶�");
    }
    if (gg.getKind() == 1)
    {
        gg.setSportKind("ƽ��");
    }
    if (gg.getKind() == 2)
    {
        gg.setSportKind("���Ź���");
    }
    if (gg.getKind() == 3)
    {
        gg.setSportKind("վ��");
    }
    if (gg.getKind() == 4)
    {
        gg.setSportKind("��·");
    }
    if (gg.getKind() == 5)
    {
        gg.setSportKind("�ܲ�");
    }
    if (gg.getKind() == 6)
    {
        gg.setSportKind("��¥��");
    }

    //System.out.println(gg.getSportKind());

    if ((hh.getSomatempa() > 33 && gg.getKind() == 0) || (hh.getSomatempa() <= 18 && gg.getKind() == 0))
    {
        gg.setHealthKind("���ڷǳ�Σ��״̬");
    }
    else if ((hh.getSomatempa() > 30 && hh.getSomatempa() <= 33) && gg.getKind() == 0)
    {
        gg.setHealthKind("����Σ��״̬");
    }
    else if (((hh.getSomatempa() > 26 && hh.getSomatempa() <= 30) && gg.getKind() == 0) || ((hh.getSomatempa() > 18 && hh.getSomatempa() <= 22) && gg.getKind() == 0))
    {
        gg.setHealthKind("�����ǽ���״̬");
    }
    else
    {
        gg.setHealthKind("���ڽ���״̬");
    }
    //���������һ���������˶���
    double subEnergy;
    double minEnergy;
    double maxEnergy;
    minEnergy = 144 * 4.1858518 * 1000;
    maxEnergy = 180 * 4.1858518 * 1000;
    gg.setMinBasicEnergy(minEnergy);
    gg.setMaxBasicEnergy(maxEnergy);
    if (gg.getEnergy() > gg.getMinBasicEnergy() && gg.getEnergy() < gg.getMaxBasicEnergy())
    {
        gg.setWeatherArrive("��ϲ�������˶��Ѵ�꣬�����Ŭ��" + " " + "������һ����Ҫ�ﵽ���˶�����144~180ǧ��");
    }
    if(gg.getEnergy() < gg.getMinBasicEnergy())
    {
        subEnergy = (minEnergy - gg.getEnergy())/ 4.1858518/1000;
        BigDecimal bd1 = new BigDecimal(subEnergy);
        subEnergy = bd1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        gg.setWeatherArrive("�������˶������٣����ٻ����˶�" + subEnergy + "ǧ��" + " " + "������һ����Ҫ�ﵽ���˶�����144~180ǧ��");
    }
    if(gg.getEnergy() > gg.getMaxBasicEnergy())
    {
    	subEnergy = (maxEnergy - gg.getEnergy())/ 4.1858518/1000;
    	BigDecimal bd3 = new BigDecimal(subEnergy);
        subEnergy = bd2.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        gg.setWeatherArrive("�������˶�����������ע���˶��������ѳ���" + subEnergy + "ǧ��" + " " + "������һ����Ҫ�ﵽ���˶�����144~180ǧ��");
    }
    //ͳ�����ϲ�������˶�
    int[] count = new int[7];
    double[] precent = new double[7];
    int yy = 0;
    for (int i = 0; i < 7; i++)
    {
        count[i] = 0;
        precent[i] = 0.0;
    }
    if (number < 86400 * 2)
    {
        pst = cn.prepareStatement("select kind,count(time) from triaxial_acceleration where UID=? group by kind");
        pst.setString(1, id);
        rs = pst.executeQuery();
        while (rs.next())
        {
            count[rs.getInt("kind")] = rs.getInt("count(time)");
            //precent[rs.getInt("kind")] = (rs.getInt("count(time)") / number) * 100;
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
            //precent[rs.getInt("kind")] = (rs.getInt("count(time)") / number) * 100;
        }
    }
    int max = 0;
    int max_count = 0;
    for (int i = 0; i < 7; i++)
    {
        if (count[i] > max_count)
        {
            max = i;
            max_count = count[i];
        }
    }
    if (max == 0)
    {
        gg.setFavoriteKind("δ֪�˶�");
    }
    if (max == 1)
    {
        gg.setFavoriteKind("ƽ��");
    }
    if (max == 2)
    {
        gg.setFavoriteKind("���Ź���");
    }
    if (max == 3)
    {
        gg.setFavoriteKind("վ��");
    }
    if (max == 4)
    {
        gg.setFavoriteKind("��·");
    }
    if (max == 5)
    {
        gg.setFavoriteKind("�ܲ�");
    }
    if (max == 6)
    {
        gg.setFavoriteKind("��¥��");
    }
    //������Ҫ����
    if(max == 1 || max == 0)
    {
        gg.setSuggestSport("�Ƽ�ÿ��ɢ��2~4����");
    }
    if (max == 2 && gg.getEnergy() < gg.getMinBasicEnergy())
    {
        gg.setSuggestSport("�Ƽ�����ʱ��6�������ҵĽ���");
    }
    if (max == 3 && gg.getEnergy() < gg.getMinBasicEnergy())
    {
        gg.setSuggestSport("�Ƽ�����ʱ��8��������ÿ��20���ӵ��ܲ��˶�");
    }
    if (gg.getEnergy() > gg.getMaxBasicEnergy())
    {
        gg.setSuggestSport("�Ƽ�����Ϣ����Ҫ�����˶�");
    }
    //�ж��û��˶�ǿ��
    double energy = 0;
    pst = cn.prepareStatement("SELECT energy FROM  triaxial_acceleration WHERE UID = ? ORDER BY TIME DESC LIMIT  1 ");
    pst.setString(1, id);
    rs = pst.executeQuery();
    while (rs.next())
    {
       energy = rs.getDouble("energy");
    }
    if(sex == 1)
    {
    	if (energy < 1200)
    	{
    		gg.setExercise("����û���˶�");
    	}
    	else if(energy < 2800)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 4400)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 6000)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 7600)
    	{
    		gg.setExercise("����");
    	}
    	else 
    	{
    		gg.setExercise("����");
    	}
    }
    else
    {
    	if (energy < 1600)
    	{
    		gg.setExercise("����û���˶�");
    	}
    	else if(energy < 4000)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 6000)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 8000)
    	{
    		gg.setExercise("����");
    	}
    	else if(energy < 10000)
    	{
    		gg.setExercise("����");
    	}
    	else 
    	{
    		gg.setExercise("����");
    	}
    }
    
    userheight gg1 = new userheight();
    userweight gg2 = new userweight();
    pst = cn.prepareStatement("select height,weight from user where UID = ?");
    pst.setString(1, id);
    rs = pst.executeQuery();
    while (rs.next())
    {
    	if(rs.getDouble("height") == 0.0)
    	{
    		gg1.setHeight(0.00);
    	}
    	else
    	{
    		gg1.setHeight(rs.getDouble("height"));
    	}
        if(rs.getDouble("height") == 0.0)
        {
        	gg2.setWeight(0.00);
        }
        else
        {
        	gg2.setWeight(rs.getDouble("weight"));
        }
    }
    
    response.setContentType("text/html;charset=utf-8");
    if (hh != null && gg != null)
    {
        response.getWriter().write("��ȡ�ɹ�");
        //�����û����ĸ��� ��session��
        HttpSession session = request.getSession();
        session.setAttribute("userInformation", hh);
        session.setAttribute("userenergy", gg);
        session.setAttribute("userheight", gg1);
        session.setAttribute("userweight", gg2);
        //��ת����ҳ��
        response.sendRedirect("/work02/index.jsp");
    }
    else
    {
        response.getWriter().write("��ȡʧ��");
        //��ת��ע��ҳ��
        //response.sendRedirect("/work02/regist.jsp");
    }
}
catch (SQLException e)
{
    e.printStackTrace();
}
//�ж���û��ֵ
catch (ClassNotFoundException e)
{
    // TODO Auto-generated catch block
    e.printStackTrace();
}
      
	}
}