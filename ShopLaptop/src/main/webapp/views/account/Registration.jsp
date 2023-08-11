<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="assets/css/css.css">
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">
						<i class="fa fa-times"></i>
					</button>
					<h4 class="modal-title">Tạo tài khoản</h4>
					<label for="userEmail">${mess}</label>
				</div>

				<form action="/ShopLaptop/Registration" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="userEmail">Tài khoản</label> <input type="text"
								class="form-control" required="" name="user" value="">
							<!--<span class="help-block">Your email address is also used to log in.</span>  -->
						</div>
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="password">Mật khẩu</label> <input type="password"
										class="form-control" required="" name="pass" id="password" value="">
									<!-- <span class="help-block">Choose a password for your new account.</span> -->
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="passwordr">Nhập lại mật khẩu</label> <input
										type="password" class="form-control" required="" name="repass" id="repassword"
										value="">
									<!-- <span class="help-block">Type the password again. Passwords must match.</span> -->
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">

						<input type="hidden" name="isEmpty" value="">
						<button id="registerBtn" type="submit" name="submit" value="newAccount"
							class="btn btn-success btn-icon">
							<i class="fa fa-check"></i> Tạo tài khoản
						</button>
						<a href="${url}/ShopLaptop/views/account/Login.jsp">Back </a>
					</div>
				</form>
				<script>
					const passwordInput = document.getElementById("password");
					const repasswordInput = document
							.getElementById("repassword");
					const registerBtn = document.getElementById("registerBtn");

					function checkPasswords() {
						const password = passwordInput.value;
						const repassword = repasswordInput.value;

						if (password === repassword) {
							registerBtn.removeAttribute("disabled");
						} else {
							registerBtn.setAttribute("disabled", true);
						}
					}

					// Gọi hàm kiểm tra khi có thay đổi trong ô nhập lại mật khẩu
					repasswordInput.addEventListener("input", checkPasswords);
				</script>
			</div>
		</div>
	</div>
</body>
</html>