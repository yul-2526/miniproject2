/**
 * check.js
 */

function check(){ // 원글쓰기,수정,답글쓰기 
		//alert(1);
		if($('input[name="writer"]').val()==""){
			alert("이름을 입력하세요");
			$('input[name="writer"]').focus();
			return false;
		}
		
		if($('textarea[name="content"]').val()==""){
    		alert("내용을 입력하세요");
    		$('textarea[name="content"]').focus();
    		return false;
    	}

		if($('input[name="passwd"]').val()==""){
			alert("비번을 입력하세요");
			$('input[name="passwd"]').focus();
			return false;
		}
	} // check
	 