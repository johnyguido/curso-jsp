package filter;

import java.io.IOException;

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

@WebFilter(urlPatterns = { "/principal/*" }) /* INTERCEPTA TODAS AS REQUISIÇÕES */
public class FilterAutenticacao implements Filter {

	public FilterAutenticacao() {
		// TODO Auto-generated constructor stub
	}

	/* ENCERRA OS PROCESSOS QUANDO O SERVIDOR É PARADO */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/* INTERCEPTA TODAS AS REQUISIÇÕES */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

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
	}

	/* INICIA OS PROCESSOS QUANDO O SERVIDOR É INICIADO */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
