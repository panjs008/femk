<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>其他物料发放表</title>
	<t:base type="jquery,easyui,tools,DatePicker"></t:base>
	<%@include file="/context/header2.jsp"%>
	<script src="${webRoot}/context/orderSelect.js"></script>
	<script src="${webRoot}/context/gys.js"></script>

	<script type="text/javascript">
		//编写自定义JS代码
	</script>
</head>
<body>
<t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="emkFormaterialOtherController.do?doUpdate" tiptype="1">
	<input id="id" name="id" type="hidden" value="${emkFormaterialOtherPage.id }"/>
	<table style="width: 100%;" cellpadding="0" cellspacing="1" class="formtable">
		<tr>
			<td align="right">
				<label class="Validform_label">
					工厂:
				</label>
			</td>
			<td class="value">
				<select class="form-control select2" id="gysId"  datatype="*"  >
					<option value=''>请选择</option>
				</select>
				<input id="gysCode" name="gysCode" type="hidden" value="${emkFormaterialOtherPage.gysCode }" style="width: 150px" class="inputxt"  ignore="ignore" />
				<input id="gys" name="gys" type="hidden"  value="${emkFormaterialOtherPage.gys }"  style="width: 150px" class="inputxt"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">工厂</label>
			</td>
			<td align="right">
				<label class="Validform_label">
					发放日期:
				</label>
			</td>
			<td class="value">
				<input id="ffDate" name="ffDate" readonly value="${emkFormaterialOtherPage.ffDate }" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"  type="text" style="width: 150px" class="Wdate"  ignore="ignore" />
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">发放日期</label>
			</td>
		</tr>

		<tr>
			<td align="right">
				<label class="Validform_label">
					单号:
				</label>
			</td>
			<td class="value" colspan="3">
				<input type="hidden" id="orderNoV" value="${emkFormaterialOtherPage.orderNo }"/>
				<select class="form-control select2" id="orderNo" value="${emkFormaterialOtherPage.orderNo }" name="orderNo" datatype="*"  >
					<option value=''>请选择</option>
				</select>
				<span class="Validform_checktip"></span>
				<label class="Validform_label" style="display: none;">单号</label>
			</td>

		</tr>

	</table>
	<t:tabs id="detail" iframe="false"  tabPosition="top" fit="false">
		<t:tab href="emkFormaterialOtherController.do?orderMxList&formaterialOtherId=${emkFormaterialOtherPage.id }" icon="icon-search" title="明细" id="detail"></t:tab>
	</t:tabs>
</t:formvalid>
</body>
