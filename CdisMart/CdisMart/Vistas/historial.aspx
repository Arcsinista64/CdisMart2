﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="historial.aspx.cs" Inherits="CdisMart.Vistas.historial" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="col-md-12" >
            <asp:Label style="float:right;" ID="lblUsuarioActivo" runat="server" Text=""></asp:Label>
        </div>
    <hr />
    
    <div class="container">

        <asp:Label ID="lblNombreProducto" runat="server" Text=""></asp:Label>
        <asp:Label ID="lblDescripcion" runat="server" Text=""></asp:Label>
        <hr />
        <asp:DropDownList class=".lista" CssClass="btn btn-secondary" AutoPostBack="true" ID="ddlUsuarios" runat="server"></asp:DropDownList>
    </div>

    <hr />
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:GridView class="table table-hover" ID="grdSubastasporID"  AutoGenerateColumns = "false" runat="server" OnRowCommand="grdSubastasporID_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText = "Usuario que realizó la oferta" DataField = "UserId"/>
                    <asp:BoundField HeaderText = "Fecha de la realización de la oferta" DataField = "BidDate"/>
                    <asp:BoundField HeaderText = "Monto de la oferta"  DataField = "Amount"/>
            
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
