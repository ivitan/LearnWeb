$("#showPage").keyup(function() {
	$(this).val($(this).val().replace(/[^0-9.]/g, ''));
}).bind("paste", function() { //CTR+V�¼�����    
	$(this).val($(this).val().replace(/[^0-9.]/g, ''));
}).css("ime-mode", "disabled"); //CSS�������뷨������   
