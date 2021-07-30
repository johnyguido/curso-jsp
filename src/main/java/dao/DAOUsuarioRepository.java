package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {

		connection = SingleConnectionBanco.getConnection();

	}

	public ModelLogin gravarUsuario(ModelLogin modelLogin) throws Exception {

		String sql = "insert into model_login(login, senha, nome, email) VALUES (?, ?, ?, ?)";

		PreparedStatement prepareSql = connection.prepareStatement(sql);

		prepareSql.setString(1, modelLogin.getLogin());
		prepareSql.setString(2, modelLogin.getSenha());
		prepareSql.setString(3, modelLogin.getNome());
		prepareSql.setString(4, modelLogin.getEmail());

		prepareSql.execute();
		connection.commit();

		return this.consultarUsuario(modelLogin.getLogin());

	}

	public ModelLogin consultarUsuario(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * from model_login where upper(login) = upper('" + login + "')";

		PreparedStatement statemant = connection.prepareStatement(sql);

		ResultSet resultado = statemant.executeQuery();

		while (resultado.next()) {

			modelLogin.setId(resultado.getLong("id"));
			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setSenha(resultado.getString("senha"));

		}

		return modelLogin;

	}

	public boolean validarLogin(String login) throws Exception {

		String sql = "SELECT count(1) > 0 as existe from model_login where upper(login) = upper('" + login + "')";
		
		PreparedStatement statemant = connection.prepareStatement(sql);

		ResultSet resultado = statemant.executeQuery();
		
		resultado.next();
		
		return resultado.getBoolean("existe");

	}

}
