<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="creacion_subasta.aspx.cs" Inherits="CdisMart.Vistas.creacion_subasta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="col-md-12" >
            <asp:Label style="float:right;" ID="lblUsuarioActivo" runat="server" Text=""></asp:Label>
        </div>
    <hr />
    <div class="col-md-12">
            <div class="form-group">
              <label class=" " for="txtNombreProducto">Nombre del producto:</label>  
              <div class="">
                    <asp:TextBox ID="txtNombreProducto" runat="server" MaxLength="50" placeholder="Marca, Modelo" class="form-control input-md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvProducto" runat="server" ErrorMessage="Requerido" ControlToValidate="txtNombreProducto" ValidationGroup="vlg1"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="rfvnombreproducto" runat="server" ErrorMessage="Error. Ingrese nombre alfabètico (Max. 50 caracteres)." ControlToValidate="txtNombreProducto" ValidationExpression="^[a-zA-Z0-9]+(\s*[a-zA-Z]*)*[a-zA-Z]$" ValidationGroup="vlg1" Display="Dynamic"></asp:RegularExpressionValidator>
                    
              </div>
            </div>
            <!-- Text input-->
            <div class="form-group">
              <label class=" " for="txtDescripcionProducto">Descripcion del producto:</label>  
              <div class="">
                  <asp:TextBox ID="txtDescripcionProducto" runat="server" MaxLength="100" placeholder="RAM, Almacenamiento, Componentes" class="form-control input-md"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ErrorMessage="Requerido" ControlToValidate="txtDescripcionProducto" ValidationGroup="vlg1"></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator ID="rfvDescripcionProducto" runat="server" ErrorMessage="Error. Ingrese nombre alfabètico (Max. 100 caracteres)." ControlToValidate="txtDescripcionProducto" ValidationExpression="^[a-zA-Z0-9]+(\s*[a-zA-Z]*)*[a-zA-Z]$" ValidationGroup="vlg1" Display="Dynamic"></asp:RegularExpressionValidator>
                  
              
              </div>
            </div>

        <!-- Text input-->
            <div class="form-group">
              <label class=" " for="txtFechaInicio">Fecha de inicio:</label>  
              <div class="inline" >
                  <asp:TextBox ID="txtFechaInicio" runat="server" placeholder="DD-MM-YYYY" class="form-control input-md"></asp:TextBox>
                  <asp:TextBox ID="txtBoxHorasInicio" runat="server" placeholder="HH" class="form-control input-md"></asp:TextBox>
                  <asp:TextBox ID="txtBoxMinutosInicio" runat="server" placeholder="mm" class="form-control input-md"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvFechaInicio" runat="server" ErrorMessage="Requerido" ControlToValidate="txtFechaInicio" ValidationGroup="vlg1"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="CompareValidator1" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtFechaInicio" ValidationGroup="vlg1" ErrorMessage="Error. Ingrese formato: (dd/mm/yyyy)." Display="Dynamic"></asp:CompareValidator>
                  <asp:RangeValidator ID="rvtxtHorasInicio" MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="Ingrese una hora valida. Considere formato 24 hrs." ControlToValidate="txtBoxHorasInicio" ValidationGroup="vlg1"></asp:RangeValidator>
                  <asp:RangeValidator ID="rvtxtMinutosInicio" MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="Ingrese minutos válidos." ControlToValidate="txtBoxMinutosInicio" ValidationGroup="vlg1"></asp:RangeValidator>
               </div>
            </div>

        <!-- Text input-->
            <div class="form-group">
              <label class=" " for="txtFechaFin">Fecha de finalización:</label>  
              <div class="">
                  <asp:TextBox ID="txtFechaFin" runat="server" placeholder="DD-MM-YYYY" class="form-control input-md"></asp:TextBox>
                  <asp:TextBox ID="txtBoxHorasFin" runat="server" placeholder="HH" class="form-control input-md"></asp:TextBox>
                  <asp:TextBox ID="txtBoxMinutosFin" runat="server" placeholder="mm" class="form-control input-md"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="rfvFechaFin" runat="server" ErrorMessage="Requerido" ControlToValidate="txtFechaFin" ValidationGroup="vlg1"></asp:RequiredFieldValidator>
                  <asp:CompareValidator ID="cv_rfvFechaFin" runat="server" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtFechaFin" ValidationGroup="vlg1" ErrorMessage="Error. Ingrese formato: (dd/mm/yyyy hh:mm)." Display="Dynamic"></asp:CompareValidator>
                  <asp:RangeValidator ID="rvtxtHorasFin" MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="Ingrese una hora valida. Considere formato 24 hrs." ControlToValidate="txtBoxHorasInicio" ValidationGroup="vlg1"></asp:RangeValidator>
                  <asp:RangeValidator ID="rvtxtMinutosFin" MinimumValue="0" MaximumValue="23" runat="server" ErrorMessage="Ingrese minutos válidos." ControlToValidate="txtBoxMinutosInicio" ValidationGroup="vlg1"></asp:RangeValidator>
              </div>

            </div>


            

            <asp:Button ID="btnAgregarSubasta" runat="server" Text=" Agregar " OnClick="btnAgregarSubasta_Click" ValidationGroup="vlg1"/>
        </div>
        

        <script type="text/javascript">

            $(document).ready(function () {

                $("#MainContent_txtFechaInicio").datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2020:2030",
                        dateFormat: "dd-mm-yy"
                    });

                $("#MainContent_txtFechaFin").datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2020:2030",
                        dateFormat: "dd-mm-yy"
                    });

                $(".lista").chosen();

            });

            var manager = Sys.WebForms.PageRequestManager.getInstance();

            manager.add_endRequest(function () {

                $("#MainContent_txtFechaInicio").datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2020:2030",
                        dateFormat: "dd-mm-yy"
                    });

                $("#MainContent_txtFechaFin").datepicker(
                    {
                        changeMonth: true,
                        changeYear: true,
                        yearRange: "2020:2030",
                        dateFormat: "dd-mm-yy"
                    });

                $(".lista").chosen();

            });

    </script>

</asp:Content>
