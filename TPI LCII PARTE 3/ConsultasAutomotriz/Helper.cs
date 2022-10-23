﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsultasAutomotriz
{
    internal class Helper
    {
        private SqlConnection conexion = new SqlConnection("Data Source=DESKTOP-R46G6B5\\SQLEXPRESS;Initial Catalog=AUTOMOTRIZ;Integrated Security=True");
        private SqlCommand comando = new SqlCommand();

        public DataTable Consultar(string NombreSP)
        {
            DataTable tabla = new DataTable();
            conexion.Open();
            SqlCommand cmd = new SqlCommand(NombreSP, conexion);
            cmd.CommandType = CommandType.StoredProcedure;
            tabla.Load(cmd.ExecuteReader());
            conexion.Close();
            return tabla;
        }
    }
}
