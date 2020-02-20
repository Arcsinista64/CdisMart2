using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;

namespace CdisMart_DAL
{
    public class SubastaDAL
    {


        CdisMartEntities modelo;

        public SubastaDAL()
        {
            modelo = new CdisMartEntities();
        }

        public List<object> cargarSubastas()
        {
            var subastas = from mSubasta in modelo.Auction
                           select new
                           {
                               AuctionId = mSubasta.AuctionId,
                               Productname = mSubasta.ProductName,
                               Description = mSubasta.Description,
                               StartDate = mSubasta.StartDate,
                               EndDate = mSubasta.EndDate
                           };
            return subastas.AsEnumerable<object>().ToList();
        }
        
        public Auction cargarSubastas(int IdSubasta)
        {
            var subasta = (from mSubasta in modelo.Auction
                           where mSubasta.AuctionId == IdSubasta
                           select mSubasta).FirstOrDefault();
            return subasta;
        }

        public List<object> cargarRecordSubastas(int IdSubasta)
        {
            var subastas = from msubasta in modelo.AuctionRecord
                           where msubasta.AuctionId == IdSubasta
                           select new
                           {
                               AuctionId = msubasta.AuctionId,
                               UserId = msubasta.UserId,
                               Amount = msubasta.Amount,
                               BidDate = msubasta.BidDate
                           };
            return subastas.AsEnumerable<object>().ToList();
        }

        public List<object> cargarRecordSubastasporUserId(int IdSubasta, int IdUsuario)
        {
            var subastas = from msubasta in modelo.AuctionRecord
                           where msubasta.UserId == IdUsuario && msubasta.AuctionId == IdSubasta
                           select new
                           {
                               UserId = msubasta.UserId,
                               Amount = msubasta.Amount,
                               BidDate = msubasta.BidDate
                           };
            return subastas.AsEnumerable<object>().ToList();
        }

        
        public void actualizarWinner(int userActivo, decimal nuevaOferta, Auction pIdSubasta)
        {
            var subasta = (from mSubasta in modelo.Auction
                           where mSubasta.AuctionId == pIdSubasta.AuctionId
                           select mSubasta).FirstOrDefault();

            subasta.ProductName = pIdSubasta.ProductName;
            subasta.Description = pIdSubasta.Description;
            subasta.StartDate = pIdSubasta.StartDate;
            subasta.EndDate = pIdSubasta.EndDate;
            subasta.HighestBid = nuevaOferta;
            subasta.Winner = userActivo;
            subasta.UserId = pIdSubasta.UserId;

            modelo.SaveChanges();
        }
        public void agregarRecordSubasta(int AuctionId, int userActivo, int Amount, DateTime BidDate)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_agregarRecordSubasta";
            command.Connection = connection;

            command.Parameters.AddWithValue("pAuctionId", AuctionId);
            command.Parameters.AddWithValue("pUserID", userActivo);
            command.Parameters.AddWithValue("pAmount", Amount);
            command.Parameters.AddWithValue("pBidDate", BidDate);


            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }
        public void agregarSubasta(string nombreProducto, string descripcionProducto, DateTime fechaInicio, DateTime fechaFinal, int creadordeSubasta)
        {
            SqlConnection connection = new SqlConnection();
            connection.ConnectionString = @"Server=DESKTOP-Q82E1Q9\SQLEXPRESS;Database=CdisMart;Trusted_connection=true;";

            SqlCommand command = new SqlCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "sp_agregarSubasta";
            command.Connection = connection;

            command.Parameters.AddWithValue("pNombreProducto", nombreProducto);
            command.Parameters.AddWithValue("pDescripcionProducto", descripcionProducto);
            command.Parameters.AddWithValue("pFechaInicio", fechaInicio);
            command.Parameters.AddWithValue("pFechaFinal", fechaFinal);
            command.Parameters.AddWithValue("pUsuariodeOferta", creadordeSubasta);

            connection.Open();

            command.ExecuteNonQuery();

            connection.Close();
        }

    }
}
