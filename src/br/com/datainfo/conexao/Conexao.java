package br.com.datainfo.conexao;

import java.sql.Connection;
import java.sql.DriverManager;


//CLASSE DE APOIO A CONEXAO COM O BD - 
public class Conexao {
	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/db_datainfo?useTimezone=true&serverTimezone=UTC";
	private String user = "root";    //ALTERAR PARA TESTE LOCAL
	private String password = "Root"; //ALTERAR PARA TESTE LOCAL

	public Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}