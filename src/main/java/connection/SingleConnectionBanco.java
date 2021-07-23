package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

	private static String banco = "jdbc:postgresql://localhost:5432/curso-jsp?autoReconnect=true";
	private static String user = "postgres";
	private static String senha = "LearnSQL@2020";

	private static Connection connection = null;
	
	public static Connection getConnection(){
		return connection;
	}

	static {
		conectar();
	}

	public SingleConnectionBanco() {
		conectar();
	}

	private static void conectar() {

		try {

			if (connection == null) {
				Class.forName("org.postgresql.Driver"); /* Carrega o driver de conexao do banco */
				connection = DriverManager.getConnection(banco, user, senha );
				connection.setAutoCommit(false);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
