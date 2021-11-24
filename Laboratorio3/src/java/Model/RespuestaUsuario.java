package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RespuestaUsuario {
    
    public int usuarioRespuestaId, respuestaId, usuarioId;
    public String respuesta;
    static Conexion oCon;
    
    public static ArrayList<RespuestaUsuario> GetAll() throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();    
        ArrayList<RespuestaUsuario> lRespuestaUsuario = new ArrayList<>();
        ResultSet rs = oCon.consultar("*", "tblRespuestaUsuario");
        
        while(rs.next()){
            RespuestaUsuario respuestaUsuario = new RespuestaUsuario();
            respuestaUsuario.usuarioRespuestaId = rs.getInt(1);
            respuestaUsuario.respuestaId = rs.getInt(2);
            respuestaUsuario.usuarioId = rs.getInt(3);
            respuestaUsuario.respuesta = rs.getString(4);
            lRespuestaUsuario.add(respuestaUsuario);
        }
        return lRespuestaUsuario;
    }
    
    public static RespuestaUsuario GetById(int usuarioRespuestaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        ResultSet rs = oCon.consultar("*", "tblRespuestaUsuario", "usuarioRespuestaId="+usuarioRespuestaId);
        RespuestaUsuario respuestaUsuario = new RespuestaUsuario();
        
        while(rs.next()){
            respuestaUsuario.usuarioRespuestaId = rs.getInt(1);
            respuestaUsuario.respuestaId = rs.getInt(2);
            respuestaUsuario.usuarioId = rs.getInt(3);
            respuestaUsuario.respuesta = rs.getString(4);
        }
        return respuestaUsuario;
    }
    
    public static int Insert(RespuestaUsuario respuestaUsuario) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        int resp = oCon.agregar("Insert into tblRespuestaUsuario(respuestaId, usuarioId, respuesta)"
            + " values("+respuestaUsuario.respuestaId+","+respuestaUsuario.usuarioId+",'"
            +respuestaUsuario.respuesta+"')");
        return resp;
    }
    
    public static int Remove(int usuarioRespuestaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        return oCon.eliminar("tblRespuestaUsuario", "usuarioRespuestaId="+usuarioRespuestaId);
    }
}
