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
            <li><h2><a href="amortizacao-constante.jsp" >Amortização Constante</a></h2></li>
            <p>O sistema de amortização constante (SAC) é uma forma de amortização de um empréstimo por prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.</p>
            <li><h2><a href="amortizacao-americana.jsp" >Amortização Americana</a></h2></li>
            <p>Tabela Price, também chamado de sistema francês de amortização, é um método usado em amortização de empréstimo cuja principal característica é apresentar prestações (ou parcelas) iguais. O método foi apresentado em 1771 por Richard Price em sua obra "Observações sobre Pagamentos Remissivos" (em inglês: Observations on Reversionary Payments).</p>
            <li><h2><a href="tabela-price.jsp" >Tabela de Price</a></h2></li>   
            <p>O Sistema Americano de Amortização é um tipo de quitação de empréstimo que favorece aqueles que desejam pagar o valor principal através de uma única parcela, porém os juros devem ser pagos periodicamente ou, dependendo do contrato firmado entre as partes, os juros são capitalizados e pagos junto ao valor principal.</p>
        </ol>
        <br>
        <hr size="3" style="background-color: black;border-color: black"/>
        <h1>Integrantes</h1>
        <ul>
	<li>Antonio Carlos Soares Junior</li>
	<li>Rodrigo Chiriberto Matos</li>
	<li>Felipe Borreli Vieira</li>
	<li>Luccas Matheus Elias Neves</li>
	<li>Carlos Eduardo dos Santos</li>
        </ul>
        
    </body>
</html>
