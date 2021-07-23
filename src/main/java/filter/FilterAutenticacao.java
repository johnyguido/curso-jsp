package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


import connection.SingleConnectionBanco;

@WebFilter(urlPatterns = { "/principal/*" }) /* INTERCEPTA TODAS AS REQUISIÇÕES */
public class FilterAutenticacao implements Filter {

	private static Connection connection;

	public FilterAutenticacao() {
		// TODO Auto-generated constructor stub
	}

	/* ENCERRA OS PROCESSOS QUANDO O SERVIDOR É PARADO */
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
	}

	/* INTERCEPTA TODAS AS REQUISIÇÕES */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		try {

			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = req.getSession();

			String usuarioLogado = (String) session.getAttribute("usuario");

			String urlParaAutenticar = req.getServletPath(); /* URL QUE ESTÁ SENDO ACESSADA */

			/* VALIDAR SE ESTA LOGADO SENAO REDIRECIONA PARA A TELA DE LOGIN */

			if (usuarioLogado == null && !urlParaAutenticar.equalsIgnoreCase("principal/ServletLogin")) {

				RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
				request.setAttribute("msg", "Por favor realize o login");
				redireciona.forward(request, response);
				return;
			} else {

				chain.doFilter(request, response);
			}

			connection.commit();

		} catch (Exception e) {
			e.printStackTrace();
			try {
				connection.rollback();
			} catch (SQLException e1) {

				e1.printStackTrace();
			}
		}

	}

	/* INICIA OS PROCESSOS QUANDO O SERVIDOR É INICIADO */
	public void init(FilterConfig fConfig) throws ServletException {
	/* ANALISAR O ERRO DE TLD AO IMPLEMENTAR A LINHA 83*/
		//	connection = SingleConnectionBanco.getConnection();
	}

}
