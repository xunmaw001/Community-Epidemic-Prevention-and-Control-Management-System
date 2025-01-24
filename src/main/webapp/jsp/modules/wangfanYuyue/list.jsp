<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">


    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
</head>
<style>

</style>
<body>

    <div class="modal fade" id="wangfanYuyueYesnoTypesModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">审核</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        审核：
                        <div class="col-sm-9">
                            <input type="hidden" id="wangfanYuyueYesnoTypesId">
                            <select id="wangfanYuyueYesnoTypes" name="wangfanYuyueYesnoTypes" class="form-control">
                                <option value="2">同意</option>
                                <option value="3">拒绝</option>
                            </select>
                        </div>
                    </div>
                       <div class="row">
                           审核回复：
                           <textarea style="width: 450px"  id="wangfanYuyueYesnoText" name="wangfanYuyueYesnoText" class="form-control" placeholder="审核回复"></textarea>
                       </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                    <button type="button" id="receive" onclick="wangfanYuyueYesnoTypesShenhe()" class="btn btn-primary">审 核</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Pre Loader -->
    <div class="loading">
        <div class="spinner">
            <div class="double-bounce1"></div>
            <div class="double-bounce2"></div>
        </div>
    </div>
<!--/Pre Loader -->
    <div class="wrapper">
        <!-- Page Content -->
        <div id="content">
            <!-- Top Navigation -->
            <%@ include file="../../static/topNav.jsp" %>
            <!-- Menu -->
            <div class="container menu-nav">
                <nav class="navbar navbar-expand-lg lochana-bg text-white">
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="ti-menu text-white"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul id="navUl" class="navbar-nav mr-auto">
                        </ul>
                    </div>
                </nav>
            </div>
            <!-- /Menu -->
            <!-- Breadcrumb -->
            <!-- Page Title -->
            <div class="container mt-0">
                <div class="row breadcrumb-bar">
                    <div class="col-md-6">
                        <h3 class="block-title">出入管理管理</h3>
                    </div>
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/index.jsp">
                                    <span class="ti-home"></span>
                                </a>
                            </li>
                            <li class="breadcrumb-item">出入管理管理</li>
                            <li class="breadcrumb-item active">出入管理列表</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /Page Title -->

            <!-- /Breadcrumb -->
            <!-- Main Content -->
            <div class="container">
                <div class="row">
                    <!-- Widget Item -->
                    <div class="col-md-12">
                        <div class="widget-area-2 lochana-box-shadow">
                            <h3 class="widget-title">出入管理列表</h3>
                            <div class="table-responsive mb-3" id="tableDiv">
                                <div class="col-sm-12">
                                                                                                                                                 
                                        <label>交通工具</label>
                                        <select name="wangfanYuyueTypesSelectSearch" id="wangfanYuyueTypesSelectSearch" aria-controls="tableId" class="form-control form-control-sm"></select>
                                                                                                                                                                                     
                                        <label>申报状态</label>
                                        <select name="wangfanYuyueYesnoTypesSelectSearch" id="wangfanYuyueYesnoTypesSelectSearch" aria-controls="tableId" class="form-control form-control-sm"></select>
                                                                                                                                                
                                                                                                         
                                        <label>用户姓名</label>
                                        <input type="text" id="yonghuNameSearch" placeholder="请输入用户姓名" aria-controls="tableId" class="form-control form-control-sm">
                                                                                                                                                                                                                                                                                                            <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                        <button onclick="add()" type="button" class="btn btn-primary 新增">添加</button>
                                        <button onclick="graph()" type="button" class="btn btn-primary 报表">报表</button>
                                        <span class="导入导出">
                                            导入<input name="file" id="wangfanYuyueExcelFile" type="file" class="btn btn-success" style="width: 70px!important; line-height: 35px;">
                                            <button class="btn btn-success" onclick="download('/upload/wangfanYuyueMuBan.xls')">导入模板下载</button>
                                        </span>
                                        <button onclick="exportExcel()" type="button" class="btn btn-success 导入导出"><i class="fa fa-file-excel-o" aria-hidden="true"></i>导出</button>
                                        <button onclick="deleteMore()" type="button" class="btn btn-danger 删除">批量删除</button>
                                </div>
                                <table id="tableId" class="table table-bordered table-striped">
                                    <thead>
                                    <tr>
                                        <th class="no-sort" style="min-width: 35px;">
                                            <div class="custom-control custom-checkbox">
                                                <input class="custom-control-input" type="checkbox" id="select-all"
                                                       onclick="chooseAll()">
                                                <label class="custom-control-label" for="select-all"></label>
                                            </div>
                                        </th>

                                        <th>用户姓名<i id="yonghuNameIcon"></i></th>
                                        <th>用户手机号<i id="yonghuPhoneIcon"></i></th>
                                        <th>用户头像<i id="yonghuPhotoIcon"></i></th>
                                        <th onclick="sort('wangfan_yuyue_text')">申报理由<i id="wangfanYuyueTextIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_types')">交通工具<i id="wangfanYuyueTypesIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_mudidi')">去哪里<i id="wangfanYuyueMudidiIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_chufadi')">所在地<i id="wangfanYuyueChufadiIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_chufa_time')">出发时间<i id="wangfanYuyueChufaTimeIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_daoda_time')">到达时间<i id="wangfanYuyueDaodaTimeIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_yesno_types')">申报状态<i id="wangfanYuyueYesnoTypesIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_yesno_text')">审核回复<i id="wangfanYuyueYesnoTextIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('wangfan_yuyue_shenhe_time')">审核时间<i id="wangfanYuyueShenheTimeIcon" class="fa fa-sort"></i></th>
                                        <th onclick="sort('insert_time')">活动报名时间<i id="insertTimeIcon" class="fa fa-sort"></i></th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="thisTbody">
                                    </tbody>
                                </table>
                                <div class="col-md-6 col-sm-3" style="flex:none;max-width:inherit;display:flex;">
                                    <div class="dataTables_length" id="tableId_length">
                                        <select name="tableId_length" aria-controls="tableId" id="selectPageSize" onchange="changePageSize()">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                       <span class="text">条每页</span>
                                    </div>
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination justify-content-end">
                                            <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')"> <a class="page-link" href="#" tabindex="-1">上一页</a></li>
                                            <li class="page-item" id="tableId_next" onclick="pageNumChange('next')"> <a class="page-link" href="#">下一页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /Widget Item -->
                </div>
            </div>
            <!-- /Main Content -->

        </div>
        <!-- /Page Content -->
    </div>
    <!-- Back to Top -->
    <a id="back-to-top" href="#" class="back-to-top">
        <span class="ti-angle-up"></span>
    </a>
    <!-- /Back to Top -->
    <%@ include file="../../static/foot.jsp" %>

    <script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>

    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/excel-gen.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/jszip.min.js"></script>
    <script language="javascript" type="text/javascript"
            src="${pageContext.request.contextPath}/resources/js/excel/FileSaver.js"></script>
    <script>

        <%@ include file="../../utils/menu.jsp"%>
        <%@ include file="../../static/setMenu.js"%>
        <%@ include file = "../../static/utils.js" %>
        <%@ include file="../../utils/baseUrl.jsp"%>
        <%@ include file="../../static/getRoleButtons.js"%>
        <%@ include file="../../static/crossBtnControl.js"%>
        var sessionTable = window.sessionStorage.getItem("accountTableName");//登录账户所在表名
        var role         = window.sessionStorage.getItem("role");//权限
        var userId       = window.sessionStorage.getItem("userId");//当前登录人的id
        var tableName = "wangfanYuyue";
        var pageType = "list";
        var searchForm = {key: ""};
        var pageIndex = 1;
        var pageSize = 10;
        var totalPage = 0;
        var dataList = [];
        var sortColumn = 'id';
        var sortOrder = 'desc';
        var ids = [];
        var checkAll = false;

        <!-- 级联表的级联字典表 -->

        <!-- 本表的级联字段表 -->
        var wangfanYuyueTypesOptions = [];
        var wangfanYuyueYesnoTypesOptions = [];

        function init() {
            // 满足条件渲染提醒接口
        }

        // 改变每页记录条数
        function changePageSize() {
            var selection = document.getElementById('selectPageSize');
            var index = selection.selectedIndex;
            pageSize = selection.options[index].value;
            getDataList();
        }

        //排序
        function sort(columnName) {
            var iconId = '#' + columnName + 'Icon'
            $('th i').attr('class', 'fa fa-sort');
            if (sortColumn == '' || sortColumn != columnName) {
                sortColumn = columnName;
                sortOrder = 'asc';
                $(iconId).attr('class', 'fa fa-sort-asc');
            }
            if (sortColumn == columnName) {
                if (sortOrder == 'asc') {
                    sortOrder = 'desc';
                    $(iconId).attr('class', 'fa fa-sort-desc');
                } else {
                    sortOrder = 'asc';
                    $(iconId).attr('class', 'fa fa-sort-asc');
                }
            }
            pageIndex = 1;
            getDataList();
        }



        // 查询
        function search() {
            searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                         
                            //用户姓名
            var yonghuNameSearchInput = $('#yonghuNameSearch');
            if( yonghuNameSearchInput != null){
                if (yonghuNameSearchInput.val() != null && yonghuNameSearchInput.val() != '') {
                    searchForm.yonghuName = $('#yonghuNameSearch').val();
                }
            }
                                                                                                        <!-- 本表的查询条件 -->

                 
                //交通工具
            var wangfanYuyueTypesSelectSearchInput = document.getElementById("wangfanYuyueTypesSelectSearch");
            if(wangfanYuyueTypesSelectSearchInput != null){
                var wangfanYuyueTypesIndex = wangfanYuyueTypesSelectSearchInput.selectedIndex;
                if( wangfanYuyueTypesIndex  != 0){
                    searchForm.wangfanYuyueTypes= document.getElementById("wangfanYuyueTypesSelectSearch").options[wangfanYuyueTypesIndex].value;
                }
            }
                     
                //申报状态
            var wangfanYuyueYesnoTypesSelectSearchInput = document.getElementById("wangfanYuyueYesnoTypesSelectSearch");
            if(wangfanYuyueYesnoTypesSelectSearchInput != null){
                var wangfanYuyueYesnoTypesIndex = wangfanYuyueYesnoTypesSelectSearchInput.selectedIndex;
                if( wangfanYuyueYesnoTypesIndex  != 0){
                    searchForm.wangfanYuyueYesnoTypes= document.getElementById("wangfanYuyueYesnoTypesSelectSearch").options[wangfanYuyueYesnoTypesIndex].value;
                }
            }
                            getDataList();
        }

        // 获取数据列表
        function getDataList() {
            http("wangfanYuyue/page", "GET", {
                page: pageIndex,
                limit: pageSize,
                sort: sortColumn,//字段
                order: sortOrder,//asc desc
                wangfanYuyueDelete: 1,
                //本表的
                wangfanYuyueTypes: searchForm.wangfanYuyueTypes,
                wangfanYuyueYesnoTypes: searchForm.wangfanYuyueYesnoTypes,
            //级联表的
                yonghuName: searchForm.yonghuName,

            }, (res) => {
                if(res.code == 0) {
                    clear();
                    $("#thisTbody").html("");
                    dataList = res.data.list;
                    totalPage = res.data.totalPage;
                    for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据
                        var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据
                        $('#thisTbody').append(trow);
                    }
                    pagination(); //渲染翻页组件
                    getRoleButtons();// 权限按钮控制
                }
            });
        }

        // 渲染表格数据
        function setDataRow(item, number) {
            //创建行
            var row = document.createElement('tr');
            row.setAttribute('class', 'useOnce');
            //创建勾选框
            var checkbox = document.createElement('td');
            var checkboxDiv = document.createElement('div');
            checkboxDiv.setAttribute("class", "custom-control custom-checkbox");
            var checkboxInput = document.createElement('input');
            checkboxInput.setAttribute("class", "custom-control-input");
            checkboxInput.setAttribute("type", "checkbox");
            checkboxInput.setAttribute('name', 'chk');
            checkboxInput.setAttribute('value', item.id);
            checkboxInput.setAttribute("id", number);
            checkboxDiv.appendChild(checkboxInput);
            var checkboxLabel = document.createElement('label');
            checkboxLabel.setAttribute("class", "custom-control-label");
            checkboxLabel.setAttribute("for", number);
            checkboxDiv.appendChild(checkboxLabel);
            checkbox.appendChild(checkboxDiv);
            row.appendChild(checkbox)


                    //用户姓名
            var yonghuNameCell = document.createElement('td');
            yonghuNameCell.innerHTML = item.yonghuName;
            row.appendChild(yonghuNameCell);


                    //用户手机号
            var yonghuPhoneCell = document.createElement('td');
            yonghuPhoneCell.innerHTML = item.yonghuPhone;
            row.appendChild(yonghuPhoneCell);


                //用户头像
            var yonghuPhotoCell = document.createElement('td');
            var yonghuPhotoImg = document.createElement('img');
            var yonghuPhotoImgValue = baseUrl +item.yonghuPhoto;
            if(yonghuPhotoImgValue !=null && yonghuPhotoImgValue !='' && yonghuPhotoImgValue !='null'){
                    yonghuPhotoImg.setAttribute('src', yonghuPhotoImgValue);
                    yonghuPhotoImg.setAttribute('height', 100);
                    yonghuPhotoImg.setAttribute('width', 100);
                    yonghuPhotoCell.appendChild(yonghuPhotoImg);
            }else{
                    yonghuPhotoCell.innerHTML = "暂无图片";
            }
            row.appendChild(yonghuPhotoCell);


            //申报理由
            var wangfanYuyueTextCell = document.createElement('td');
            wangfanYuyueTextCell.innerHTML = item.wangfanYuyueText;
            row.appendChild(wangfanYuyueTextCell);


            //交通工具
            var wangfanYuyueTypesCell = document.createElement('td');
            wangfanYuyueTypesCell.innerHTML = item.wangfanYuyueValue;
            row.appendChild(wangfanYuyueTypesCell);


            //去哪里
            var wangfanYuyueMudidiCell = document.createElement('td');
            wangfanYuyueMudidiCell.innerHTML = item.wangfanYuyueMudidi;
            row.appendChild(wangfanYuyueMudidiCell);


            //所在地
            var wangfanYuyueChufadiCell = document.createElement('td');
            wangfanYuyueChufadiCell.innerHTML = item.wangfanYuyueChufadi;
            row.appendChild(wangfanYuyueChufadiCell);


            //出发时间
            var wangfanYuyueChufaTimeCell = document.createElement('td');
            wangfanYuyueChufaTimeCell.innerHTML = item.wangfanYuyueChufaTime;
            row.appendChild(wangfanYuyueChufaTimeCell);


            //到达时间
            var wangfanYuyueDaodaTimeCell = document.createElement('td');
            wangfanYuyueDaodaTimeCell.innerHTML = item.wangfanYuyueDaodaTime;
            row.appendChild(wangfanYuyueDaodaTimeCell);


            //申报状态
            var wangfanYuyueYesnoTypesCell = document.createElement('td');
            wangfanYuyueYesnoTypesCell.innerHTML = item.wangfanYuyueYesnoValue;
            row.appendChild(wangfanYuyueYesnoTypesCell);


            //审核回复
            var wangfanYuyueYesnoTextCell = document.createElement('td');
            wangfanYuyueYesnoTextCell.innerHTML = item.wangfanYuyueYesnoText;
            row.appendChild(wangfanYuyueYesnoTextCell);


            //审核时间
            var wangfanYuyueShenheTimeCell = document.createElement('td');
            wangfanYuyueShenheTimeCell.innerHTML = item.wangfanYuyueShenheTime;
            row.appendChild(wangfanYuyueShenheTimeCell);


            //活动报名时间
            var insertTimeCell = document.createElement('td');
            insertTimeCell.innerHTML = item.insertTime;
            row.appendChild(insertTimeCell);



            //每行按钮
            var btnGroup = document.createElement('td');

            //详情按钮
            var detailBtn = document.createElement('button');
            var detailAttr = "detail(" + item.id + ')';
            detailBtn.setAttribute("type", "button");
            detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
            detailBtn.setAttribute("onclick", detailAttr);
            detailBtn.innerHTML = "查看";
            btnGroup.appendChild(detailBtn);

            if(sessionTable=='wuyong'){
                var tempBtn = document.createElement('button');
                var tempAttr = 'wuyong(' + item.id + ')';
                tempBtn.setAttribute("type", "button");
                tempBtn.setAttribute("class", "btn btn-warning btn-sm");
                tempBtn.setAttribute("onclick", tempAttr);
                tempBtn.innerHTML = "无用";
                btnGroup.appendChild(tempBtn);
            }
            if(item.wangfanYuyueYesnoTypes == 1){
                //审核按钮
                var yesnoBtn = document.createElement('button');
                var yesnoAttr = 'openYesnoTypes(' + item.id + ')';
                yesnoBtn.setAttribute("type", "button");
                yesnoBtn.setAttribute("class", "btn btn-warning btn-sm 审核");
                yesnoBtn.setAttribute("onclick", yesnoAttr);
                yesnoBtn.innerHTML = "审核";
                btnGroup.appendChild(yesnoBtn);
            }




            //修改按钮
            var editBtn = document.createElement('button');
            var editAttr = 'edit(' + item.id + ')';
            editBtn.setAttribute("type", "button");
            editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
            editBtn.setAttribute("onclick", editAttr);
            editBtn.innerHTML = "修改";
            btnGroup.appendChild(editBtn);



            //删除按钮
            var deleteBtn = document.createElement('button');
            var deleteAttr = 'remove(' + item.id + ')';
            deleteBtn.setAttribute("type", "button");
            deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
            deleteBtn.setAttribute("onclick", deleteAttr);
            deleteBtn.innerHTML = "删除";
            btnGroup.appendChild(deleteBtn);

            row.appendChild(btnGroup);

            return row;
    }




        // 翻页
        function pageNumChange(val) {
            if (val == 'pre') {
                pageIndex--;
            } else if (val == 'next') {
                pageIndex++;
            } else {
                pageIndex = val;
            }
            getDataList();
        }

        // 下载
        function download(url) {
            window.open(baseUrl+url);
        }
        // 打开新窗口播放媒体
        function mediaPlay(url){
            window.open(baseUrl+url);
        }

        /*导入*/
        function upload() {
            /*导入数据*/
            $('#wangfanYuyueExcelFile').fileupload({
                url: baseUrl + 'file/upload',
                headers: {token: window.sessionStorage.getItem("token")},
                dataType: "json",
                done: function (e, data) {
                    http("wangfanYuyue/batchInsert?fileName="+data.result.file, "get", {} , (res) => {
                        if(res.code == 0){
                            layui.layer.msg("操作成功", {time: 2000,icon: 6});
                        }
                    });
                }
            });
        }

        // 渲染翻页组件
        function pagination() {
            var beginIndex = pageIndex;
            var endIndex = pageIndex;
            var point = 4;
            //计算页码
            for (var i = 0; i < 3; i++) {
                if (endIndex == totalPage) {
                    break;
                }
                endIndex++;
                point--;
            }
            for (var i = 0; i < 3; i++) {
                if (beginIndex == 1) {
                    break;
                }
                beginIndex--;
                point--;
            }
            if (point > 0) {
                while (point > 0) {
                    if (endIndex == totalPage) {
                        break;
                    }
                    endIndex++;
                    point--;
                }
                while (point > 0) {
                    if (beginIndex == 1) {
                        break;
                    }
                    beginIndex--;
                    point--
                }
            }
            // 是否显示 前一页 按钮
            if (pageIndex > 1) {
                $('#tableId_previous').show();
            } else {
                $('#tableId_previous').hide();
            }
            // 渲染页码按钮
            for (var i = beginIndex; i <= endIndex; i++) {
                var pageNum = document.createElement('li');
                pageNum.setAttribute('onclick', "pageNumChange(" + i + ")");
                if (pageIndex == i) {
                    pageNum.setAttribute('class', 'paginate_button page-item active useOnce');
                } else {
                    pageNum.setAttribute('class', 'paginate_button page-item useOnce');
                }
                var pageHref = document.createElement('a');
                pageHref.setAttribute('class', 'page-link');
                pageHref.setAttribute('href', '#');
                pageHref.setAttribute('aria-controls', 'tableId');
                pageHref.setAttribute('data-dt-idx', i);
                pageHref.setAttribute('tabindex', 0);
                pageHref.innerHTML = i;
                pageNum.appendChild(pageHref);
                $('#tableId_next').before(pageNum);
            }
            // 是否显示 下一页 按钮
            if (pageIndex < totalPage) {
                $('#tableId_next').show();
                $('#tableId_next a').attr('data-dt-idx', endIndex + 1);
            } else {
                $('#tableId_next').hide();
            }
            var pageNumInfo = "当前第 " + pageIndex + " 页，共 " + totalPage + " 页";
            $('#tableId_info').html(pageNumInfo);
        }

        // 跳转到指定页
        function toThatPage() {
            //var index = document.getElementById('pageIndexInput').value;
            if (index < 0 || index > totalPage) {
                layui.layer.msg('请输入正确的页码', {time: 2000,icon: 5});
            } else {
                pageNumChange(index);
            }
        }

        // 全选/全不选
        function chooseAll() {
            checkAll = !checkAll;
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                boxs[i].checked = checkAll;
            }
        }

        // 批量删除
        function deleteMore() {
            ids = []
            var boxs = document.getElementsByName("chk");
            for (var i = 0; i < boxs.length; i++) {
                if (boxs[i].checked) {
                    ids.push(boxs[i].value)
                }
            }
            if (ids.length == 0) {
                layui.layer.msg('请勾选要删除的记录', {time: 2000,icon: 5});
            } else {
                remove(ids);
            }
        }

        // 删除
        function remove(id) {
            var mymessage = confirm("真的要删除吗？");
            if (mymessage == true) {
                var paramArray = [];
                if (id == ids) {
                    paramArray = id;
                } else {
                    paramArray.push(id);
                }
                httpJson("wangfanYuyue/delete", "POST", paramArray, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg(res.msg, {time: 2000,icon: 6});
                    }
                });
            } else {
                layui.layer.msg('已取消操作', {time: 2000,icon: 5});
            }
        }
        function wuyong(id) {
            var mymessage = confirm("确定 了么？");
            if (mymessage == true) {
                httpJson("wangfanYuyue/update", "POST", {
                    id:id,
                    wangfanYuyueTypes:2
                }, (res) => {
                    if(res.code == 0){
                        getDataList();
                        layui.layer.msg("操作成功", {time: 2000,icon: 6});
                    }
                });
            }
        }

        // 用户登出
        <%@ include file="../../static/logout.jsp"%>

        //修改
        function edit(id) {
            window.sessionStorage.setItem('updateId', id)
            window.location.href = "add-or-update.jsp"
        }

        //清除会重复渲染的节点
        function clear() {
            var elements = document.getElementsByClassName('useOnce');
            for (var i = elements.length - 1; i >= 0; i--) {
                elements[i].parentNode.removeChild(elements[i]);
            }
        }

        //添加
        function add() {
            window.sessionStorage.setItem("addwangfanYuyue", "addwangfanYuyue");
            window.location.href = "add-or-update.jsp"
        }

        //报表
        function graph() {
            window.location.href = "graph.jsp"
        }
        function exportExcel() {
            excel = new ExcelGen({
                "src_id": "tableId",
                "show_header": true,
                "file_name": 'wangfanYuyue.xlsx'
            });
            excel.generate();
        }

        // 查看详情
        function detail(id) {
            window.sessionStorage.setItem("updateId", id);
            window.location.href = "info.jsp";
        }


    //填充级联表搜索下拉框
                                         
                                                                                                    
    //填充本表搜索下拉框
                 
        function wangfanYuyueTypesSelectSearch() {
            var wangfanYuyueTypesSelectSearch = document.getElementById('wangfanYuyueTypesSelectSearch');
            if(wangfanYuyueTypesSelectSearch != null) {
                wangfanYuyueTypesSelectSearch.add(new Option('-请选择-',''));
                if (wangfanYuyueTypesOptions != null && wangfanYuyueTypesOptions.length > 0){
                    for (var i = 0; i < wangfanYuyueTypesOptions.length; i++) {
                            wangfanYuyueTypesSelectSearch.add(new Option(wangfanYuyueTypesOptions[i].indexName,wangfanYuyueTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function wangfanYuyueYesnoTypesSelectSearch() {
            var wangfanYuyueYesnoTypesSelectSearch = document.getElementById('wangfanYuyueYesnoTypesSelectSearch');
            if(wangfanYuyueYesnoTypesSelectSearch != null) {
                wangfanYuyueYesnoTypesSelectSearch.add(new Option('-请选择-',''));
                if (wangfanYuyueYesnoTypesOptions != null && wangfanYuyueYesnoTypesOptions.length > 0){
                    for (var i = 0; i < wangfanYuyueYesnoTypesOptions.length; i++) {
                            wangfanYuyueYesnoTypesSelectSearch.add(new Option(wangfanYuyueYesnoTypesOptions[i].indexName,wangfanYuyueYesnoTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                
    //查询级联表搜索条件所有列表

    //查询当前表搜索条件所有列表
            function wangfanYuyueTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=wangfan_yuyue_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        wangfanYuyueTypesOptions = res.data.list;
                    }
                });
            }
            function wangfanYuyueYesnoTypesSelect() {
                //填充下拉框选项
                http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=wangfan_yuyue_yesno_types", "GET", {}, (res) => {
                    if(res.code == 0){
                        wangfanYuyueYesnoTypesOptions = res.data.list;
                    }
                });
            }









// 101 102 103 104 105

            function openYesnoTypes(id) {
                $("#wangfanYuyueYesnoTypesId").val(id)
                $('#wangfanYuyueYesnoTypesModal').modal('show');
            }

            function wangfanYuyueYesnoTypesShenhe() {
                var mymessage = confirm("真的要确定这个审核结果吗？");
                if (mymessage == true) {
                    let data = {};
                    data["id"] = $("#wangfanYuyueYesnoTypesId").val();
                    if($("#wangfanYuyueYesnoTypes option:selected").val() == 2 || $("#wangfanYuyueYesnoTypes option:selected").val() ==3){
                        data["wangfanYuyueYesnoTypes"] = $("#wangfanYuyueYesnoTypes option:selected").val();//获取选中的申报状态
                    }else{
                        alert("请选择申报状态")
                        return false;
                    }
                    data["wangfanYuyueYesnoText"] = $("#wangfanYuyueYesnoText").val();
                    httpJson("wangfanYuyue/shenhe", "POST", data, (res) => {
                        if(res.code == 0){
                            alert('审核成功');
                            getDataList();
                        }else{
                            alert('审核失败');
                        }
                        $('#wangfanYuyueYesnoTypesModal').modal('hide');
                        $("#wangfanYuyueYesnoTypes").val(1);
                        $("#wangfanYuyueYesnoTypesId").val(null);
                        $("#wangfanYuyueYesnoText").val(null);
                    });
                }else {
                    $('#wangfanYuyueYesnoTypesModal').modal('hide');
                    $("#wangfanYuyueYesnoTypes").val(1);
                    $("#wangfanYuyueYesnoTypesId").val(null);
                    $("#wangfanYuyueYesnoText").val(null);
                    alert("已取消操作");
                }
            }

        layui.use(['layer', 'carousel', 'jquery', 'form', 'upload', 'laydate', 'rate'], function () {
            var rate = layui.rate;//评分
            var jquery = layui.jquery;//jquery
            var $=jquery;

        });


        $(document).ready(function () {
            //激活翻页按钮
            $('#tableId_previous').attr('class', 'paginate_button page-item previous')
            $('#tableId_next').attr('class', 'paginate_button page-item next')
            //隐藏原生搜索框
            $('#tableId_filter').hide()
            //设置右上角用户名
            $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
            //设置项目名
            $('.sidebar-header h3 a').html(projectName)
            setMenu();
            init();

            upload()
            //查询级联表的搜索下拉框

            //查询当前表的搜索下拉框
            wangfanYuyueTypesSelect();
            wangfanYuyueYesnoTypesSelect();
            getDataList();

        //级联表的下拉框赋值
                                                 
                                                                                                                        
        //当前表的下拉框赋值
                                                 
            wangfanYuyueTypesSelectSearch();
                                                             
            wangfanYuyueYesnoTypesSelectSearch();
                                                
        <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>
