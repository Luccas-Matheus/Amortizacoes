<%-- 
    Document   : amortizacao-americana
    Created on : 05/03/2020, 15:31:02
    Author     : Felipe Borreli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% String PageTitle = "Amortização Americana"; %>
        <% String action = "amortizacao-americana.jsp"; %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= PageTitle %></title>
        <%@page import="java.text.DecimalFormat"%>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <%@include file="WEB-INF/jspf/form.jspf" %>
            <%DecimalFormat formato = new DecimalFormat("#.##");%>
            <% try{
                double amortizacao = 0, totalAmortizado = 0, totalJuros = 0, totalPrestacao = 0, parcelas = 0;
                Double valor = Double.parseDouble(request.getParameter("valor"));
                Integer n_parcelas = Integer.parseInt(request.getParameter("parcelas"));
                Double juros = Double.parseDouble(request.getParameter("juros"));
                Double taxa = juros / 100;
                if((valor > 0) && (n_parcelas > 0) && (juros > 0)){%>
                    
                     <table border="1">
                        <tr>
                            <th>Mês</th>
                            <th>Prestação</th>
                            <th>Juros</th>
                            <th>Amortização</th>
                            <th>Saldo Devedor</th>
                            
                           
                           <%for (int i = 1; i < n_parcelas && valor > 0; i++) {%>
                           
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
                               
                        <td><%=n_parcelas%></td>
                        <%parcelas = amortizacao + (valor*taxa) + valor;%>
                        <td><%=formato.format(parcelas)%></td>
                        <%totalPrestacao = parcelas + totalPrestacao;
                            juros = valor * taxa;
                            totalJuros = juros + totalJuros;
                            totalAmortizado = valor;%>

                        <td><%=formato.format(juros)%></td>
                        <td><%=formato.format(totalAmortizado)%></td>
                        <%valor = valor - totalAmortizado;%>
                        <td><%=formato.format(valor)%></td>              
                        </tr>
                    <tr>               
                        <td> Total </td>
                        <td><%=formato.format(totalPrestacao)%></td>
                        <td><%=formato.format(totalJuros)%></td>
                        <td><%=formato.format(totalAmortizado)%></td>
                        <td>-</td>
                    </tr>               
               </table>
                <%}
            } catch(Exception e) {
                ;
            }
            %>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>
        </div>
    </body>
</html>
