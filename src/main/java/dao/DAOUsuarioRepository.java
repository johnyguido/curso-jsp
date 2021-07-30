package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.SingleConnectionBanco;
import model.ModelLogin;

public class DAOUsuarioRepository {

	private Connection connection;
	
	public DAOUsuarioRepository() {
		
		connection = SingleConnectionBanco.getConnection();
		
	}
	
	
	public void gravarUsuario(ModelLogin modelLogin) throws Exception {
		
		String sql = "insert into model_login(login, senha, nome, email) VALUES (?, ?, ?, ?)";
		
		PreparedStatement prepareSql = connection.prepareStatement(sql);
		
		prepareSql.setString(1, modelLogin.getLogin());
		prepareSql.setString(2, modelLogin.getSenha());
		prepareSql.setString(3, modelLogin.getNome());
		prepareSql.setString(4, modelLogin.getEmail());
		
		prepareSql.execute();
		connection.commit();
		
				
				
		
	}
	
}
