<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="gb2312">
    <title>详情</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <base href="<%=request.getContextPath()%>/">
    <link href="wang/css/base.css" rel="stylesheet">
    <link href="wang/css/new.css" rel="stylesheet">

    <link rel="stylesheet" href="wang/css/styless.css">
    <link rel="stylesheet" href="wang/css/commentss.css">

    <!--[if lt IE 9]>
    <script src="wang/js/modernizr.js"></script>
    <![endif]-->
</head>
<body>
<script src="wang/demos/googlegg.js"></script>

<header>
    <div id="logo"><a href="/"></a></div>
    <nav class="topnav" id="topnav"><a href="help/list"><span>官网首页</span><span class="en">Protal</span></a><a href="good/list"><span>便利商品</span><span class="en">About</span></a><a href="cong/list/"><span>议事厅</span><span class="en">CongressHall</span></a><a href="share/list"><span>邻里分享</span><span class="en">NeighborsShare</span></a><a href="bus/allBus"><span>周边商户</span><span class="en">CommunityActivities</span></a><a href="cong/skip"><span>个人帖子</span><span class="en">SecondaryMarket</span></a><a href="book.html"><span>登陆</span><span class="en">Log in</span></a></nav>
    </nav>
</header>
<article class="blogs">
    <h1 class="t_nav"><span>您当前的位置：<a href="/index.html">首页</a>&nbsp;&gt;&nbsp;<a href="/news/s/">推荐</a>&nbsp;&gt;&nbsp;<a href="/news/s/">好文章</a></span><a href="/" class="n1">网站首页</a><a href="/" class="n2">推荐区</a></h1>
    <div class="index_about">
        <h2 class="c_titile">${help.helpHeadline}</h2>
        <p class="box_c"><span class="d_time">发布时间：${help.helpTime}</span><span>编辑：${help.user.nickname}</span></p>
        <ul class="infos">

            <p>${help.helpContent}</p>
            <c:forEach items="${help.helpPictures}" var="pic">
                <p><img src="help/doshow?helpPictureName=${pic.helpPictureAttribute}" ></p>
            </c:forEach>
        </ul>

        <div class="ad"> </div>
        <div class="nextinfo">
            <%--<p>上一篇：<a href="/news/s/2013-09-04/606.html">程序员应该如何高效的工作学习</a></p>--%>
            <%--<p>下一篇：<a href="/news/s/2013-10-21/616.html">柴米油盐的生活才是真实</a></p>--%>
        </div>
        <div class="otherlink">
            <h2>评论区</h2>
            <ul>
                <div class="commentAll">
                    <!--评论区域 begin-->
                    <div class="reviewArea clearfix">
                        <textarea class="content comment-input" placeholder="Please enter a comment&hellip;" onkeyup="keyUP(this)"></textarea>
                        <a href="javascript:;" class="plBtn">评论</a>
                    </div>
                    <!--评论区域 end-->
                    <!--回复区域 begin-->
                    <div class="comment-show">
                        <div class="comment-show-con clearfix">
                            <div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div>
                            <div class="comment-show-con-list pull-left clearfix">
                                <div class="pl-text clearfix">
                                    <a href="#" class="comment-size-name">张三 : </a>
                                    <span class="my-pl-con">&nbsp;来啊 造作啊!</span>
                                </div>
                                <div class="date-dz">
                                    <span class="date-dz-left pull-left comment-time">2017-5-2 11:11:39</span>
                                    <div class="date-dz-right pull-right comment-pl-block">
                                        <a href="javascript:;" class="removeBlock">删除</a>
                                        <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a>
                                        <span class="pull-left date-dz-line">|</span>
                                        <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a>
                                    </div>
                                </div>
                                <div class="hf-list-con"></div>
                            </div>
                        </div>
                    </div>
                    <!--回复区域 end-->
                </div>

                <script type="text/javascript" src="wang/js/jquery-1.12.0.min.js"></script>
                <script type="text/javascript" src="wang/js/jquery.flexText.js"></script>
                <!--textarea高度自适应-->
                <script type="text/javascript">
                    $(function () {
                        $('.content').flexText();
                    });
                </script>
                <!--textarea限制字数-->
                <script type="text/javascript">
                    function keyUP(t){
                        var len = $(t).val().length;
                        if(len > 139){
                            $(t).val($(t).val().substring(0,140));
                        }
                    }
                </script>
                <!--点击评论创建评论条-->
                <script type="text/javascript">
                    $('.commentAll').on('click','.plBtn',function(){
                        var myDate = new Date();
                        //获取当前年
                        var year=myDate.getFullYear();
                        //获取当前月
                        var month=myDate.getMonth()+1;
                        //获取当前日
                        var date=myDate.getDate();
                        var h=myDate.getHours();       //获取当前小时数(0-23)
                        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
                        if(m<10) m = '0' + m;
                        var s=myDate.getSeconds();
                        if(s<10) s = '0' + s;
                        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
                        //获取输入内容
                        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
                        console.log(oSize);
                        //动态创建评论模块
                        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><img src="images/header-img-comment_03.png" alt=""></div> <div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">David Beckham : </a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div><div class="hf-list-con"></div></div> </div>';
                        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
                            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
                            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
                        }
                    });
                </script>
                <!--点击回复动态创建回复块-->
                <script type="text/javascript">
                    $('.comment-show').on('click','.pl-hf',function(){
                        //获取回复人的名字
                        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                        //回复@
                        var fhN = '回复@'+fhName;
                        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
                        var fhHtml = '<div class="hf-con pull-left"> <textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a href="javascript:;" class="hf-pl">评论</a></div>';
                        //显示回复
                        if($(this).is('.hf-con-block')){
                            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
                            $(this).removeClass('hf-con-block');
                            $('.content').flexText();
                            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
                            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
                            //input框自动聚焦
                            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
                        }else {
                            $(this).addClass('hf-con-block');
                            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
                        }
                    });
                </script>
                <!--评论回复块创建-->
                <script type="text/javascript">
                    $('.comment-show').on('click','.hf-pl',function(){
                        var oThis = $(this);
                        var myDate = new Date();
                        //获取当前年
                        var year=myDate.getFullYear();
                        //获取当前月
                        var month=myDate.getMonth()+1;
                        //获取当前日
                        var date=myDate.getDate();
                        var h=myDate.getHours();       //获取当前小时数(0-23)
                        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
                        if(m<10) m = '0' + m;
                        var s=myDate.getSeconds();
                        if(s<10) s = '0' + s;
                        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
                        //获取输入内容
                        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
                        console.log(oHfVal)
                        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
                        var oAllVal = '回复@'+oHfName;
                        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

                        }else {
                            $.getJSON("json/pl.json",function(data){
                                var oAt = '';
                                var oHf = '';
                                $.each(data,function(n,v){
                                    delete v.hfContent;
                                    delete v.atName;
                                    var arr;
                                    var ohfNameArr;
                                    if(oHfVal.indexOf("@") == -1){
                                        data['atName'] = '';
                                        data['hfContent'] = oHfVal;
                                    }else {
                                        arr = oHfVal.split(':');
                                        ohfNameArr = arr[0].split('@');
                                        data['hfContent'] = arr[1];
                                        data['atName'] = ohfNameArr[1];
                                    }

                                    if(data.atName == ''){
                                        oAt = data.hfContent;
                                    }else {
                                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                                    }
                                    oHf = data.hfName;
                                });

                                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">我的名字 : </a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="removeBlock">删除</a> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left">回复</a> <span class="pull-left date-dz-line">|</span> <a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">666</i>)</a> </div> </div></div>';
                                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
                            });
                        }
                    });
                </script>
                <!--删除评论块-->
                <script type="text/javascript">
                    $('.commentAll').on('click','.removeBlock',function(){
                        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
                        if(oT.siblings('.all-pl-con').length >= 1){
                            oT.remove();
                        }else {
                            $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
                            oT.remove();
                        }
                        $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

                    })
                </script>
                <!--点赞-->
                <script type="text/javascript">
                    $('.comment-show').on('click','.date-dz-z',function(){
                        var zNum = $(this).find('.z-num').html();
                        if($(this).is('.date-dz-z-click')){
                            zNum--;
                            $(this).removeClass('date-dz-z-click red');
                            $(this).find('.z-num').html(zNum);
                            $(this).find('.date-dz-z-click-red').removeClass('red');
                        }else {
                            zNum++;
                            $(this).addClass('date-dz-z-click');
                            $(this).find('.z-num').html(zNum);
                            $(this).find('.date-dz-z-click-red').addClass('red');
                        }
                    })
                </script>

            </ul>
        </div>
    </div>
    <aside class="right">
        <!-- Baidu Button BEGIN -->
        <div id="bdshare" class="bdshare_t bds_tools_32 get-codes-bdshare"><a class="bds_tsina"></a><a class="bds_qzone"></a><a class="bds_tqq"></a><a class="bds_renren"></a><span class="bds_more"></span><a class="shareCount"></a></div>
        <script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6574585" ></script>
        <script type="text/javascript" id="bdshell_js"></script>
        <script type="text/javascript">
            document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000)
        </script>
        <!-- Baidu Button END -->
        <div class="blank"></div>
        <div class="news">
            <h3>
                <p>栏目<span>最新</span></p>
            </h3>
            <ul class="rank">
                <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
                <li><a href="/" title="with love for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
                <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
                <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
                <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
                <li><a href="/" title="建站流程篇——教你如何快速学会做网站" target="_blank">建站流程篇——教你如何快速学会做网站</a></li>
                <li><a href="/" title="box-shadow 阴影右下脚折边效果" target="_blank">box-shadow 阴影右下脚折边效果</a></li>
                <li><a href="/" title="打雷时室内、户外应该需要注意什么" target="_blank">打雷时室内、户外应该需要注意什么</a></li>
            </ul>
            <h3 class="ph">
                <p>点击<span>排行</span></p>
            </h3>
            <ul class="paih">
                <li><a href="/" title="Column 三栏布局 个人网站模板" target="_blank">Column 三栏布局 个人网站模板</a></li>
                <li><a href="/" title="withlove for you 个人网站模板" target="_blank">with love for you 个人网站模板</a></li>
                <li><a href="/" title="免费收录网站搜索引擎登录口大全" target="_blank">免费收录网站搜索引擎登录口大全</a></li>
                <li><a href="/" title="做网站到底需要什么?" target="_blank">做网站到底需要什么?</a></li>
                <li><a href="/" title="企业做网站具体流程步骤" target="_blank">企业做网站具体流程步骤</a></li>
            </ul>
        </div>
        <div class="visitors">
            <h3>

            </h3>
            <ul>
            </ul>
        </div>
    </aside>
</article>

<script src="js/silder.js"></script>
</body>
</html>
