using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Dapper;
namespace proyectoFinalDev.Models
{
    public static class BD
    {   
        private static string _connectionString =  @"Server= A-LUM-14; DataBase=papeleraVipDatabase;Integrated Security=false; Trusted_Connection=True;";

        private static List<Producto> _ListaProducto = new List<Producto> ();
       // private static List<Especialidad> _ListaEspecialidad = new List<Especialidad> ();

        public static List<Producto> ListaProductosDestacados(){
            List<Producto> ListaProductosDestacados = new List<Producto> ();
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from productos WHERE destacado = 1";
                ListaProductosDestacados = db.Query<Producto>(sql).ToList();
            }
            return ListaProductosDestacados;
        }

       public static Producto ConsultaProducto(int idProducto){
            Producto UnProducto = null;
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from productos WHERE idProducto = @pidProducto";
                UnProducto = db.QueryFirstOrDefault<Producto>(sql, new{pidProducto = idProducto});
            }
            return UnProducto;
        }


        /*public static Especialidad ConsultaEspecialidad(int IdEspecialidad){
            Especialidad UnaEspecialidad = null;
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from Especialidades WHERE IdEspecialidad = @pIdEspecialidad";
                UnaEspecialidad = db.QueryFirstOrDefault<Especialidad>(sql, new{pIdEspecialidad = IdEspecialidad});
            }
            return UnaEspecialidad;
        }

        public static List<CursosConEspecialidad> ListarCursos(int IdEspecialidad){
        
            List<CursosConEspecialidad> ListaCurso = new List<CursosConEspecialidad> ();
            string sql;
            if(IdEspecialidad==-1){
                sql="select Cursos.IdCurso, Cursos.Nombre, Cursos.Descripcion, Cursos.Imagen, Cursos.UrlCurso, Cursos.MeGusta, Cursos.NoMeGusta, Especialidades.Nombre as NombreEspecialidad, Especialidades.Materia, Especialidades.IdEspecialidad from Especialidades inner join Cursos on Especialidades.IdEspecialidad = Cursos.IdEspecialidad";
                using(SqlConnection db = new SqlConnection(_connectionString)){
                ListaCurso  = db.Query<CursosConEspecialidad>(sql).ToList();
                }
            }
            else{
                sql="select Cursos.IdCurso,Cursos.Nombre, Cursos.Descripcion, Cursos.Imagen, Cursos.UrlCurso, Cursos.MeGusta, Cursos.NoMeGusta, Especialidades.Nombre as NombreEspecialidad, Especialidades.Materia, Especialidades.IdEspecialidad from Especialidades inner join Cursos on Especialidades.IdEspecialidad = Cursos.IdEspecialidad WHERE Cursos.IdEspecialidad=@pIdEspecialidad " ; 
                using(SqlConnection db = new SqlConnection(_connectionString)){
                    ListaCurso = db.Query<CursosConEspecialidad>(sql, new{pIdEspecialidad = IdEspecialidad}).ToList();
                }
            }
            return ListaCurso;
        }
      
      
        public static List<Especialidad> ListaEspecialidad(){
            List<Especialidad> ListaEspecialidad = new List<Especialidad> ();
            using(SqlConnection db = new SqlConnection(_connectionString)){
                string sql="SELECT * from Especialidades";
                ListaEspecialidad = db.Query<Especialidad>(sql).ToList();
            }
            return ListaEspecialidad;
        }

        public static void ProductoNuevo(string nombre, string descripcion, string foto, string marca, float precio, int stock, bool destacado){
            string sql="Insert into productos(nombre, descripcion, foto, marca, precio, stock, destacado) values(@pnombre, @pdescripcion, @pfoto, @pmarca, @pprecio, @pstock, @pdestacado ) ";
            using(SqlConnection db = new SqlConnection(_connectionString)){
             db.Execute(sql, new{pnombre=nombre,pdescripcion=descripcion,pfoto=foto,pmarca=marca,pprecio=precio,pstock=stock,pdestacado=destacado});
            } 
        } 


        public static void Calificar(int IdCurso, bool calificacion){
            string sql=null;
            if(calificacion==true){
                sql="UPDATE Cursos SET MeGusta=MeGusta+1 WHERE IdCurso=@pIdCurso";
            }
            if(calificacion==false){
                sql="UPDATE Cursos SET NoMeGusta=NoMeGusta+1 WHERE IdCurso=@pIdCurso";
            }
            using(SqlConnection db = new SqlConnection(_connectionString)){
                db.Execute(sql, new{pIdCurso = IdCurso});
            }
        }
*/


    }
        


}

