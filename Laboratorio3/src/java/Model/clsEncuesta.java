/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author bryan
 */
public class clsEncuesta {
    static Conexion oCon;
    public int id;
    public String nombre;
    
    public static int Insert(String nombre) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        String query = "insert into tblEncuesta(encuestaNombre) values('"+nombre+"')";
        int resp = oCon.agregar(query);
        return resp;
    }
    public static int Delete(int id) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        String query = "";
        int resp = oCon.eliminar("tblEncuesta", "encuestaId="+id);
        return resp;
    }
    public static ArrayList<clsEncuesta> GetAll() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        ArrayList<clsEncuesta> encuestas = new ArrayList<>();
        ResultSet rs = oCon.consultar("*", "tblEncuesta");
        while(rs.next()){
            clsEncuesta item = new clsEncuesta();
            item.id = rs.getInt(1);
            item.nombre=rs.getString(2);
            encuestas.add(item);
        }
        return encuestas;
    }
    public static int update(int id, String nombre) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        int resp = oCon.DoQuery2("update tblEncuesta set encuestaNombre='"+nombre+"' where encuestaId="+id);
        return resp;
    }
}
