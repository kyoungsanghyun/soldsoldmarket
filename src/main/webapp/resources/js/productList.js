$(document).ready(() => {
	var priceOrder = $("#priceOrder").val();
		
	if(priceOrder == "") {
		 $("#recent").addClass("clicked");
	} else {
		 $("#"+priceOrder).addClass("clicked");
	}

});


function changeProductList(category, searchWord, priceOrder, page) {
	var listForm = $("#listForm");
	
	//debugger;
	
	$("#category").val(category);
	$("#searchWord").val(searchWord);
	$("#priceOrder").val(priceOrder);
	$("#page").val(page);
	
	listForm.submit();
}
