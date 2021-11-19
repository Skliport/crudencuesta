/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author bryan
 */
public class Conexion {

    Connection conexion = null;
    static String url = "jdbc:mysql://localhost:3306/Parcial";
    static String Usuario = "root";
    static String contrasena = "root";

    public Conexion() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            this.conexion = DriverManager.getConnection(url, Usuario, contrasena);
        } catch (SQLException e) {

        }
    }
    public ResultSet consultar(String campos, String tabla) throws SQLException {
        String sql = "SELECT " + campos + " FROM " + tabla;
        Statement cons = this.conexion.createStatement();
        return cons.executeQuery(sql);
    }

    public ResultSet DoQuery(String query) throws SQLException {
        Statement cons = this.conexion.createStatement();
        return cons.executeQuery(query);
    }
    public int DoQuery2(String query) throws SQLException{
        try{
        Statement cons = this.conexion.createStatement();
        cons.executeUpdate(query);
        return 1;
        } catch (Exception e) {
            return -5;
        }
    }

    public ResultSet consultar(String campos, String tabla, String condicion) throws SQLException {
        String sql = "SELECT " + campos + " FROM " + tabla + " where " + condicion;
        Statement cons = this.conexion.createStatement();
        return cons.executeQuery(sql);
    }

    public int agregar(String sqlInsert) {
        try {
            Statement add = this.conexion.createStatement();
            return add.executeUpdate(sqlInsert);
        } catch (Exception e) {
            return -5;
        }
    }

    public int eliminar(String tabla, String condicion) throws SQLException {

        String sql = "delete from " + tabla + " where " + condicion;
        Statement del = this.conexion.createStatement();
        return del.executeUpdate(sql);
    }
}
