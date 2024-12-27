<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- testsID -->
	<input type="hidden" name="testsID"
		value="<%=request.getParameter("testsID")%>">
<!-- partID -->
	<input type="hidden" name="partID"
		value="<%=request.getParameter("partID")%>">

<div class="modal-body" style="text-align: left;padding:0px;"> <p style="margin-left:20px;color:var(--color-text) !important;">Bạn có chắc chắn muốn xóa?</p></div>
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
	<button type="submit" class="btn btn-danger">Xóa</button>
</div> 

