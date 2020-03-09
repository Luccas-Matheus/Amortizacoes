<%-- 
    Document   : amortizacao-constante
    Created on : 05/03/2020, 15:30:36
    Author     : Luccas Matheus Elias Neves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <% String PageTitle = "Amortização Constante"; %>
        <% String action = "amortizacao-constante.jsp"; %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= PageTitle %></title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <%@include file="WEB-INF/jspf/form.jspf" %>
            <%DecimalFormat formato = new DecimalFormat("#.##");%>
            
            <% try {
                
                double juros = 0, amortizacao = 0, totalAmortizado = 0, totalJuros = 0, totalPrestacao = 0;
                Double valor = Double.parseDouble(request.getParameter("valor"));
                Double parcelas = Double.parseDouble(request.getParameter("parcelas"));
                Double taxa = Double.parseDouble(request.getParameter("juros")) / 100;
                amortizacao = valor / parcelas; %>
                
            <%if((valor > 0) && (parcelas > 0) && (taxa > 0)){%>
               
                    <table border="1">
                        <tr>
                            <th>Mês</th>
                            <th>Prestação</th>
                            <th>Juros</th>
                            <th>Amortização</th>
                            <th>Saldo Devedor</th>
                            
                           <tr>
                            <td>0</td>
                            <td>-</td>
                            <td>-</td>
                            <td>-</td>
                            <td><%=valor%></td>
                           </tr>
                           
                           <%for (int i = 1; i <= parcelas && valor > 0; i++) {%>
                           <tr>
                               
                <td><%=i%></td>
                <%parcelas = amortizacao + (valor*taxa);%>
                <td><%=formato.format(parcelas)%></td>
                <%totalPrestacao = parcelas + totalPrestacao;
                    juros = valor * taxa;
                    totalJuros = juros + totalJuros;
                    totalAmortizado = amortizacao + totalAmortizado;%>
                    
                <td><%=formato.format(juros)%></td>
                <td><%=formato.format(amortizacao)%></td>
                <%valor = valor - amortizacao;%>
                <td><%=formato.format(valor)%></td>              
                </tr>
            <%}%>
            <tr>               
                <td> Total </td>
                <td><%=formato.format(totalPrestacao)%></td>
                <td><%=formato.format(totalJuros)%></td>
                <td><%=formato.format(totalAmortizado)%></td>
                <td>  -  </td>
            </tr>               
       </table>
            <%}
            }   catch(Exception e) {
                ;
            }
            %>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>    
        </div>
    </body>
</html>