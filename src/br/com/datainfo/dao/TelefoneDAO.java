package br.com.datainfo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import br.com.datainfo.conexao.Conexao;
import br.com.datainfo.model.Telefone;

public class TelefoneDAO {
	Conexao conexao = new Conexao();
	
	//ADICIONA TELEFONE AO CRIAR USUARIO 
	public void inserirTelefone(int idusuario, Telefone telefone) {
		String inserir = "insert into db_telefones(ddd, numero, tipo, idusuario) values (?,?,?,?)";
		try {
			Connection con = conexao.conectar();
			PreparedStatement pst = con.prepareStatement(inserir);
			pst.setInt(1, telefone.getDdd());
			pst.setString(2, telefone.getNumero());
			pst.setString(3, telefone.getTipo());
			pst.setInt(4, idusuario);
			pst.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//DELETAR
	public void deletarTelefone(int id) {
		String deletar = "delete from db_telefones where id = ?";
		try {
			Connection con = conexao.conectar();
			PreparedStatement pst = con.prepareStatement(deletar);
			pst.setInt(1, id);
			pst.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	//LISTA OS TELEFONES NO BD
	public ArrayList<Telefone> listaTelefones() {
		ArrayList<Telefone> listatelefones = new ArrayList<>();
		String telefones = "select * from db_telefones order by id";
		try {
			Connection con = conexao.conectar();
			PreparedStatement pst = con.prepareStatement(telefones);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("id");
				int ddd = rs.getInt("ddd");
				String numero = rs.getString("numero");
				String tipo = rs.getString("tipo");
				int idusuario = rs.getInt("idusuario");
				listatelefones.add(new Telefone(id, ddd, numero, tipo, idusuario));
			}
			con.close();
			return listatelefones;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
	
	//LISTA TELEFONES DE USUARIO ESPECIFICO PELO ID
	public ArrayList<Telefone> listaTelefonesById(int id) {
		ArrayList<Telefone> listatelefones = new ArrayList<>();
		String telefones = "select * from db_telefones where idusuario = ?";
		try {
			Connection con = conexao.conectar();
			PreparedStatement pst = con.prepareStatement(telefones);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				int idtelefone = rs.getInt("id");
				int ddd = rs.getInt("ddd");
				String numero = rs.getString("numero");
				String tipo = rs.getString("tipo");
				int idusuario = rs.getInt("idusuario");
				listatelefones.add(new Telefone(idtelefone, ddd, numero, tipo, idusuario));
			}
			con.close();
			return listatelefones;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	//VERIFICA SE O NUMERO EXISTE NO BANCO
	public boolean existeNumero(String numero) {
		boolean existe = false;
		String existeNumero = "select * from db_telefones where numero = ?";
		try {
			Connection con = conexao.conectar();
			PreparedStatement pst = con.prepareStatement(existeNumero);
			pst.setString(1, numero);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				existe = true;
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return existe;
	}
}
