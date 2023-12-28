using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TP_9___ECommerce.Models
{
    public static class BDD
    {
        private static string _connectionString = "Server=TU-SERVER; Database=TU-BDD; Trusted_Connection=True"; //PONE TUS DATOS ACÁ

        private static SqlConnection Conectar()
        {
            SqlConnection con = new SqlConnection(_connectionString);
            con.Open();
            return con;
        }

        private static bool Desconectar(SqlConnection con)
        {
            bool pudoDesconectar;
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
                pudoDesconectar = true;
            }
            else
            {
                pudoDesconectar = false;
            }
            return pudoDesconectar;
        }

        public static List<Producto> ObtenerProductos()
        {
            List<Producto> listaProductos = new List<Producto>();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Productos";
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                int idProd = Convert.ToInt32(lector["IdProducto"]);
                int idRubro = Convert.ToInt32(lector["idRubro"]);
                string titulo = lector["Titulo"].ToString();
                string descrip = lector["Descripcion"].ToString();
                int stock = Convert.ToInt32(lector["Cantidad"]);
                float importe = float.Parse(lector["Importe"].ToString());
                string imagen = lector["Imagen"].ToString();

                Producto prod = new Producto(idProd, idRubro, titulo, descrip, stock, importe, imagen);
                listaProductos.Add(prod);
            }
            BDD.Desconectar(con);
            return listaProductos;
        }

        public static List<Producto> ObtenerProductosPorRubro(int codigoRubro)
        {
            List<Producto> listaProductosPorRubro = new List<Producto>();
            SqlConnection con = BDD.Conectar();
            SqlCommand consulta = con.CreateCommand();
            consulta.CommandText = "Select * from Productos where idRubro = @idRubro";
            consulta.Parameters.AddWithValue("@idRubro",codigoRubro);
            SqlDataReader lector = consulta.ExecuteReader();
            while (lector.Read())
            {
                int idProd = Convert.ToInt32(lector["IdProducto"]);
                int idRubro = Convert.ToInt32(lector["idRubro"]);
                string titulo = lector["Titulo"].ToString();
                string descrip = lector["Descripcion"].ToString();
                int stock = Convert.ToInt32(lector["Cantidad"]);
                float importe = float.Parse(lector["Importe"].ToString());
                string imagen = lector["Imagen"].ToString();

                Producto prod = new Producto(idProd, idRubro, titulo, descrip, stock, importe, imagen);
                listaProductosPorRubro.Add(prod);
            }
            BDD.Desconectar(con);
            return listaProductosPorRubro;
        }
    }
}