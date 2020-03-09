<%-- 
    Document   : tabela-price
    Created on : 05/03/2020, 15:31:52
    Author     : lucca
--%>

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
                Double valor = Double.parseDouble(request.getParameter("valor"));
                Integer parcelas = Integer.parseInt(request.getParameter("parcelas"));
                Double juros = Double.parseDouble(request.getParameter("juros"));
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
                for(int i=0;i<=parcelas+2;i++){ 
                    if(i==0){%>
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td><%=valor%></td>
                        </tr>
                    <%}
                    
                    else if(i==parcelas+1){%>
                        <tr>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                            <td>&nbsp</td>
                        </tr>
                    <%} else{%>
                        <tr>
                            <td><%=i%></td>
                            <td><%=i%></td>
                            <td><%=i%></td>
                            <td><%=i%></td>
                            <td><%=i%></td>
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