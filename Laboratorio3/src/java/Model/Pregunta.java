package Model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Pregunta {
    
    public int preguntaId, encuestaId;
    public String preguntaTipo, pregunta;
    static Conexion oCon;
    
    public static ArrayList<Pregunta> GetAll() throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();    
        ArrayList<Pregunta> lpreguntas = new ArrayList<>();
        ResultSet rs = oCon.consultar("*", "tblPreguntas");
        
        while(rs.next()){
            Pregunta pregunta = new Pregunta();
            pregunta.preguntaId = rs.getInt(1);
            pregunta.encuestaId = rs.getInt(2);
            pregunta.preguntaTipo = rs.getString(3);
            pregunta.pregunta = rs.getString(4);
            lpreguntas.add(pregunta);
        }
        return lpreguntas;
    }
    
    public static ArrayList<Pregunta> GetById(int preguntaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        ResultSet rs = oCon.consultar("*", "tblPreguntas", "encuestaId="+preguntaId);
        ArrayList<Pregunta> preguntas = new ArrayList<>();
        
        while(rs.next()){
            Pregunta pregunta = new Pregunta();
            pregunta.preguntaId = rs.getInt(1);
            pregunta.encuestaId = rs.getInt(2);
            pregunta.preguntaTipo = rs.getString(3);
            pregunta.pregunta = rs.getString(4);
            preguntas.add(pregunta);
        }
        return preguntas;
    }
    public static ArrayList<String> GetData2(int preguntaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        String query = "select tp.encuestaId ,tp.preguntaId ,tr.respuestaId ,tr.respuesta ,count(tru.respuestaId) as Cantidad from tblRespuestaUsuario tru \n" +
                        "inner join tblRespuestas tr ON tr.respuestaId =tru.respuestaId \n" +
                        "inner join tblPreguntas tp on tp.preguntaId =tr.preguntaId \n" +
                        "where tp.encuestaId = "+preguntaId+"\n" +
                        "group by tr.respuestaId ;";
        ResultSet rs = oCon.DoQuery(query);
        ArrayList<String> data = new ArrayList<>();
        while(rs.next()){      
            String info;
            int id = rs.getInt("preguntaId");
            String i = rs.getString("respuesta");
            int b = rs.getInt("Cantidad");
            info = i+"-"+b+"-"+id;
            data.add(info);
        }
        return data;
    }
    
    public static Pregunta GetPreguntaById(int preguntaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        ResultSet rs = oCon.consultar("*", "tblPreguntas", "preguntaId="+preguntaId);
        Pregunta pregunta = new Pregunta();
        while(rs.next()){      
            pregunta.preguntaId = rs.getInt(1);
            pregunta.encuestaId = rs.getInt(2);
            pregunta.preguntaTipo = rs.getString(3);
            pregunta.pregunta = rs.getString(4);
        }
        return pregunta;
    }
    
    public static ArrayList<String> GetData3(int encuestaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();     
        String query = "select tp.encuestaId, tp.preguntaId, tr.respuestaId, tr.respuesta, count(tru.respuestaId) as "
        + "Cantidad from tblRespuestaUsuario tru " +
        "inner join tblRespuestas tr ON tr.respuestaId =tru.respuestaId " +
        "inner join tblPreguntas tp on tp.preguntaId =tr.preguntaId " +
        "where tp.encuestaId = " + encuestaId +"" +
        "group by tr.respuestaId ;";
                
        ResultSet rs = oCon.DoQuery(query);
        ArrayList<String> data = new ArrayList<>();
        
        while(rs.next()){
            String info;
            String i = rs.getString("respuesa");
            int b = rs.getInt("Cantidad");
            info = i+ "-" +b;
            data.add(info);
        }
        return data;
    }
    
    public static Pregunta GetUltimaPregunta() throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        ResultSet rs = oCon.consultar("*", "tblPreguntas ORDER BY preguntaId DESC LIMIT 1;");
        Pregunta pregunta = new Pregunta();
        
        while(rs.next()){      
            pregunta.preguntaId = rs.getInt(1);
            pregunta.encuestaId = rs.getInt(2);
            pregunta.preguntaTipo = rs.getString(3);
            pregunta.pregunta = rs.getString(4);
        }
        return pregunta;
    }
    
    public static int Insert(Pregunta pregunta) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        int resp = oCon.agregar("Insert into tblPreguntas(preguntaId, encuestaId, preguntaTipo, pregunta)"
            + " values(default,'"+pregunta.encuestaId+"','"+pregunta.preguntaTipo+"','"+pregunta.pregunta+"')");
        return resp;
    }
    
    public static int Update(int preguntaId, String pregunta) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        int resp = oCon.agregar("UPDATE tblPreguntas SET pregunta = '"+pregunta+"' WHERE "
            + "preguntaId = '"+preguntaId+"'");
        return resp;
    }
    
    public static int Remove(int preguntaId) throws ClassNotFoundException, 
        InstantiationException, IllegalAccessException, SQLException{
        
        oCon = new Conexion();
        return oCon.eliminar("tblPreguntas", "preguntaId="+preguntaId);
    }
}
