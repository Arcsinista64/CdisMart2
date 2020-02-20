using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CdisMart_BLL;
using System.Data;
using System.Data.SqlClient;

namespace CdisMart.Vistas
{
    public partial class creacion_subasta : Tema, IAcceso
    {
        

        #region EVENTOS
        public bool sesionIniciada()
        {
            {
                if (Session["Usuario"] != null)
                {
                    return true;
                }
                else
                {
                    return false;

                }
            }
        }
        public string usuarioActivo()
        {
            string cadena2 = Session["nombreUsuario"].ToString();
            return cadena2;
        }
        public int usuarioActivoID()
        {
            int cadena1 = int.Parse(Session["Id_Usuario"].ToString());
            return cadena1;
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (sesionIniciada())
                {
                    lblUsuarioActivo.Text = "Usuario activo: "+usuarioActivo();

                }
                else
                {
                    Response.Redirect("~/Login.aspx");
                }
            }
        }

        #endregion

        #region METODOS
        protected void btnAgregarSubasta_Click(object sender, EventArgs e)
        {

            try
            {
                agregarSubasta();
                ScriptManager.RegisterStartupScript(this, typeof(Page), "Registro", "alert('Subasta registrada exitosamente.')", true);

            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, typeof(Page), "AlertPass", "alert('" + ex.Message + "')", true);
            }



        }

        public void agregarSubasta()
        {
            int IdUsuario = usuarioActivoID();

            SubastaBLL subasta = new SubastaBLL();

            string nombreProducto = txtNombreProducto.Text;
            string descripcionProducto = txtDescripcionProducto.Text;
            DateTime fechaInicio = Convert.ToDateTime(txtFechaInicio.Text +" "+ DateTime.Now.ToString(txtBoxHorasInicio.Text+":"+txtBoxMinutosInicio.Text));
            DateTime fechaFinal = Convert.ToDateTime(txtFechaFin.Text + " " + DateTime.Now.ToString(txtBoxHorasFin.Text + ":" + txtBoxMinutosFin.Text));
            int creadordeSubasta = IdUsuario;

            subasta.agregarSubasta(nombreProducto, descripcionProducto, fechaInicio, fechaFinal, creadordeSubasta);
            
        }

        #endregion







    }
}