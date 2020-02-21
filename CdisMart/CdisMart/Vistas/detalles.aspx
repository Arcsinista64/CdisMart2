<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="detalles.aspx.cs" Inherits="CdisMart.Vistas.detalles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12" >
            <asp:Label CssClass="btn" style="float:right;" ID="lblUsuarioActivo" runat="server" Text=""></asp:Label>
        </div>
    <hr />

     <table class="table table-hover">
        <tr>
            <td class="table table-hover"># de Subasta: </td>
            <td class="table table-hover">
                <asp:Label CssClass="btn" ID="lblIdSubasta" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="table table-hover">Nombre del producto: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtNombreProducto" runat ="server"  Enabled ="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="table table-hover">Fecha de inicio: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtFechaInicio" runat ="server" Enabled ="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="table table-hover">Fecha de finalización: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtFechaFinalizacion" runat ="server" Enabled ="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="table table-hover">Descripción: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtDescripcion" runat ="server" Enabled ="false"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td class="table table-hover">Oferta actual más alta: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtOfertaMasAlta" runat ="server" Enabled ="false"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="table table-hover">Usuario que hizo tal oferta: </td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn" ID="txtUsuariodeOfertaMasAlta" runat ="server" Enabled ="false"></asp:TextBox>

            </td>
        </tr>

        <tr>
            <td class="table table-hover">Cantidad a ofertar:</td>
            <td class="table table-hover">
                <asp:TextBox CssClass="btn btn-secondary" ID="txtNuevaOferta" runat ="server"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="revNuevaOferta" runat="server" ValidationExpression="^[0-9]{0,10}$" ErrorMessage="Ingrese valor numerico (Max. $1,000,000)." ControlToValidate="txtNuevaOferta" ValidationGroup="vlg3" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfvNuevaOferta" runat="server" ControlToValidate="txtNuevaOferta" ErrorMessage="Requerido." ValidationGroup="vlg3"></asp:RequiredFieldValidator>

            </td>
        </tr>


        <tr>
            <td class="table table-hover"> </td>
            <td class="table table-hover">
                <asp:Button ID="btnRealizarOferta" CssClass="btn btn-block" runat ="server" Text="Ofertar" OnClick="btnRealizarOferta_Click" ValidationGroup="vlg3"></asp:Button>

            </td>
        </tr>
    </table>

</asp:Content>
