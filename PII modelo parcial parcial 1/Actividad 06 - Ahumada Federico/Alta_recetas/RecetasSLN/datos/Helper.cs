using RecetasSLN.dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace RecetasSLN.datos
{
    internal class Helper
    {
        private SqlCommand comando = new SqlCommand();
        private SqlConnection conexion = new SqlConnection(Properties.Resources.CadenaConexion);

        private void Config_Comando_SP(string sp)
        {
            
            comando.Connection = conexion;
            comando.CommandText = sp;
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            
        }

        public DataTable Consultar_SP(string sp)
        {
            DataTable tabla = new DataTable();
            conexion.Open();
            Config_Comando_SP(sp);
            tabla.Load(comando.ExecuteReader());
            conexion.Close();
            return tabla;

        }



        // PARA REALIZAR EL ALTA DE RECETA MODIFIQUE EL STORE PROCEDURE Y 
        // AGREGUE EL PARAMETRO DE SALIDA EN EL SCRIPT SQL
        // Y CREE UN STORE PROCEDURE "SP_PROXIMO"


        public bool Alta_Receta(Receta receta)
        {
            bool respuesta = true;
            SqlTransaction transaccion = null;

            try
            {
                conexion.Open();
                transaccion = conexion.BeginTransaction();
                SqlCommand cmdReceta = new SqlCommand("SP_INSERTAR RECETA", conexion, transaccion);
                cmdReceta.CommandType = CommandType.StoredProcedure;
                cmdReceta.Parameters.AddWithValue("@tipo_receta", receta.TipoReceta);
                cmdReceta.Parameters.AddWithValue("@nombre", receta.Nombre);
                cmdReceta.Parameters.AddWithValue("@cheff", receta.Cheff);

                SqlParameter param = new SqlParameter("@id_receta", SqlDbType.Int);
                param.Direction = ParameterDirection.Output;
                cmdReceta.Parameters.Add(param);
                cmdReceta.ExecuteNonQuery();

                int idReceta = Convert.ToInt32(param.Value);

                foreach (Detalle_Receta item in receta.Detalles)
                {
                    SqlCommand cmdDetalle = new SqlCommand("SP_INSERTAR_DETALLE", conexion, transaccion);
                    cmdDetalle.CommandType = CommandType.StoredProcedure;
                    cmdDetalle.Parameters.AddWithValue("@id_receta", idReceta);
                    cmdDetalle.Parameters.AddWithValue("@id_ingrediente", item.Ingrediente.IngredienteId);
                    cmdDetalle.Parameters.AddWithValue("@cantidad", item.Cantidad);
                    
                }
                transaccion.Commit();



            }
            catch (Exception)
            {
                if (transaccion!=null)
                {
                    transaccion.Rollback();
                }
                
                
                respuesta = false;
            }
            finally
            {
                if (conexion != null && conexion.State == ConnectionState.Open)
                {
                    conexion.Close();
                }
            }
            return respuesta;
        }

        
        public int Proximo()
        {
            conexion.Open();
            SqlCommand comando = new SqlCommand("SP_PROXIMO", conexion);
            comando.CommandType = CommandType.StoredProcedure;
            SqlParameter param = new SqlParameter();
            param.ParameterName = "@next";
            param.Direction = ParameterDirection.Output;
            param.DbType = DbType.Int32;
            comando.Parameters.Add(param);
            comando.ExecuteNonQuery();
            conexion.Close();            
            return (int)param.Value;

        }











    }
}
