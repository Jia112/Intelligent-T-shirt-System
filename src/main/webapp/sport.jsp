<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>爱生活，爱健康</title>
</head>

<style>
    #showsport {
        width: 1200px;
        margin: 0 auto;
        height: 44px;
        background: red;
        line-height: 44px;
        border-radius: 3px;
    }

        #showsport ul {
            list-style: none;
            display: flex; /*伸缩布局*/
            height: 44px;
        }

            #showsport ul li {
                flex: 1; /*平分*/
                text-align: center; /*文字居中*/
            }

                #showsport ul li a {
                    color: white;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                }

                    #showsport ul li a:hover {
                        font-size: 24px;
                    }
    
    #recommend {
     margin-top: 40px;
      width: 1000px;
      height: 320px;
      border-radius: 3px;
      border-style: inset;
      //border-width:300px;
      //border-height: 170px;
      //margin-left: 200px;
      text-align:center ;
      margin:0 auto;
     } 
     
        #recommend1 {
        width: 1000px;
        margin: 0 auto;
        height: 90px;
        border-radius: 3px;
        text-indent: 2em;
        text-align: left; /*文字居中*/
        font-size:20px;
        color: grey;
    }    
    #recommend2 {
        width: 1000px;
        margin: 0 auto;
        height: 90px;
        border-radius: 3px;
        text-indent: 2em;
        text-align: left; /*文字居中*/
        font-size:20px;
        color: grey;
    }     
    #recommend3 {
        width: 1000px;
        margin: 0 auto;
        height: 90px;
        border-radius: 3px;
        text-indent: 2em;
        text-align: left; /*文字居中*/
        font-size:20px;
        color: grey;
    }  
    #recommend4 {
        width: 1000px;
        margin: 0 auto;
        height: 50px;
        border-radius: 3px;
        text-indent: 2em;
        text-align: left; /*文字居中*/
    } 
                    
</style>

<body>
    <%@ include file="/header1.jsp"%>

    <div id="showsport">
        <ul>
            <li><a href="#"> 根据您近期的健康状况，推荐您进行的运动：${userenergy.suggestSport}</a></li>
        </ul>
    </div>
    <div id = recommend>
       <div id = recommend1>
                                   一，散步：人类最基本的活动，每小时约走2∼4公里，虽然「饭后百步走，活到九十九」，
                                  但因为运动量太低，没有心肺功能压力，对体适能的帮助有限。顶多是对身体平衡敏捷
                                  及肌耐力的最低限度的训练，适合完全不运动、身体过度肥胖、有严重心脏、关节问题
                                 或活力较低的老年人。
       </div>
       <div id = recommend2>
                                 二，健走：指时速6公里左右，双手需要摆动保持身体平衡的走路运动，如果走得再快
                                 一点，可以对体能普通的一般人产生心肺压力，促进心肺功能；而双手摆动，上半身挺
                                 直保持平衡，也可以低限度训练身体核心肌肉群的耐力和敏捷度。由于不会受伤，场所
                                 适合，成为体适能普通的民众最佳运动。
       </div>
       <div id = recommend3>
                                 三，跑步：指时速8公里以上，可以持续20分钟以上的运动。由于消耗大量热量，场所
                                易找，伙伴不拘，成为减肥最流行且有效的运动。主要为训练心肺功能及下半身肌耐力。
       </div>
       <div id = recommend4>
                                如想要了解更多关于运动推荐的相关信息，请点击下方链接进行主页的访问：
         <ul>
             <li><a href="https://www.zhihu.com/question/26404838">https://www.zhihu.com/question/26404838</a></li>
         </ul>
       </div>
    </div>
    
   
</body>
</html>