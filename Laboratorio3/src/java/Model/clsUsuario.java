/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.SQLException;

/**
 *
 * @author bryan
 */
public class clsUsuario {
    static Conexion oCon;
    int usuarioId;
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
}
