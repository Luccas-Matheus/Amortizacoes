<%-- 
    Document   : home
    Created on : 07/03/2020, 15:36:20
    Author     : yBlackSpider
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% String PageTitle = "Índice - Amortizações"; %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= PageTitle %></title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <%--<%@include file="WEB-INF/jspf/menu.jspf" %>--%>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>
        </div>
        <ol type="1">
            <li><a href="amortizacao-constante.jsp" >Amortização Constante</a></li>
            <li><a href="amortizacao-americana.jsp" >Amortização Americana</a></li>
            <li><a href="tabela-price.jsp" >Tabela de Price</a></li>   
        </ol>
    </body>
</html>
