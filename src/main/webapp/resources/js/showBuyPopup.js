/**
 * 
 */
 
/*********************************
즉시구매 클릭시 나오는 팝업
**********************************/
function showBuyPopup(){
	let item = $("#actionBoardItemName").val();
	let immediatly = $("#immediatly").val();
	let actionBoardNo = $("#actionBoardNo").val();
	window.open("showBuyPopup?item="+item+"&immediatly="+immediatly+"&actionBoardNo="+actionBoardNo,
	 "주문정보", "width=700, height=500, left=100, top=50");
}

