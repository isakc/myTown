<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script>
	var $loginBtn = $("#login button");
	$loginBtn.click(function() {
		var $this = $(this);
		if ($this.hasClass("login")) {
			loginBox();
		} else {
			joinBox();
		}
	})
	
	var $loginBox = $("#loginBox");
	var $joinBox = $("#joinBox");
	$(".bg, .join_cancel_btn").click(function() {
		$loginBox.hide();
		$joinBox.hide();
	})
	
	function loginBox() {
		$loginBox.show();
		$(".cancel_btn").click(function() {
			$loginBox.hide();
		})
		$(".user_login_btn").click(
				function() {
					var id = $(".login #id").val();
					var password = $(".login #password").val();
					$.ajax("ajax/login.jsp", {
						dataType : "json",
						type : "post",
						data : {
							"id" : id,
							"password" : password
						},error : function(xhr, error) {alert("점검중aaa")},
						success : function(json) {
							if (json.result) {
								$loginBox.hide();
								$("#login").addClass("login_ok");
								$("#user").addClass("login_ok");
							} else {
								$(".msg_box").addClass("on").text(
										"아이디 / 비밀번호가 맞지 않습니다. 다시 확인해 주세요.");
							}
						} // success end
					}) // $.ajax() end
				})
	}
	
	function joinBox() {
		$joinBox.show();
		$(".insert_btn").click(function() {
			var $form = $("#joinDataForm");
			var formData = new FormData($form);
			$.ajax("ajax/join.jsp", {
				dataType : "json",
				type : "post",
				data : formData, error : function(xhr, error) {alert("점검중form")},
				success : function(json) {
					
				} // success end
			}) // $.ajax() end
			/*
			$.ajax({
				  url: "ajax_upload_ok.php",
				  data: formData,
				  type: "POST",
				  cache: false,
				  success: function(args) {
				   $('#submit').show();
				   $('#result').html("<img src='./upload/"+args+"'>");
				   $('#form1').trigger("reset");
				  },
				  error: function(args) {
				   $('#submit').show();
				   $('#result').html("File upload failed.");
				   $('#result').append("!!!");
				   $('#form1').trigger("reset");
				  },
			 })*/
		})
	}
	
</script>
<script>
	$(".logout").click(function (e) {
		e.preventDefault();
		$.ajax("ajax/logout.jsp",{
			dataType:"json", type:"post", error:function(xhr,error) {alert("점검중aaa")},
			success:function(json){
				if(json.result) {
					$("#login").removeClass("login_ok");
					$("#user").removeClass("login_ok");
				}
			} // success end
		}) // $.ajax() end
	})
</script>