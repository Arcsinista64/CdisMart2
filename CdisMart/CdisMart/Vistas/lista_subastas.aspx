<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="lista_subastas.aspx.cs" Inherits="CdisMart.Vistas.lista_subastas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-md-12" >
            <asp:Label style="float:right;" ID="lblUsuarioActivo" runat="server" Text=""></asp:Label>
        </div>
    <hr />
    
    <input class="form-control mr-md-4" style="margin:auto;" id="searchField" type="text" placeholder="Filtro por descripcion...">

    <hr />

    <asp:GridView ID="grd_subastas" CssClass="table table-striped" AutoGenerateColumns = "false" runat="server" OnRowCommand="grd_subastas_RowCommand">
        
        <Columns >

            

            <asp:BoundField  HeaderText = "# de Subasta" DataField = "AuctionId"/>
            <asp:HyperLinkField HeaderText = "Nombre de Producto" DataTextField = "ProductName" 
                                datatextformatstring="{0:c}"
                                datanavigateurlfields="AuctionId"
                                datanavigateurlformatstring="~/Vistas/detalles.aspx?pIdSubasta={0}" />
            <asp:BoundField HeaderText = "Descripción" DataField = "Description"/>
            <asp:BoundField HeaderText = "Fecha de inicio" DataField = "StartDate" DataFormatString="{0:dd/MM/yyyy  H:mm}"/>
            <asp:BoundField HeaderText = "Fecha de finalización" DataField = "EndDate" DataFormatString="{0:dd/MM/yyyy  H:mm}"/>
        <%--    <asp:BoundField HeaderText = "Oferta más alta" DataField = "HighestBid"/>
            <asp:BoundField HeaderText = "Usuario de tal" DataField = "Winner"/>
            <asp:BoundField HeaderText = "Usuario de tal" DataField = "NombreUsuarioSubasta"/>--%>

            

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:ImageButton  ID ="btnHistorial" CommandName="Historial" CommandArgument ='<%#Eval("AuctionId") %>' Height="25px" Width="25px" ImageUrl="~/imagenes/historial.png" runat ="server"/>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>

    </asp:GridView>

    
</asp:Content>
