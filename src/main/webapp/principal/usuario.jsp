<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<jsp:include page="head.jsp"></jsp:include>


<body>

	<!-- Pre-loader start -->

	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbarmainmenu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->

						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<div class="row">
											<div class="col-sm-12">
												<!-- Basic Form Inputs card start -->
												<div class="card">

													<div class="card-block">
													<span>${ msg }</span>
														<h4 class="sub-title">Cad. usuário</h4>


														<div class="card-block">

															<form class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method=post>
																<div class="form-group form-default">
																	<input type="text" name="id" Id="id"
																		class="form-control" readonly="readonly" value="${ modelLogin.id }"> <span
																		class="form-bar"></span> <label class="float-label">ID:</label>
																</div>

																<div class="form-group form-default">
																	<input type="text" name="nome" Id="nome"
																		class="form-control" required="required" value="${ modelLogin.nome }"> <span
																		class="form-bar"></span> <label class="float-label">NOME:</label>
																</div>

																<div class="form-group form-default">
																	<input type="email" name="email" Id="email"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.email }"> <span class="form-bar"></span>
																	<label class="float-label">E-mail:</label>
																</div>
																
																<div class="form-group form-default">
																	<input type="login" name="login" Id="login"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.login }"> <span class="form-bar"></span>
																	<label class="float-label">Login:</label>
																</div>
																
																<div class="form-group form-default">
																	<input type="password" name="senha" id="senha"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.senha }"> <span class="form-bar"></span>
																	<label class="float-label">Password:</label>
																</div>

																<button class="btn btn-primary waves-effect waves-light">Novo
																	Button</button>
																<button class="btn btn-success waves-effect waves-light">Salvar
																</button>
																<button class="btn btn-info waves-effect waves-light">Excluir</button>

															</form>




														</div>
													</div>
												</div>
											</div>
										</div>

									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Warning Section Starts -->
	<!-- Older IE warning message -->
	<!--[if lt IE 10]>
    <div class="ie-warning">
        <h1>Warning!!</h1>
        <p>You are using an outdated version of Internet Explorer, please upgrade <br/>to any of the following web browsers to access this website.</p>
        <div class="iew-container">
            <ul class="iew-download">
                <li>
                    <a href="http://www.google.com/chrome/">
                        <img src="assets/images/browser/chrome.png" alt="Chrome">
                        <div>Chrome</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.mozilla.org/en-US/firefox/new/">
                        <img src="assets/images/browser/firefox.png" alt="Firefox">
                        <div>Firefox</div>
                    </a>
                </li>
                <li>
                    <a href="http://www.opera.com">
                        <img src="assets/images/browser/opera.png" alt="Opera">
                        <div>Opera</div>
                    </a>
                </li>
                <li>
                    <a href="https://www.apple.com/safari/">
                        <img src="assets/images/browser/safari.png" alt="Safari">
                        <div>Safari</div>
                    </a>
                </li>
                <li>
                    <a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie">
                        <img src="assets/images/browser/ie.png" alt="">
                        <div>IE (9 & above)</div>
                    </a>
                </li>
            </ul>
        </div>
        <p>Sorry for the inconvenience!</p>
    </div>
    <![endif]-->
	<!-- Warning Section Ends -->

	<jsp:include page="javascriptFile.jsp"></jsp:include>
</body>





</html>