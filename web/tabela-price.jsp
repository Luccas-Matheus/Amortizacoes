<%-- 
    Document   : tabela-price
    Created on : 05/03/2020, 15:31:52
    Author     : lucca
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% String PageTitle = "Tabela Price"; %>
        <% String action = "tabela-price.jsp"; %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= PageTitle %></title>
               
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
            <%@include file="WEB-INF/jspf/menu.jspf" %>
            <%@include file="WEB-INF/jspf/form.jspf" %>
            <% try{
                double valor = Double.parseDouble(request.getParameter("valor"));
                int parcelas = Integer.parseInt(request.getParameter("parcelas"));
                double juros = Double.parseDouble(request.getParameter("juros"));
                if((valor > 0) && (parcelas > 0) && (juros > 0)){%>
                    <table border="1">
                        <tr>
                            <th>Mês</th>
                            <th>Prestação</th>
                            <th>Juros</th>
                            <th>Amortização</th>
                            <th>Saldo Devedor</th>
                        </tr>
            
            <%
                juros/=100;
                double prest, vl_juros = 0, vl_amort = 0, acum_prest = 0, acum_juros = 0, acum_amort = 0;
                DecimalFormat df = new DecimalFormat("#.00");
                prest = valor*((Math.pow((1+juros), parcelas)*juros)/((Math.pow((1+juros), parcelas)-1)));
                /*prest = valor*(juros/(1-(Math.pow((1+juros), -parcelas))));*/
                
                for(int i=0;i<=parcelas+2;i++){ 
                    if(i==0){%>
                        <tr align="center">
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td><%=valor%></td>
                        </tr>
                    <%}
                    
                    else if(i<parcelas+1){
                        vl_juros = juros*valor;
                        vl_amort = prest - vl_juros;
                        valor-=prest;
                        acum_prest += prest;
                        acum_juros += vl_juros;
                        acum_amort += vl_amort;%>
                        <tr align="center">
                            <td><%=i%></td>
                            <td><%=df.format(prest)%></td>
                            <td><%=df.format(vl_juros)%></td>
                            <td><%=df.format(vl_amort)%></td>
                            <td><%=df.format(valor)%></td>
                        </tr>
                    <%} else if(i==parcelas+1){%>
                        <tr align="center">
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                        </tr>
                    <%} else if(i==parcelas+2){%>
                        <tr align="center">
                            <td>TOTAL</td>
                            <td><%=df.format(acum_prest)%></td>
                            <td><%=df.format(acum_juros)%></td>
                            <td><%=df.format(acum_amort)%></td>
                            <td>&nbsp</td>
                        </tr>
                    <%}
                }%>
        </table>

                <%} 
            }
                catch(Exception e) {
                ;
            }
            %>
            <%@include file="WEB-INF/jspf/rodape.jspf" %>
        </div>
    </body>
</html>