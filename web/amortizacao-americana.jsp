<%-- 
    Document   : amortizacao-americana
    Created on : 05/03/2020, 15:31:02
    Author     : lucca
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% String PageTitle = "Amortização Americana"; %>
        <% String action = "amortizacao-americana.jsp"; %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= PageTitle %></title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <%@include file="WEB-INF/jspf/form.jspf" %>
            <% try{
                Double valor = Double.parseDouble(request.getParameter("valor"));
                Integer parcelas = Integer.parseInt(request.getParameter("parcelas"));
                Double juros = Double.parseDouble(request.getParameter("juros"));
                if((valor > 0) && (parcelas > 0) && (juros > 0)){
                     out.println("<p> Valor: R$ " + valor + "</p>");
                     out.println("<p> Parcelas: " + parcelas + "</p>");
                     out.println("<p> Juros: " + juros + "%</p>");
                }
            } catch(Exception e) {
                ;
            }
            %>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>
        </div>
    </body>
</html>
