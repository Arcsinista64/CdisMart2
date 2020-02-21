using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace CdisMart_DAL
{
    public class UserDAL
    {

        CdisMartEntities modelo;

        public UserDAL()
        {
            modelo = new CdisMartEntities();
        }
        public DataTable consultarUsuario(string nombre, string contraseña)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_consultarUsuario";
            command.Connection = connection;

            command.Parameters.AddWithValue("pNombre", nombre);
            command.Parameters.AddWithValue("pContraseña", contraseña);

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtUsuario = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtUsuario);

            connection.Close();

            return dtUsuario;
        }
        public DataTable consultarUsuario(int IdUsuario)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_consultarUsuarioporID";
            command.Connection = connection;

            command.Parameters.AddWithValue("pIdUsuario", IdUsuario);

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtUsuario = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtUsuario);

            connection.Close();

            return dtUsuario;
        }
        public DataTable consultarUsuarios()
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_consultarUsuarios";
            command.Connection = connection;


            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtUsuario = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtUsuario);

            connection.Close();

            return dtUsuario;
        }
        public DataTable consultarUsuarioDuplicado(string nombre)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_consultarUsuarioDuplicado";
            command.Connection = connection;

            command.Parameters.AddWithValue("pNombre", nombre);

            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable dtUsuario = new DataTable();

            connection.Open();

            adapter.SelectCommand = command;
            adapter.Fill(dtUsuario);

            connection.Close();

            return dtUsuario;
        }
        public Users consultarUsuario(string pUsuario)
        {
            var usuario = (from mUsuario in modelo.Users
                           where mUsuario.UserName == pUsuario
                           select mUsuario).FirstOrDefault();
            return usuario;
        }
        public void altaUsuario(string nombreCompleto, string correoElectronico, string nombreUsuario, string contraseña)
        {

            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_agregarUsuario";
            command.Connection = connection;

            command.Parameters.AddWithValue("pNombreCompleto", nombreCompleto);
            command.Parameters.AddWithValue("pCorreoElectronico", correoElectronico);
            command.Parameters.AddWithValue("pNombreUsuario", nombreUsuario);
            command.Parameters.AddWithValue("pContraseña", contraseña);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();

        }

    }
}
