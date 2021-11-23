/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author bryan
 */
public class clsUsuario {
    static Conexion oCon;
    public int usuarioId;
    public String usuarioNombre;
    public String usuarioApellido;
    public String usuarioCorreo;
    public String usuarioClave;
    public static int Insert(clsUsuario item) throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        String query = "insert into tblUsuarios(usuarioNombre,usuarioApellido,usuarioClave,usuarioCorreo) values('"+item.usuarioNombre+"','"+item.usuarioApellido+"','"+item.usuarioClave+"','"+item.usuarioCorreo+"')";
        int resp = oCon.agregar(query);
        return resp;
    }
    public static clsUsuario LogIn(String username,String clave)throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
        oCon = new Conexion();
        String query = "select * from tblUsuarios where usuarioCorreo='"+username+"' and usuarioClave='"+clave+"'";
        ResultSet rs = oCon.DoQuery(query);
        clsUsuario item = new clsUsuario();
        if (rs.next()) {
            item.usuarioId = rs.getInt(1);
            item.usuarioNombre=rs.getString(2);
            item.usuarioApellido=rs.getString(3);
            item.usuarioCorreo=rs.getString(4);
        }else{
            item.usuarioId=-5;
            item.usuarioNombre="test";
            item.usuarioApellido="test";
            item.usuarioCorreo="test";
        }
        return item;
    }
}
