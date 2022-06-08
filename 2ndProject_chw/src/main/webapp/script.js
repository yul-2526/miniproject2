$(function(){
	$("input[name=id]").keydown(function() {
		$('#idmessage').css('display','none');
		
	});
});
 
function writeSave(){
	//alert(2);
	
	if($('input[name="id"]').val()==""){
		alert("아이디가 누락됐습니다.");
		$('input[name="id"]').focus();
		return false;
	}
	
	if(use == "impossible"){
		alert("이미 사용중인 아이디입니다.");
		return false;
	}
	
	if($('input[name="password"]').val()==""){
		alert("패스워드가 누락됐습니다.");
		$('input[name="password"]').focus();
		return false;
	}
}//writeSave

function duplicate(){
	$.ajax({
				url : "id_check_proc.jsp",
				data : ({	
					userid : $('input[name=id]').val() 
					}),
				success : function(data){
					if($('input[name="id"]').val()==""){
						$('#idmessage').html("<font color=red>id 입력 누락</font>");
						$('#idmessage').show();
					}
					else if($.trim(data)=='YES'){
						$('#idmessage').html("<font color=red>사용할 수 있습니다.</font>");
						$('#idmessage').show();
						use = "possible";
					}
					else{
						$('#idmessage').html("<font color=red>이미 사용중인 아이디 입니다.</font>");
						$('#idmessage').show();
						use = "impossible";
					}
				}//success
		});//ajax
		
}//duplicate


function pwcheck(){
	var pw = document.forms[0].password.value; 
	
	var regexp = /^[a-z0-9]{3,8}$/; 
	if(pw.search(regexp) == -1){ 
		alert("비번 형식이 틀립니다.");
	}
	
	var chk_num = pw.search(/[0-9]/);
	var chk_eng = pw.search(/[a-z]/);
	if(chk_num < 0 || chk_eng < 0){
		alert("비번은 영문자와 숫자를 조합해 주세요.");
		return false;
	}
}//pwcheck


function repwcheck(){
	if($('input[name="password"]').val()== $('input[name="repassword"]').val() ){
		$('#pwmessage').html("<font color=blue>비번일치</font>");
	}
	else{
		$('#pwmessage').html("<font color=red>비번 불일치</font>");
	}
}//repwcheck











