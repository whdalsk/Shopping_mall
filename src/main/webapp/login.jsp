<% String recentURI = request.getParameter("from"); %>
<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>EShopper - Bootstrap Shop Template</title>
     <link rel="stylesheet" type="text/css" href="./css/Loginc.css">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">
    
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
</head>
<body>
    <form action="loginSave.jsp?from=<%=recentURI%>" method="post">
    	<div>
    		<div class="container">
        		<div class="input-form-backgroud row">
          			<div class="input-form col-md-5 mx-auto">
            			<h1 class="mb-3"><b>Login</b></h1>
            				<class="validation-form" novalidate>
              					<div class="row">
                					<div class="col-md-12 mb-3">
                  						<label for="name">User ID</label>
                  						<input type="text" class="form-control" name="id" id="id" placeholder="" value="" required maxlength="56">
                  						<div class="invalid-feedback">
                    						아이디를 입력해주세요.
                  						</div>
               						 </div>
              					</div>
              					<div class="row">
              						<div class="col-md-12 mb-3">
                						<label for="email">Password</label>
                						<input type="password" class="form-control" name="pass" id="pass" required maxlength="56">
						                <div class="invalid-feedback">
						                	패스워드를 입력해주세요.
						                </div>
              						</div>
    							<div class="row">
                				</div>
                <div class="col-md-4 mb-3">
                  
                </div>
              </div>
              <hr class="mb-4">
              <div align="center" class="mb-4"><button class="btn btn-primary btn-lg" type="submit">Login</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button onclick="location.href='signUp.jsp'" class="btn btn-primary btn-lg" type="submit">Sign up</button></div>
              
              
            </form>
          </div>
        </div>
       </div>
       </div>
      
	
</body>

</html>