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

														<h4 class="sub-title">Cad. usu�rio</h4>


														<div class="card-block">

															<form class="form-material"
																action="<%=request.getContextPath()%>/ServletUsuarioController"
																method=post id="formUser">

																<input type="hidden" name="acao" id="acao" value="">

																<div
																	class="form-group form-default form-static-label form-static-label">
																	<input type="text" name="id" Id="id"
																		class="form-control" readonly="readonly"
																		value="${ modelLogin.id }"> <span
																		class="form-bar"></span> <label class="float-label">ID:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="text" name="nome" Id="nome"
																		class="form-control" autocomplete="off"
																		value="${ modelLogin.nome }"> <span
																		class="form-bar"></span> <label class="float-label">NOME:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="email" name="email" Id="email"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.email }">
																	<span class="form-bar"></span> <label
																		class="float-label">E-mail:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="login" name="login" Id="login"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.login }">
																	<span class="form-bar"></span> <label
																		class="float-label">Login:</label>
																</div>

																<div class="form-group form-default form-static-label">
																	<input type="password" name="senha" id="senha"
																		class="form-control" required="required"
																		autocomplete="off" value="${ modelLogin.senha }">
																	<span class="form-bar"></span> <label
																		class="float-label">Password:</label>
																</div>

																<button type="button"
																	class="btn btn-primary waves-effect waves-light"
																	onclick="limparForm();">Novo</button>
																<button class="btn btn-success waves-effect waves-light">Salvar
																</button>
																<button type="button"
																	class="btn btn-info waves-effect waves-light"
																	onclick="criarDeleteComAjax();">Excluir</button>

																<!-- Button trigger modal -->
																<button type="button" class="btn btn-secondary"
																	data-toggle="modal" data-target="#exampleModal">
																	Pesquisar</button>
															</form>




														</div>
													</div>
												</div>
											</div>
										</div>

										<span id="msg">${msg}</span>

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


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Pesquisa de
					usu�rio</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="Nome"
						aria-label="nome" aria-describedby="basic-addon2" id="nomeBusca">
					<div class="input-group-append">
						<button class="btn btn-success" type="button"
							onclick="buscarUsuario();">Buscar</button>
					</div>
				</div>
				
				<div  style="height: 300px; overflow: scroll;">
					<table class="table" id="tabelaresultados">
						<thead>
							<tr>
								<th scope="col">ID</th>
								<th scope="col">Nome</th>
								<th scope="col">Ver</th>
							</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
					
				</div>
			</div>
			<span id="totalresultados"></span>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function buscarUsuario() {

		var nomeBusca = document.getElementById('nomeBusca').value;

		if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {

			var urlAction = document.getElementById('formUser').action;

			$.ajax(
					{
						method : "get",
						url : urlAction,
						data : "nomeBusca=" + nomeBusca
								+ '&acao=buscarUserAjax',
						success : function(response) {

							var json = JSON.parse(response);

							$('#tabelaresultados > tbody > tr').remove();

							for (var p = 0; p < json.length; p++) {
								$('#tabelaresultados > tbody').append(
										'<tr> <td>' + json[p].id
												+ '</td> <td> ' + json[p].nome
												+ '</td> <td><button type="button" class="btn btn-info">Ver</button></td> </tr>');
							}
							
							document.getElementById('totalresultados').textContent = 'Total de registros: ' + json.length;

						}

					}).fail(function(xhr, status, errorThrown) {
				alert('Erro ao buscar usu�rio por nome: ' + xhr.responseText);
			});

		}

	}

	function criarDeleteComAjax() {
		if (confirm('Deseja realmente excluir os dados?')) {
			var urlAction = document.getElementById('formUser').action;
			var idUser = document.getElementById('id').value;
			$.ajax({
				method : "get",
				url : urlAction,
				data : "id=" + idUser + '&acao=deletarajax',
				success : function(response) {
					limparForm();
					document.getElementById('msg').textContent = response;
				}
			}).fail(function(xhr, status, errorThrown) {
				alert('Erro ao deletar usu�rio por id: ' + xhr.responseText);
			});
		}
	}

	function criarDelete() {

		if (confirm('Deseja realmente excluir os dados?')) {

			document.getElementById("formUser").method = 'get';
			document.getElementById("acao").value = 'deletar';
			document.getElementById("formUser").submit();

		}

	}

	function limparForm() {

		var elementos = document.getElementById("formUser").elements;

		for (p = 0; p < elementos.length; p++) {
			elementos[p].value = '';

		}

	}
</script>



</html>