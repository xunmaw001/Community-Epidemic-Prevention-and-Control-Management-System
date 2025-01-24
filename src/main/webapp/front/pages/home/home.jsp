<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="description" content=""/>
    <meta name="keywords" content=""/>
    <meta name="author" content="order by mobanxiu.cn"/>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/common.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/style.css"/>
    <link rel="stylesheet" href="../../xznstatic/css/animate.css"/><!-- 动画效果 -->
    <link rel="stylesheet" href="../../xznstatic/css/swiper.min.css"/>
    <script src="../../xznstatic/js/jquery-1.11.3.min.js"></script>
    <script src="../../xznstatic/js/jquery.SuperSlide.2.1.1.js"></script>
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="../../css/theme.css"/>
</head>
<style>
    html::after {
        position: fixed;
        top: 0;
        right: 0;
        left: 0;
        bottom: 0;
        content: '';
        display: block;
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
    }

    #test1 {
        overflow: hidden;
    }

    /*轮播图css*/
    #test1 .layui-carousel-ind li {
        width: 20px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
        background-color: #f7f7f7;
        box-shadow: 0 0 6px rgba(255, 0, 0, .8);
    }

    #test1 .layui-carousel-ind li.layui-this {
        width: 30px;
        height: 10px;
        border-width: 0;
        border-style: solid;
        border-color: rgba(0, 0, 0, .3);
        border-radius: 6px;
    }

    .layui-carousel-ind{
        top: 0;

    }
    .layui-carousel-ind ul{
        position: absolute;

        bottom: 8px !important;
        z-index: 10;
    }

    .title {
        padding: 10px 5px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }

   .title span {
        padding: 0 10px;
        line-height: 1.4;
    }

   .box .list {
        display: flex;
        flex-wrap: wrap;
    }




    .box .list img {
        width: 100%;
        height: 100px;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        text-align: center;
        box-sizing: border-box;
    }


    .box .list .list-item {
        flex: 0 0 25%;
        padding: 0 10px;
        box-sizing: border-box;
    }

    /*
   .box .list .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 5px;
        box-sizing: border-box;
        cursor: pointer;
   }
    .box .list .list-item .list-item-body {
        border: 1px solid rgba(0, 0, 0, 3);
        padding: 10px;
        box-sizing: border-box;
        display: flex;
        cursor: pointer;
    }

    .box .list .list-item .list-item-body img {
        width: 120px;
        height: 100%;
        display: block;
        margin: 0 auto;
        object-fit: cover;
        max-width: 100%;
    }

    .box .list .list-item .list-item-body .item-info {
        flex: 1;
        display: flex;
        justify-content: space-between;
        flex-direction: column;
        padding-left: 10px;
        box-sizing: border-box;
    }

    .box .list .list-item .list-item-body .item-info .name {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        box-sizing: border-box;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    .box .list .list-item .list-item-body .item-info .time {
        padding-top: 5px;
        color: red;
        font-size: 14px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
    }
    #new-list-6 .swiper-wrapper {
        -webkit-transition-timing-function: linear;
        -moz-transition-timing-function: linear;
        -ms-transition-timing-function: linear;
        -o-transition-timing-function: linear;
        transition-timing-function: linear;
    }*/

    .list-item1 {
        flex: 0 0 100%;
    }
    .list-item2 {
        flex: 0 0 50%;
    }
    .list-item3 {
        flex: 0 0 33.3%;
    }
    .list-item4 {
        flex: 0 0 25%;
    }
    .list-item5 {
        flex: 0 0 20%;
    }
    /*限制内容长度*/
    .line1 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        overflow: hidden;
    }
    .line2 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 2;
        overflow: hidden;
    }
    .line3 {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        overflow: hidden;
    }
    /*轮播图css*/
    .notice-item {
        margin: 0 auto;
        margin-top: 20px;
        width: 370px;
        height: 14px;
        border-bottom: 1px solid #d9d9d9;
        position: relative;
        margin-bottom: 20px;
    }

    .notice-item span {
        position: absolute;
        bottom: -15px;
        left: 50%;
        height: 29px;
        width: 120px;
        color: #000;
        line-height: 29px;
        font-size: 24px;
        margin-left: -60px;
        background-color: #fff;
        text-align: center;
    }

    .notice-list {
        width: 370px;
        margin: 0 auto;
        margin-top: 10px;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        border-bottom:  1px dashed #d9d9d9;
        transition: all 0.5s;
        -moz-transition: all 0.5s;
        -ms-transition: all 0.5s;
    }



    .notice-list :hover{
        padding-left: 10px;
    }
    /*套装样式*/
    /*腰线*/
    /*home页面主要样式*/

    .index-pv000 .animation-box:hover {
        transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
        transition: all 0.3s;
        z-index: 2;
        position: relative;
    }
    .index-pv000 .animation-box img:hover {
        transform: perspective(1000px) translate3d(0px, 0px, 0px) scale(1) rotate(0deg) skew(0deg, 0deg);
        transition: all 0.3s;
        z-index: 2;
        position: relative;
    }
    /*home页面普通数据样式*/
.team-agile-img {
	width:100%;
	background-color: #FFF;
	display: block;
	overflow: hidden;
	position: relative;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
	opacity: 1;
	filter: alpha(opacity=100);
}
.team-agile-img img {
	width: 100%;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}
.team-agile-img:before {
	content: '';
	background-color: rgba(0, 0, 0, 0);
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	position: absolute;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
}
.team-grids{padding:0;}
.team-agile-img:hover .view-caption {
	-moz-transform: translateY(0%) scale(1);
	-o-transform: translateY(0%) scale(1);
	-ms-transform: translateY(0%) scale(1);
	-webkit-transform: translateY(0%) scale(1);
	transform: translateY(0%) scale(1);
}
.view-caption {
	background-color: var(--publicMainColor,orange);
	bottom: 0;
	height: 16%;
	left: 0;
	padding: 15px 20px;
	position: absolute;
	right: 0;
	text-align: left;
	z-index: 99;
	-webkit-transition: all 0.5s;
	-moz-transition: all 0.5s;
	-ms-transition: all 0.5s;
	-o-transition: all 0.5s;
	transition: all 0.5s;
	-moz-transform: translateY(150%) scale(1.5);
	-o-transform: translateY(150%) scale(1.5);
	-ms-transform: translateY(150%) scale(1.5);
	-webkit-transform: translateY(150%) scale(1.5);
	transform: translateY(150%) scale(1.5);
}
.view-caption .w3ls-info {
	float: left;
}
.view-caption .w3ls-info h4 {
	color: #fff;
	font-size: 1.5em;
	font-weight: normal;
}
.view-caption .w3ls-info p {
	color: #000;
	font-size: 1em;
}
    /*home页面新闻数据样式*/
</style>
<body>
<div id="app" >
    <div class="banner">

        <div >
            <div style="width: 1200px;margin: 0 auto;height: 370px;display: flex;justify-content: space-around;">
                <!-- 轮播图 -->
                <div class="banner" style="width: 64%;">
                    <div class="layui-carousel" id="test1" style="height: 370px !important;position: relative">
                        <div carousel-item class="wow slideInLeft" data-wow-duration="3s" style="visibility: visible; animation-duration: 3s; animation-name: slideInLeft;">
                            <div v-for="(item,index) in swiperList" :key="index">
                                <img style="width: 100%;height: 100%;object-fit:cover;" :src="baseUrl+item.img" />
                            </div>
                        </div>
                    </div>
                </div>
                <div style="width: 34%;background-color: #fff;height: 370px;">
                    <div class="notice-item">公告信息</div>
                    <div class="notice-app" v-for="(item,index) in gonggaoList" v-if="index<5">
                        <div class="notice-list" @click="jump('../gonggao/detail.jsp?id='+item.id)">
                            <em style="font-size: 26px;color: #000;margin: 5px 16px;">
                                {{index+1}}
                            </em>
                            <span>{{ item.gonggaoName }}</span>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="content">
                <div style="display: flex;justify-content: center;background-repeat: no-repeat;background-position: center center;background-size: cover;">
                    <div class="box" style='width:100%;'>
                        <div style="width: 1200px;height: auto;margin:  0 auto;padding: 10px 0">
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div class="title main_backgroundColor"
     :style='{"padding":"10px 0  20px 0","boxShadow": "#fff 0px 0px 6px","margin":"10px 0 20px 0","borderColor":"rgba(0,0,0,1)","color":"rgba(0, 0, 0, 1)","borderRadius":"32px","alignItems":"center","borderWidth":"0 0px","fontSize":"35px","borderStyle":"solid"}'>
        <span>DATA SHOW</span>
    <span>公告展示</span>
</div>
                            </div>
                            <div class="wow " data-wow-duration="2s" data-wow-delay="1s">
<div v-if="gonggaoList.length" class="new-list-6" style="display: flex;">
    <div class="swiper-container" id="new-list-6news" :style='{"padding":"0","boxShadow":"0 0 6px rgba(0,0,0, .3)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(255, 255, 255, 1)","borderRadius":"0","borderWidth":"0","width":"60%","borderStyle":"solid","height":"630px"}'>
        <div class="swiper-wrapper">
            <div class="swiper-slide animation-box" v-for="(item,index) in gonggaoList" v-if="index<5" :key="index" @click="jump('../gonggao/detail.jsp?id='+item.id)">
                <img :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0, .3)","borderColor":"rgba(255, 255, 255, 1)","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"0","borderWidth":"0","width":"100%","borderStyle":"solid","height":"100%"}' style="object-fit: cover;width: 100%;height: 100%;box-sizing: border-box;" :src="baseUrl+item.gonggaoPhoto">
            </div>
        </div>
    </div>
    <div class="new6-list" style="width: 40%;" :style='{"padding":"20px","boxShadow":"0 0 0px rgba(0,0,0, .3)","margin":"0","borderColor":"#ccc","backgroundColor":"var(--publicSubColor)","overflow":"hidden","borderRadius":"0","borderWidth":"0","width":"40%","boxSizing":"border-box","borderStyle":"solid","height":"630px"}'>
        <div class="news-title-box" style="display: flex;justify-content: space-between;align-items: center;">
            <div class="new-title" :style='{"padding":"5px 30px","boxShadow":"0 0 0px rgba(0,0,0,.3)","margin":"20px 30px 30px","borderColor":"rgba(255, 255, 255, 1)","backgroundColor":"var(--publicMainColor)","color":"#fff","borderRadius":"0","borderWidth":"0 0 5px 0","width":"auto","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}'>最新动态</div>
            <button @click="jump('../gonggao/list.jsp')" style="display: block;cursor: pointer;" type="button" :style='{"padding":"0 35px","boxShadow":"0 0 0px rgba(255,0,0,0)","margin":"4px auto","borderColor":"var(--publicMainColor)","backgroundColor":"rgba(255, 255, 255, 0)","color":"#000000","borderRadius":"0","borderWidth":"0 0 10px 0","width":"auto","fontSize":"16px","borderStyle":"solid","height":"40px"}'>查看更多<i v-if="true" :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"16px","color":"#000000"}' class="layui-icon layui-icon-next"></i></button>
        </div>
        <div v-for="(item,index) in gonggaoList" v-if="index<5" :key="index" @click="jump('../gonggao/detail.jsp?id='+item.id)" class="new6-list-item" style="display: flex;box-sizing: border-box;box-sizing: border-box;" :style='{"padding":"0 10px","boxShadow":"0 0 6px rgba(0,0,0,0)","margin":"0 0 20px 0","borderColor":"#000000","backgroundColor":"rgba(255, 255, 255, 0)","borderRadius":"0","borderWidth":"2px 3px","width":"100%","borderStyle":"solid","height":"54px"}'>
            <div class="new6-list-item-title line1" :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#000000","textAlign":"left","borderRadius":"0","borderWidth":"0","width":"70%","lineHeight":"28px","fontSize":"14px","borderStyle":"solid"}'>{{ item.gonggaoName }}</div>
            <div class="new6-list-item-time" :style='{"padding":"0","boxShadow":"0 0 0px rgba(0,0,0,0)","margin":"0","borderColor":"#ccc","backgroundColor":"rgba(0,0,0,0)","color":"#000000","textAlign":"right","borderRadius":"0","borderWidth":"0","width":"30%","lineHeight":"28px","fontSize":"12px","borderStyle":"solid"}'>{{ item.insertTime.split(' ')[0] }}</div>
        </div>
    </div>
</div>                                <div style="margin-top:40px;text-align: center;">
                                    <button @click="jump('../gonggao/list.jsp')" style="display: block;cursor: pointer;" type="button" :style='{"padding":"0 15px","boxShadow":"0 0 6px rgba(255,0,0,0)","margin":"4px auto","borderColor":"#ccc","backgroundColor":"#fff","color":"rgba(160, 67, 26, 1)","borderRadius":"6px","borderWidth":"0","width":"auto","fontSize":"14px","borderStyle":"solid","height":"34px"}'>
                                        查看更多
                                        <i :style='{"isshow":true,"padding":"0 0 0 1px","fontSize":"14px","color":"rgba(160, 67, 26, 1)"}' class="layui-icon layui-icon-next"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </div>
</div>

<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../xznstatic/js/swiper.min.js"></script>
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>
<script src="../../xznstatic/js/wow.min.js"></script>
<script type="text/javascript">
    // 动画效果
    new WOW().init();

    Vue.prototype.myFilters = function (msg) {
        if(msg==null || msg==""){
            return "";
        }else if (msg.length>20){
            msg.replace(/\n/g, "<br>");
            return msg.substring(0,20)+"......";
        }else{
            return msg.replace(/\n/g, "<br>");
        }
    };
    var vue = new Vue({
        el: '#app',
        data: {
            swiperList: [],
            baseUrl:"",
            // dianyingRecommend: [],
            gonggaoList: [],
            gonggaoTypesList: [],
            //类型查询条件
            gonggaoTypes: "",
        },
        filters: {
            newsDesc: function (val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                    }

                    return val;
                }
                return '';
            }
        },
        methods: {
            jump(url) {
                jump(url)
            }
            , jumpCheck(url, check1, check2) {
                if (check1 == "2" || check1 == 2) {//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if (check2 == "2" || check2 == 2) {//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            }
        }
    });

    layui.use(['layer', 'form', 'element', 'carousel', 'http', 'jquery'], function () {
        var layer = layui.layer;
        var element = layui.element;
        var form = layui.form;
        var carousel = layui.carousel;
        var http = layui.http;
        var jquery = layui.jquery;
        vue.baseUrl = http.baseurl

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function (res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null
                    ) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                })
                ;

                vue.swiperList = swiperList;

                vue.$nextTick(() => {
                    carousel.render({
                        elem: '#test1',
                        width: '100%',
                        height: '100%',
                        arrow: 'hover',
                        anim: 'default',
                        autoplay: 'true',
                        interval: '3000',
                        indicator: 'inside'
                    });

                })

                // vue.$nextTick(()=>{
                //   window.xznSlide();
                // });
            }
        });

        gonggaoSelect();
        //类型动态搜索
        $(document).on("click", ".gonggaoTypes-search", function(e) {
            vue.gonggaoTypes = $(this).attr('index');
            gonggaoSelect();
        });
        gonggaoTypesSelect();//类型查询

        function gonggaoTypesSelect() {//类型查询
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gonggao_types",'get',{},function(res) {
                if (res.code == 0) {vue.gonggaoTypesList = res.data.list;}
            });
        }
        function gonggaoSelect(){//数据查询
            http.request('gonggao/list', 'get', {
                page: 1,
                limit: 8,
                gonggaoTypes: vue.gonggaoTypes,//类型
                order: "desc",//asc desc
            },function (res) {
                vue.gonggaoList = res.data.list;
            })
        };

    });

    window.xznSlide = function () {
        // jQuery(".banner").slide({mainCell:".bd ul",autoPlay:true,interTime:5000});
        jQuery("#ifocus").slide({
            titCell: "#ifocus_btn li",
            mainCell: "#ifocus_piclist ul",
            effect: "leftLoop",
            delayTime: 200,
            autoPlay: true,
            triggerTime: 0
        });
        jQuery("#ifocus").slide({titCell: "#ifocus_btn li", mainCell: "#ifocus_tx ul", delayTime: 0, autoPlay: true});
        jQuery(".product_list").slide({
            mainCell: ".bd ul",
            autoPage: true,
            effect: "leftLoop",
            autoPlay: true,
            vis: 5,
            trigger: "click",
            interTime: 4000
        });
    };
</script>
<script src="../../xznstatic/js/index.js"></script>
</body>
</html>
