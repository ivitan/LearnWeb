﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="manager_room_index" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Mysqlserver" %>

<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../../static_admin/Css/style.css" />
    <script type="text/javascript" src="../../static_admin/Js/jquery.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/bootstrap.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/ckform.js"></script>
    <script type="text/javascript" src="../../static_admin/Js/common.js"></script>

    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }


    </style>
</head>
<body>
<form class="form-inline definewidth m20" action="index.aspx" method="get">
    房间号：
    <input type="text" name="rolename" id="rolename"class="abc input-default" placeholder="" value="">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; <button type="button" class="btn btn-success" id="addnew">新增房间</button>
</form>
<table class="table table-bordered table-hover definewidth m10" >
    <thead>
    <tr>
        <th>房间号</th>
        <th>类型</th>
        <th>状态</th>
        <th>管理操作</th>
    </tr>
    </thead>
     <%
        SqlServerDataBase obj = new SqlServerDataBase();
        string sql = "select *from [room]";
        DataSet ds = obj.Select(sql, null);
        if (ds != null || ds.Tables.Count != 0 || ds.Tables[0].Rows.Count != 0)
        {
            //Response.Write(ds.Tables[0].Rows.Count);
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                string rid = ds.Tables[0].Rows[i][0].ToString();
                string tid = ds.Tables[0].Rows[i][1].ToString();
                sql = "select type_name from type where tid="+tid;
                string type_name = obj.Select(sql, null).Tables[0].Rows[0][0].ToString();
                string number = ds.Tables[0].Rows[i][2].ToString();
                string status = ds.Tables[0].Rows[i][3].ToString();
                Response.Write("<tr><td>" + number + "</td>");
                Response.Write("<td>" + type_name + "</td>");
                Response.Write("<td>" + status  + "</td>");
                Response.Write("<td>" + "<a href='edit.aspx?rid=" + rid + "&tid=" + tid + "&status=" + status +"'>编辑</a> <a href='#' onclick='del(" + rid + ")'>删除</a>" + "</td></tr>");
            }
            
        }
        

    %>
   
</table>
<div class="inline pull-right page">
   
</div>
</body>
</html>
<script>
    $(function () {

        $('#addnew').click(function () {

            window.location.href = "add.aspx";
        });


    });

    function del(id) {
        var xmlhttp;
        var status = "";
        try {
            xmlhttp = new ActiveXObject('Msxml2.XMLHTTP');
        } catch (e) {
            try {
                xmlhttp = new ActiveXObject('Microsoft.XMLHTTP');
            } catch (e) {
                try {
                    xmlhttp = new XMLHttpRequest();
                } catch (e) { }
            }
        }


        if (confirm("确定要删除吗？")) {

            xmlhttp.open("GET", "../../delete.ashx?table=room&rid=" + id, true);
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4)
                //xmlhttp.status==404 代表 没有发现该文件
                    if (xmlhttp.status == 200) {
                        //alert(xmlhttp.status);
                        status = xmlhttp.responseText;
                        if (status == 1) {
                            alert("删除成功");
                        } else {
                            alert("删除失败");
                        }
                        console.log(status);
                    } else {
                        alert("发生错误：" + xmlhttp.status);
                    }

            }
            xmlhttp.send(null);
            window.location.href = "index.aspx";

        }


    }
</script>
