/**
 *  10/24
 */

$(function(){
 	$('#apibtn').click(function(){
 	$.ajax({
 	url:'/cls/jq/kakaopay.cls' ,
 	dataType:'json' ,
 	success:function(data){
 		var box=next_redirect_pc_url;
 		window.open(box);
 	} ,
 	error:function(error){
 	alert(error);
 	}
 	});
 	});
 });