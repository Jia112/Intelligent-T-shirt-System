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
		//数据库连接
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
    int sex = 0;
    userInformation hh = new userInformation();
    userenergy gg = new userenergy();
    cn = DriverManager.getConnection(url, username, password);
    //String sql = "select UID from user where username=?";
    pst = cn.prepareStatement("select UID,sex from user where username=?");
    pst.setString(1, user.username);//引用user包
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
    		hh.setSomaKind("非常炎热");
    	}
    	else if(hh.getSomatempa() > 52.085)
    	{
    		hh.setSomaKind("感到炎热");
    	}
    	else if(hh.getSomatempa() > 37.194)
    	{
    		hh.setSomaKind("正常");
    	}
    	else if(hh.getSomatempa() >29.324)
    	{
    		hh.setSomaKind("感到寒冷");
    	}
    	else 
    	{
    		hh.setSomaKind("非常寒冷");
    	}
    }
    else
    {
    	if(hh.getSomatempa() > 26.141)
    	{
    		hh.setSomaKind("非常炎热");
    	}
    	else if(hh.getSomatempa() > 19.690)
    	{
    		hh.setSomaKind("感到炎热");
    	}
    	else if(hh.getSomatempa() > 17.028)
    	{
    		hh.setSomaKind("正常");
    	}
    	else if(hh.getSomatempa() > 14.821)
    	{
    		hh.setSomaKind("感到寒冷");
    	}
    	else 
    	{
    		hh.setSomaKind("非常寒冷");
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
        gg.setSportKind("未知运动");
    }
    if (gg.getKind() == 1)
    {
        gg.setSportKind("平躺");
    }
    if (gg.getKind() == 2)
    {
        gg.setSportKind("坐着工作");
    }
    if (gg.getKind() == 3)
    {
        gg.setSportKind("站立");
    }
    if (gg.getKind() == 4)
    {
        gg.setSportKind("走路");
    }
    if (gg.getKind() == 5)
    {
        gg.setSportKind("跑步");
    }
    if (gg.getKind() == 6)
    {
        gg.setSportKind("上楼梯");
    }

    //System.out.println(gg.getSportKind());

    if ((hh.getSomatempa() > 33 && gg.getKind() == 0) || (hh.getSomatempa() <= 18 && gg.getKind() == 0))
    {
        gg.setHealthKind("处于非常危险状态");
    }
    else if ((hh.getSomatempa() > 30 && hh.getSomatempa() <= 33) && gg.getKind() == 0)
    {
        gg.setHealthKind("处于危险状态");
    }
    else if (((hh.getSomatempa() > 26 && hh.getSomatempa() <= 30) && gg.getKind() == 0) || ((hh.getSomatempa() > 18 && hh.getSomatempa() <= 22) && gg.getKind() == 0))
    {
        gg.setHealthKind("处于亚健康状态");
    }
    else
    {
        gg.setHealthKind("处于健康状态");
    }
    //计算成年人一天的所需的运动量
    double subEnergy;
    double minEnergy;
    double maxEnergy;
    minEnergy = 144 * 4.1858518 * 1000;
    maxEnergy = 180 * 4.1858518 * 1000;
    gg.setMinBasicEnergy(minEnergy);
    gg.setMaxBasicEnergy(maxEnergy);
    if (gg.getEnergy() > gg.getMinBasicEnergy() && gg.getEnergy() < gg.getMaxBasicEnergy())
    {
        gg.setWeatherArrive("恭喜您今日运动已达标，请继续努力" + " " + "成年人一天需要达到的运动量：144~180千卡");
    }
    if(gg.getEnergy() < gg.getMinBasicEnergy())
    {
        subEnergy = (minEnergy - gg.getEnergy())/ 4.1858518/1000;
        BigDecimal bd1 = new BigDecimal(subEnergy);
        subEnergy = bd1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        gg.setWeatherArrive("您今日运动量较少，至少还需运动" + subEnergy + "千卡" + " " + "成年人一天需要达到的运动量：144~180千卡");
    }
    if(gg.getEnergy() > gg.getMaxBasicEnergy())
    {
    	subEnergy = (maxEnergy - gg.getEnergy())/ 4.1858518/1000;
    	BigDecimal bd3 = new BigDecimal(subEnergy);
        subEnergy = bd2.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
        gg.setWeatherArrive("您今日运动量超量，请注意运动健康，已超量" + subEnergy + "千卡" + " " + "成年人一天需要达到的运动量：144~180千卡");
    }
    //统计最近喜欢做的运动
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
        gg.setFavoriteKind("未知运动");
    }
    if (max == 1)
    {
        gg.setFavoriteKind("平躺");
    }
    if (max == 2)
    {
        gg.setFavoriteKind("坐着工作");
    }
    if (max == 3)
    {
        gg.setFavoriteKind("站立");
    }
    if (max == 4)
    {
        gg.setFavoriteKind("走路");
    }
    if (max == 5)
    {
        gg.setFavoriteKind("跑步");
    }
    if (max == 6)
    {
        gg.setFavoriteKind("上楼梯");
    }
    //以下需要更改
    if(max == 1 || max == 0)
    {
        gg.setSuggestSport("推荐每天散步2~4公里");
    }
    if (max == 2 && gg.getEnergy() < gg.getMinBasicEnergy())
    {
        gg.setSuggestSport("推荐进行时速6公里左右的健走");
    }
    if (max == 3 && gg.getEnergy() < gg.getMinBasicEnergy())
    {
        gg.setSuggestSport("推荐进行时速8公里以上每天20分钟的跑步运动");
    }
    if (gg.getEnergy() > gg.getMaxBasicEnergy())
    {
        gg.setSuggestSport("推荐多休息，不要过度运动");
    }
    //判断用户运动强度
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
    		gg.setExercise("几乎没有运动");
    	}
    	else if(energy < 2800)
    	{
    		gg.setExercise("较轻");
    	}
    	else if(energy < 4400)
    	{
    		gg.setExercise("适中");
    	}
    	else if(energy < 6000)
    	{
    		gg.setExercise("较重");
    	}
    	else if(energy < 7600)
    	{
    		gg.setExercise("很重");
    	}
    	else 
    	{
    		gg.setExercise("过重");
    	}
    }
    else
    {
    	if (energy < 1600)
    	{
    		gg.setExercise("几乎没有运动");
    	}
    	else if(energy < 4000)
    	{
    		gg.setExercise("较轻");
    	}
    	else if(energy < 6000)
    	{
    		gg.setExercise("适中");
    	}
    	else if(energy < 8000)
    	{
    		gg.setExercise("较重");
    	}
    	else if(energy < 10000)
    	{
    		gg.setExercise("很重");
    	}
    	else 
    	{
    		gg.setExercise("过重");
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
        response.getWriter().write("获取成功");
        //保存用户（四个域 用session域）
        HttpSession session = request.getSession();
        session.setAttribute("userInformation", hh);
        session.setAttribute("userenergy", gg);
        session.setAttribute("userheight", gg1);
        session.setAttribute("userweight", gg2);
        //跳转到主页面
        response.sendRedirect("/work02/index.jsp");
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