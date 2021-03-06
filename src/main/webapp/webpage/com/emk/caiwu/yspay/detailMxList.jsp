<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">
    var srflag = 0;
    var currentFlag = 0;


    $('#addBtnSR').linkbutton({
        iconCls: 'icon-add'
    });
    $('#delBtn').linkbutton({
        iconCls: 'icon-remove'
    });
    $('#addBtnSR').bind('click', function(){
        srflag++;
        var tr =  $("#add_jeecgOrderProduct_tableSR_template tr").clone();
        $("#add_jeecgOrderProduct_tableSR").append(tr);

        /*$("#add_jeecgOrderProduct_tableSR").find("[id='signPrice00']").attr("datatype","d");
         $("#add_jeecgOrderProduct_tableSR").find("[id='signPrice00']").attr("id","signPrice"+srflag);*/
        resetTrNum('add_jeecgOrderProduct_tableSR');
        $("#orderMxListIDSR").val($("#mxtbSR").find("tr").length-1);
    });
    $('#delBtn').bind('click', function(){
        var chk_value =[];
        $('input[name="ck"]:checked').each(function(){
            chk_value.push($(this).val());
        });
        $("#add_jeecgOrderProduct_tableSR").find("input:checked").parent().parent().remove();
        resetTrNum('add_jeecgOrderProduct_tableSR');
        $("#orderMxListIDSR").val($("#mxtbSR").find("tr").length-1);

        if(chk_value.length>0){

        }

    });
    $(document).ready(function(){
        $(".datagrid-toolbar").parent().css("width","auto");
        <c:if test="${param.ysPayId eq null || param.ysPayId eq ''}">
            $('#addBtnSR').click();
        </c:if>
    });

</script>
<style>
    .table-c table{border-right:1px solid #ddd;border-bottom:1px solid #ddd}
    .table-c table td{border-left:1px solid #ddd;border-top:1px solid #ddd;height: 36px;}
</style>
<!-- 添加明细模版-->
<table style="width:100%;display: none;border: 1px;" cellpadding="0" cellspacing="2" border="0">
    <tbody id="add_jeecgOrderProduct_tableSR_template">
    <tr>
        <td align="center"><input style="width: 40px;" type="checkbox" name="ck" />
        <td align="center"><input id="outDate00" nullmsg="请输入出货日期！" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"  errormsg="请输入出货日期" name="orderMxList[#index#].outDate00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="inDate00" nullmsg="请输入进仓日期！" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" class="Wdate"  errormsg="请输入进仓日期" name="orderMxList[#index#].inDate00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="cusNum00" nullmsg="请输入客户代码！"  errormsg="请输入客户代码" name="orderMxList[#index#].cusNum00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="tdNum00" nullmsg="请输入提单号！"  errormsg="请输入提单号" name="orderMxList[#index#].tdNum00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="levealFactoryNo00" nullmsg="请输入离厂放行条号！"  errormsg="请输入离厂放行条号" name="orderMxList[#index#].levealFactoryNo00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="cargoNo00" nullmsg="请输入订舱通知单号！"  errormsg="请输入订舱通知单号" name="orderMxList[#index#].cargoNo00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="outForumNo00" nullmsg="请输入出货通知单号！"  errormsg="请输入出货通知单号" name="orderMxList[#index#].outForumNo00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="orderNo00" nullmsg="请输入订单号！"  errormsg="请输入订单号" name="orderMxList[#index#].orderNo00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="sampleNo00" nullmsg="请输入款号！"  errormsg="请输入款号" name="orderMxList[#index#].sampleNo00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="sampleDesc00" nullmsg="请输入描述！"  errormsg="请输入描述" name="orderMxList[#index#].sampleDesc00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="signTotal00" nullmsg="请输入数量！"  datatype="n" errormsg="请输入整数" name="orderMxList[#index#].signTotal00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="asumWeightMao00" datatype="d" nullmsg="请输入总毛重！"  errormsg="请输入数值型数据" name="orderMxList[#index#].asumWeightMao00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="asumVolume00" datatype="d" nullmsg="请输入总体积！"  errormsg="请输入数值型数据" name="orderMxList[#index#].asumVolume00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="startPlace00" nullmsg="请输入始发地！"  errormsg="请输入始发地" name="orderMxList[#index#].startPlace00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="endPlace00" nullmsg="请输入目的地！"  errormsg="请输入目的地" name="orderMxList[#index#].endPlace00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
        <td align="center"><input id="cost00" datatype="d" nullmsg="请输入运费！"  errormsg="请输入数值型数据" name="orderMxList[#index#].cost00" maxlength="100" type="text" value=""
                                  style="width: 86%;" ignore="ignore"></td>
    </tr>
    </tbody>

</table>
<div style="padding: 3px; height: 25px; width:100%;margin-bottom:4px " class="datagrid-toolbar"><a id="addBtnSR" href="#"></a> <a id="delBtn" href="#"></a></div>
<%--<table border="0" cellpadding="2" cellspacing="0" id="jeecgOrderProduct_table">--%>
<input id="orderMxListIDSR" type="hidden" name="orderMxListIDSR" value="${fn:length(emkYsPayDetailEntities)}"/>
<div class="table-c" style="overflow: auto; width: 100%;">
    <table id="mxtbSR" width="1600px"  border="0" cellspacing="0" cellpadding="0">
        <tr bgcolor="#F8F8F8" style="height: 32px;" >
            <td align="center"  width="40" >序号</td>
            <td align="center"  width="140">出货日期</td>
            <td align="center"  width="140">进仓日期</td>
            <td align="center"  width="140">客户代码</td>
            <td align="center"  width="180">提单号</td>
            <td align="center"  width="180">离厂放行条号</td>
            <td align="center"  width="180">订舱通知单号</td>
            <td align="center"  width="180">出货通知单号</td>
            <td align="center"  width="180">订单号</td>
            <td align="center"  width="100">款号</td>
            <td align="center"  width="100">描述</td>
            <td align="center"  width="90">数量</td>
            <td align="center"  width="80">总毛重</td>
            <td align="center"  width="80">总体积</td>
            <td align="center"  width="80">始发地</td>
            <td align="center"  width="80">目的地</td>
            <td align="center"  width="80">运费</td>

        </tr>

        <tbody id="add_jeecgOrderProduct_tableSR">
        <c:if test="${fn:length(emkYsPayDetailEntities)  > 0 }">
            <c:forEach items="${emkYsPayDetailEntities}" var="poVal" varStatus="status">
                <tr>
                    <td align="center"><input style="width: 40px;" type="checkbox" name="ck" value="${poVal.id}"/>
                    </td>
                    <td align="center"><input  nullmsg="请输入出货日期！" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${poVal.outDate}" class="Wdate"  errormsg="请输入出货日期" name="orderMxList[${status.index}].outDate00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入进仓日期！" readonly onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="${poVal.inDate}" class="Wdate"  errormsg="请输入进仓日期" name="orderMxList[${status.index}].inDate00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入客户代码！"  errormsg="请输入客户代码" name="orderMxList[${status.index}].cusNum00" value="${poVal.cusNum}" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入提单号！"  errormsg="请输入提单号" value="${poVal.tdNum}" name="orderMxList[${status.index}].tdNum00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input nullmsg="请输入离厂放行条号！"  errormsg="请输入离厂放行条号" value="${poVal.levealFactoryNo}" name="orderMxList[${status.index}].levealFactoryNo00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入订舱通知单号！"  errormsg="请输入订舱通知单号" value="${poVal.cargoNo}" name="orderMxList[${status.index}].cargoNo00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入出货通知单号！"  errormsg="请输入出货通知单号" value="${poVal.outForumNo}" name="orderMxList[${status.index}].outForumNo00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>

                    <td align="center"><input  nullmsg="请输入订单号！"  errormsg="请输入订单号" value="${poVal.orderNo}" name="orderMxList[${status.index}].orderNo00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入款号！"  errormsg="请输入款号" value="${poVal.sampleNo}" name="orderMxList[${status.index}].sampleNo00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入描述！"  errormsg="请输入描述" value="${poVal.shipDesc}" name="orderMxList[${status.index}].sampleDesc00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入数量！" datatype="n" errormsg="请输入数量" value="${poVal.total}" name="orderMxList[${status.index}].signTotal00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入总毛重！"  datatype="d" errormsg="请输入数值型数据" value="${poVal.sumBoxMao}" name="orderMxList[${status.index}].asumWeightMao00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入总体积！"  datatype="d" errormsg="请输入数值型数据" value="${poVal.sumBoxVolume}" name="orderMxList[${status.index}].asumVolume00" maxlength="100" type="text" value=""
                                               style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input nullmsg="请输入始发地！"  errormsg="请输入始发地" value="${poVal.startPlace}" name="orderMxList[${status.index}].startPlace00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input  nullmsg="请输入目的地！"  errormsg="请输入目的地" value="${poVal.endPlace}" name="orderMxList[${status.index}].endPlace00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>
                    <td align="center"><input datatype="d" nullmsg="请输入运费！"  value="${poVal.cost}" errormsg="请输入数值型数据" name="orderMxList[${status.index}].cost00" maxlength="100" type="text" value=""
                                              style="width: 86%;" ignore="ignore"></td>


                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>

