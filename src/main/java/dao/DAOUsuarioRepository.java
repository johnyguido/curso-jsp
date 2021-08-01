package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;

	public DAOUsuarioRepository() {

		connection = SingleConnectionBanco.getConnection();

	}

	public ModelLogin gravarUsuario(ModelLogin modelLogin) throws Exception {

		if (modelLogin.isNovo()) {

			String sql = "insert into model_login(login, senha, nome, email) VALUES (?, ?, ?, ?)";

			PreparedStatement prepareSql = connection.prepareStatement(sql);

			prepareSql.setString(1, modelLogin.getLogin());
			prepareSql.setString(2, modelLogin.getSenha());
			prepareSql.setString(3, modelLogin.getNome());
			prepareSql.setString(4, modelLogin.getEmail());

			prepareSql.execute();
			connection.commit();

			return this.consultarUsuario(modelLogin.getLogin());

		} else {

			String sql = "UPDATE model_login SET login=?, senha=?, nome=?, email=? where id = " + modelLogin.getId()
					+ ";";

			PreparedStatement prepareSql = connection.prepareStatement(sql);

			prepareSql.setString(1, modelLogin.getLogin());
			prepareSql.setString(2, modelLogin.getSenha());
			prepareSql.setString(3, modelLogin.getNome());
			prepareSql.setString(4, modelLogin.getEmail());

			prepareSql.execute();
			connection.commit();
		}

		return this.consultarUsuario(modelLogin.getLogin());

	}
	
	public List<ModelLogin> consultarUsuarioList() throws Exception {

		List<ModelLogin> retorno = new ArrayList<>();

		String sql = "select * from model_login ORDER BY id DESC";

		PreparedStatement statement = connection.prepareStatement(sql);

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			// modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setId(resultado.getLong("id"));

			retorno.add(modelLogin);
		}

		return retorno;
	}

	public List<ModelLogin> consultarUsuarioList(String nome) throws Exception {

		List<ModelLogin> retorno = new ArrayList<>();

		String sql = "select * from model_login where upper(nome) like upper(?) ORDER BY id DESC";

		PreparedStatement statement = connection.prepareStatement(sql);
		
		statement.setString(1, "%" + nome + "%"); 

		ResultSet resultado = statement.executeQuery();

		while (resultado.next()) {

			ModelLogin modelLogin = new ModelLogin();

			modelLogin.setEmail(resultado.getString("email"));
			modelLogin.setLogin(resultado.getString("login"));
			// modelLogin.setSenha(resultado.getString("senha"));
			modelLogin.setNome(resultado.getString("nome"));
			modelLogin.setId(resultado.getLong("id"));

			retorno.add(modelLogin);
		}

		return retorno;
	}

	public ModelLogin consultarUsuario(String login) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "SELECT * from model_login where upper(login) = upper('" + login + "ORDER BY id DESC')";

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

	public ModelLogin consultarUsuarioPorId(String id) throws Exception {

		ModelLogin modelLogin = new ModelLogin();

		String sql = "select * from model_login where id = ?";

		PreparedStatement prepareSql = connection.prepareStatement(sql);

		prepareSql.setLong(1, Long.parseLong(id));

		ResultSet resultado = prepareSql.executeQuery();

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

	public void deletarUser(String id) throws Exception {

		String sql = "DELETE FROM model_login WHERE id = ?;";

		PreparedStatement prepareSql = connection.prepareStatement(sql);

		prepareSql.setLong(1, Long.parseLong(id));

		prepareSql.executeUpdate();

		connection.commit();

	}

}
