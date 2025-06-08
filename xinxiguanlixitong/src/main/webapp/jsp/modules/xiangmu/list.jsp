<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">


<head>
    <%@ include file="../../static/head.jsp" %>
    <!-- font-awesome -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
</head>
<style>

</style>
<body>
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
                    <h3 class="block-title">项目管理</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">项目管理</li>
                        <li class="breadcrumb-item active">项目列表</li>
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
                        <h3 class="widget-title">项目列表</h3>
                        <div class="table-responsive mb-3">
                            <div class="col-sm-12">
                                                                                                 
                                        <label>
                                            项目名
                                            <input type="text" id="xiangmuNameSearch" style="width: 140px;" class="form-control form-control-sm"
                                                   placeholder="项目名" aria-controls="tableId">
                                        </label>
                                 
                                            <label>
                                                项目类型
                                                <select name="xiangmuTypesSelectSearch" style="width: 100px;" id="xiangmuTypesSelectSearch" class="form-control form-control-sm"
                                                        aria-controls="tableId">
                                                </select>
                                            </label>
                                 
                                            <label>
                                                项目进度
                                                <select name="xiangmujinduTypesSelectSearch" style="width: 100px;" id="xiangmujinduTypesSelectSearch" class="form-control form-control-sm"
                                                        aria-controls="tableId">
                                                </select>
                                            </label>
                                                                                                 
                                        <label>
                                            项目开始时间
                                            <input type="datetime-local" id="insertTimeStartSearch" style="width: 230px;" class="form-control " placeholder="开始" aria-controls="tableId">
                                        </label>
                                            -
                                        <label>
                                            <input type="datetime-local" id="insertTimeEndSearch" style="width: 230px;"  class="form-control" placeholder="结束" aria-controls="tableId">
                                        </label>
                                 
                                        <label>
                                            项目结束时间
                                            <input type="datetime-local" id="updateTimeStartSearch" style="width: 230px;" class="form-control " placeholder="开始" aria-controls="tableId">
                                        </label>
                                            -
                                        <label>
                                            <input type="datetime-local" id="updateTimeEndSearch" style="width: 230px;"  class="form-control" placeholder="结束" aria-controls="tableId">
                                        </label>
                                
                                                                                                                                                                                 
                                        <label>
                                            姓名
                                            <input type="text" id="nameSearch"  style="width: 120px;" class="form-control form-control-sm"
                                                   placeholder="姓名" aria-controls="tableId">
                                        </label>
                                             
                                        <label>
                                            身份证号
                                            <input type="text" id="idNumberSearch"  style="width: 120px;" class="form-control form-control-sm"
                                                   placeholder="身份证号" aria-controls="tableId">
                                        </label>

                                                                                                                                                                                
                                <button onclick="search()" type="button" class="btn btn-primary">查询</button>
                                <button onclick="add()" type="button" class="btn btn-success 新增">添加</button>
                                <button onclick="graph()" type="button" class="btn btn-success 报表">报表</button>
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

                                    <th >负责人姓名</th>
                                    <th >负责人身份证号</th>
                                    <th >项目名</th>
                                    <th >项目类型</th>
                                    <th >项目进度</th>
                                    <th >项目文件</th>
                                    <th >项目开始时间</th>
                                    <th >项目结束时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="thisTbody">
                                </tbody>
                            </table>
                            <div class="col-md-6 col-sm-3">
                                <div class="dataTables_length" id="tableId_length">

                                    <select name="tableId_length" aria-controls="tableId" id="selectPageSize"
                                            onchange="changePageSize()">
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    条 每页

                                </div>
                            </div>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-end">
                                    <li class="page-item" id="tableId_previous" onclick="pageNumChange('pre')">
                                        <a class="page-link" href="#" tabindex="-1">上一页</a>
                                    </li>

                                    <li class="page-item" id="tableId_next" onclick="pageNumChange('next')">
                                        <a class="page-link" href="#">下一页</a>
                                    </li>
                                </ul>
                            </nav>
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
<script language="javascript" type="text/javascript"
        src="${pageContext.request.contextPath}/resources/My97DatePicker/WdatePicker.js"></script>

<script>
    <%@ include file="../../utils/menu.jsp"%>
            <%@ include file="../../static/setMenu.js"%>
            <%@ include file="../../utils/baseUrl.jsp"%>
            <%@ include file="../../static/getRoleButtons.js"%>
            <%@ include file="../../static/crossBtnControl.js"%>
    var tableName = "xiangmu";
    var pageType = "list";
    var searchForm = {key: ""};
    var pageIndex = 1;
    var pageSize = 10;
    var totalPage = 0;
    var dataList = [];
    var sortColumn = '';
    var sortOrder = '';
    var ids = [];
    var checkAll = false;

     var sexTypesOptions = [];
     var bumenTypesOptions = [];
     var zhiweiTypesOptions = [];

    var xiangmuTypesOptions = [];
    var xiangmujinduTypesOptions = [];

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



    // 查询
    function search() {
        searchForm = {key: ""};

        <!-- 级联表的级联字典表 -->
                                                                                 
                        //姓名
        var nameSearchInput = $('#nameSearch');
        if( nameSearchInput != null){
            if (nameSearchInput.val() != null && nameSearchInput.val() != '') {
                searchForm.name = $('#nameSearch').val();
            }
        }
                     
                        //手机号
        var phoneSearchInput = $('#phoneSearch');
        if( phoneSearchInput != null){
            if (phoneSearchInput.val() != null && phoneSearchInput.val() != '') {
                searchForm.phone = $('#phoneSearch').val();
            }
        }
                     
                        //身份证号
        var idNumberSearchInput = $('#idNumberSearch');
        if( idNumberSearchInput != null){
            if (idNumberSearchInput.val() != null && idNumberSearchInput.val() != '') {
                searchForm.idNumber = $('#idNumberSearch').val();
            }
        }
                     
        var sexTypesSelectSearchInput = document.getElementById("sexTypesSelectSearch");
        if(sexTypesSelectSearchInput != null){
            var sexTypesIndex = sexTypesSelectSearchInput.selectedIndex;
            if( sexTypesIndex  != 0){
                searchForm.sexTypes = document.getElementById("sexTypesSelectSearch").options[sexTypesIndex].value;
            }
        }
                     
                            //年龄
        var ageStartSearchInput = $('#ageStartSearch');
        if(ageStartSearchInput != null){
            var ageStartSearchValue = ageStartSearchInput.val();
            if( ageStartSearchValue  != 0){
                searchForm.ageStart = ageStartSearchValue;
            }
        }
        var ageEndSearchInput = $('#ageEndSearch');
        if(ageEndSearchInput != null){
            var ageEndSearchValue = ageEndSearchInput.val();
            if( ageEndSearchValue  != 0){
                searchForm.ageEnd = ageEndSearchValue;
            }
        }
                     
        var bumenTypesSelectSearchInput = document.getElementById("bumenTypesSelectSearch");
        if(bumenTypesSelectSearchInput != null){
            var bumenTypesIndex = bumenTypesSelectSearchInput.selectedIndex;
            if( bumenTypesIndex  != 0){
                searchForm.bumenTypes = document.getElementById("bumenTypesSelectSearch").options[bumenTypesIndex].value;
            }
        }
                     
        var zhiweiTypesSelectSearchInput = document.getElementById("zhiweiTypesSelectSearch");
        if(zhiweiTypesSelectSearchInput != null){
            var zhiweiTypesIndex = zhiweiTypesSelectSearchInput.selectedIndex;
            if( zhiweiTypesIndex  != 0){
                searchForm.zhiweiTypes = document.getElementById("zhiweiTypesSelectSearch").options[zhiweiTypesIndex].value;
            }
        }
                                                                                    <!-- 本表的查询条件 -->

             
        //项目名
        var xiangmuNameSearchInput = $('#xiangmuNameSearch');
        if( xiangmuNameSearchInput != null){
            if (xiangmuNameSearchInput.val() != null && xiangmuNameSearchInput.val() != '') {
                searchForm.xiangmuName = $('#xiangmuNameSearch').val();
            }
        }
     
            //项目类型
        var xiangmuTypesSelectSearchInput = document.getElementById("xiangmuTypesSelectSearch");
        if(xiangmuTypesSelectSearchInput != null){
            var xiangmuTypesIndex = xiangmuTypesSelectSearchInput.selectedIndex;
            if( xiangmuTypesIndex  != 0){
                searchForm.xiangmuTypes= document.getElementById("xiangmuTypesSelectSearch").options[xiangmuTypesIndex].value;
            }
        }
     
            //项目进度
        var xiangmujinduTypesSelectSearchInput = document.getElementById("xiangmujinduTypesSelectSearch");
        if(xiangmujinduTypesSelectSearchInput != null){
            var xiangmujinduTypesIndex = xiangmujinduTypesSelectSearchInput.selectedIndex;
            if( xiangmujinduTypesIndex  != 0){
                searchForm.xiangmujinduTypes= document.getElementById("xiangmujinduTypesSelectSearch").options[xiangmujinduTypesIndex].value;
            }
        }
             
        var insertTimeStartSearch = $('#insertTimeStartSearch');
        if( insertTimeStartSearch != null){
            if (insertTimeStartSearch.val() != null && insertTimeStartSearch.val() != '') {
                searchForm.insertTimeStart = $('#insertTimeStartSearch').val();
            }
        }
        var insertTimeEndSearch = $('#insertTimeEndSearch');
        if( insertTimeEndSearch != null){
            if (insertTimeEndSearch.val() != null && insertTimeEndSearch.val() != '') {
                searchForm.insertTimeEnd = $('#insertTimeEndSearch').val();
            }
        }
     
        var updateTimeStartSearch = $('#updateTimeStartSearch');
        if( updateTimeStartSearch != null){
            if (updateTimeStartSearch.val() != null && updateTimeStartSearch.val() != '') {
                searchForm.updateTimeStart = $('#updateTimeStartSearch').val();
            }
        }
        var updateTimeEndSearch = $('#updateTimeEndSearch');
        if( updateTimeEndSearch != null){
            if (updateTimeEndSearch.val() != null && updateTimeEndSearch.val() != '') {
                searchForm.updateTimeEnd = $('#updateTimeEndSearch').val();
            }
        }
            getDataList();
    }

    // 获取数据列表
    function getDataList() {
        http("xiangmu/page", "GET", {
            page: pageIndex,
            limit: pageSize,
            sort: sortColumn,
            order: sortOrder,
            //本表的
            xiangmuName: searchForm.xiangmuName,
            xiangmuTypes: searchForm.xiangmuTypes,
            xiangmujinduTypes: searchForm.xiangmujinduTypes,
            insertTimeStart: searchForm.insertTimeStart,
            insertTimeEnd: searchForm.insertTimeEnd,
            updateTimeStart: searchForm.updateTimeStart,
            updateTimeEnd: searchForm.updateTimeEnd,
            //级联表的
                        name: searchForm.name,
                        phone: searchForm.phone,
                        idNumber: searchForm.idNumber,
                        sexTypes: searchForm.sexTypes,
            ageStart: searchForm.ageStart,
                                ageEnd: searchForm.ageEnd,
                        bumenTypes: searchForm.bumenTypes,
                        zhiweiTypes: searchForm.zhiweiTypes,


    }, (res) => {
            if(res.code == 0)
            {
                clear();
                $("#thisTbody").html("");
                dataList = res.data.list;
                totalPage = res.data.totalPage;
                //var tbody = document.getElementById('tbMain');
                for (var i = 0; i < dataList.length; i++) { //遍历一下表格数据  
                    var trow = setDataRow(dataList[i], i); //定义一个方法,返回tr数据 
                    $('#thisTbody').append(trow);
                }
                pagination(); //渲染翻页组件
                getRoleButtons();// 权限按钮控制
            }
        })
        ;
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

                //姓名
        var nameCell = document.createElement('td');
        nameCell.innerHTML = item.name;
        row.appendChild(nameCell);


                //身份证号
        var idNumberCell = document.createElement('td');
        idNumberCell.innerHTML = item.idNumber;
        row.appendChild(idNumberCell);


        //项目名
        var xiangmuNameCell = document.createElement('td');
        xiangmuNameCell.innerHTML = item.xiangmuName;
        row.appendChild(xiangmuNameCell);


        //项目类型
        var xiangmuTypesCell = document.createElement('td');
        xiangmuTypesCell.innerHTML = item.xiangmuValue;
        row.appendChild(xiangmuTypesCell);


        //项目进度
        var xiangmujinduTypesCell = document.createElement('td');
        xiangmujinduTypesCell.innerHTML = item.xiangmujinduValue;
        row.appendChild(xiangmujinduTypesCell);


            //项目文件
        var xiangmuFileCell = document.createElement('td');
        if(item.xiangmuFile ==null || item.xiangmuFile == '' || item.xiangmuFile == 'null'){
                xiangmuFileCell.innerHTML = '没有下载文件';
        }else {
            var xiangmuFileFile = document.createElement('button');
                xiangmuFileFile.innerHTML = '下载';
            var xiangmuFileFileAttr = "download('" + item.xiangmuFile + "')"
                xiangmuFileFile.setAttribute('onclick',xiangmuFileFileAttr);
                xiangmuFileCell.appendChild(xiangmuFileFile);
        }
        row.appendChild(xiangmuFileCell);


        //项目开始时间
        var insertTimeCell = document.createElement('td');
        insertTimeCell.innerHTML = item.insertTime;
        row.appendChild(insertTimeCell);


        //项目结束时间
        var updateTimeCell = document.createElement('td');
        updateTimeCell.innerHTML = item.updateTime;
        row.appendChild(updateTimeCell);



        //每行按钮
        var btnGroup = document.createElement('td');

        //详情按钮
        var detailBtn = document.createElement('button');
        var detailAttr = "detail(" + item.id + ')';
        detailBtn.setAttribute("type", "button");
        detailBtn.setAttribute("class", "btn btn-info btn-sm 查看");
        detailBtn.setAttribute("onclick", detailAttr);
        detailBtn.innerHTML = "查看"
        btnGroup.appendChild(detailBtn)
        //修改按钮
        var editBtn = document.createElement('button');
        var editAttr = 'edit(' + item.id + ')';
        editBtn.setAttribute("type", "button");
        editBtn.setAttribute("class", "btn btn-warning btn-sm 修改");
        editBtn.setAttribute("onclick", editAttr);
        editBtn.innerHTML = "修改"
        btnGroup.appendChild(editBtn)
        //删除按钮
        var deleteBtn = document.createElement('button');
        var deleteAttr = 'remove(' + item.id + ')';
        deleteBtn.setAttribute("type", "button");
        deleteBtn.setAttribute("class", "btn btn-danger btn-sm 删除");
        deleteBtn.setAttribute("onclick", deleteAttr);
        deleteBtn.innerHTML = "删除"
        btnGroup.appendChild(deleteBtn)

        row.appendChild(btnGroup)
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
        window.open(url);
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
            alert('请输入正确的页码');
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
            alert('请勾选要删除的记录');
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
            httpJson("xiangmu/delete", "POST", paramArray, (res) => {
                if(res.code == 0
        )
            {
                getDataList();
                alert('删除成功');
            }
        })
            ;
        }
        else {
            alert("已取消操作");
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
        window.sessionStorage.setItem("addxiangmu", "addxiangmu");
        window.location.href = "add-or-update.jsp"
    }

    //报表
    function graph() {
        window.location.href = "graph.jsp"
    }

    // 查看详情
    function detail(id) {
        window.sessionStorage.setItem("updateId", id);
        window.location.href = "info.jsp";
    }

    //填充级联表搜索下拉框
                                                                                 
                     
                     
                     
        function sexTypesSelectSearch() {
            var sexTypesSelectSearch = document.getElementById('sexTypesSelectSearch');
            if(sexTypesSelectSearch != null) {
                sexTypesSelectSearch.add(new Option('-请选择-',''));
                if (sexTypesOptions != null && sexTypesOptions.length > 0){
                    for (var i = 0; i < sexTypesOptions.length; i++) {
                            sexTypesSelectSearch.add(new Option(sexTypesOptions[i].indexName, sexTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
                     
        function bumenTypesSelectSearch() {
            var bumenTypesSelectSearch = document.getElementById('bumenTypesSelectSearch');
            if(bumenTypesSelectSearch != null) {
                bumenTypesSelectSearch.add(new Option('-请选择-',''));
                if (bumenTypesOptions != null && bumenTypesOptions.length > 0){
                    for (var i = 0; i < bumenTypesOptions.length; i++) {
                            bumenTypesSelectSearch.add(new Option(bumenTypesOptions[i].indexName, bumenTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                     
        function zhiweiTypesSelectSearch() {
            var zhiweiTypesSelectSearch = document.getElementById('zhiweiTypesSelectSearch');
            if(zhiweiTypesSelectSearch != null) {
                zhiweiTypesSelectSearch.add(new Option('-请选择-',''));
                if (zhiweiTypesOptions != null && zhiweiTypesOptions.length > 0){
                    for (var i = 0; i < zhiweiTypesOptions.length; i++) {
                            zhiweiTypesSelectSearch.add(new Option(zhiweiTypesOptions[i].indexName, zhiweiTypesOptions[i].codeIndex));
                    }
                }
            }
        }
                                                                                
    //填充本表搜索下拉框
             
     
        function xiangmuTypesSelectSearch() {
            var xiangmuTypesSelectSearch = document.getElementById('xiangmuTypesSelectSearch');
            if(xiangmuTypesSelectSearch != null) {
                xiangmuTypesSelectSearch.add(new Option('-请选择-',''));
                if (xiangmuTypesOptions != null && xiangmuTypesOptions.length > 0){
                    for (var i = 0; i < xiangmuTypesOptions.length; i++) {
                            xiangmuTypesSelectSearch.add(new Option(xiangmuTypesOptions[i].indexName,xiangmuTypesOptions[i].codeIndex));
                    }
                }
            }
        }
     
        function xiangmujinduTypesSelectSearch() {
            var xiangmujinduTypesSelectSearch = document.getElementById('xiangmujinduTypesSelectSearch');
            if(xiangmujinduTypesSelectSearch != null) {
                xiangmujinduTypesSelectSearch.add(new Option('-请选择-',''));
                if (xiangmujinduTypesOptions != null && xiangmujinduTypesOptions.length > 0){
                    for (var i = 0; i < xiangmujinduTypesOptions.length; i++) {
                            xiangmujinduTypesSelectSearch.add(new Option(xiangmujinduTypesOptions[i].indexName,xiangmujinduTypesOptions[i].codeIndex));
                    }
                }
            }
        }
             
     
    
    //查询级联表搜索条件所有列表
        function sexTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=sex_types", "GET", {}, (res) => {
                if(res.code == 0){
                    sexTypesOptions = res.data.list;
                }
            });
        }
        function bumenTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=bumen_types", "GET", {}, (res) => {
                if(res.code == 0){
                    bumenTypesOptions = res.data.list;
                }
            });
        }
        function zhiweiTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=zhiwei_types", "GET", {}, (res) => {
                if(res.code == 0){
                    zhiweiTypesOptions = res.data.list;
                }
            });
        }

    //查询当前表搜索条件所有列表
        function xiangmuTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=xiangmu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    xiangmuTypesOptions = res.data.list;
                }
            });
        }
        function xiangmujinduTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=xiangmujindu_types", "GET", {}, (res) => {
                if(res.code == 0){
                    xiangmujinduTypesOptions = res.data.list;
                }
            });
        }


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

        //查询级联表的搜索下拉框
        sexTypesSelect();
        bumenTypesSelect();
        zhiweiTypesSelect();

        //查询当前表的搜索下拉框
        xiangmuTypesSelect();
        xiangmujinduTypesSelect();
        getDataList();

        //级联表的下拉框赋值
                                                                                                 
                         
                         
                         
    sexTypesSelectSearch();
                         
                         
    bumenTypesSelectSearch();
                         
    zhiweiTypesSelectSearch();
                                                                                                
        //当前表的下拉框赋值
                                     
             
            xiangmuTypesSelectSearch();
             
            xiangmujinduTypesSelectSearch();
                                     
             
            
    <%@ include file="../../static/myInfo.js"%>
    });
</script>
</body>

</html>