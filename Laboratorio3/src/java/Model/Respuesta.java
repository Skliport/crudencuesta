package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Respuesta {
    
    public int respuestaId, preguntaId;
    public String respuesta;
    static Conexion oCon;
    
    public static ArrayList<Respuesta> GetAll() throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();    
        ArrayList<Respuesta> lRespuesta = new ArrayList<>();
        ResultSet rs = oCon.consultar("*", "tblRespuestas");
        
        while(rs.next()){
            Respuesta respuesta = new Respuesta();
            respuesta.respuestaId = rs.getInt(1);
            respuesta.preguntaId = rs.getInt(2);
            respuesta.respuesta = rs.getString(3);
            lRespuesta.add(respuesta);
        }
        return lRespuesta;
    }
    
    public static ArrayList<Respuesta> GetById(int respuestaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        ResultSet rs = oCon.consultar("*", "tblRespuestas", "preguntaId="+respuestaId);
        ArrayList<Respuesta> respuestas = new ArrayList<>();
        
        while(rs.next()){
            Respuesta respuesta = new Respuesta();
            respuesta.respuestaId = rs.getInt(1);
            respuesta.preguntaId = rs.getInt(2);
            respuesta.respuesta = rs.getString(3);
            respuestas.add(respuesta);
        }
        return respuestas;
    }
    
    public static int Insert(Respuesta respuesta) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        int resp = oCon.agregar("Insert into tblRespuestas(respuestaId, preguntaId, respuesta)"
            + "values(default,'"+respuesta.preguntaId+"','"+respuesta.respuesta+"')");
        return resp;
    }
    
    public static int Update(int respuestaId, String respuesta) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        int resp = oCon.agregar("UPDATE tblRespuestas SET respuesta = '"+respuesta+"' WHERE "
            + "respuestaId = '"+respuestaId+"'");
        return resp;
    }
    
    public static int Remove(int respuestaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        return oCon.eliminar("tblRespuestas", "respuestaId="+respuestaId);
    }
}
