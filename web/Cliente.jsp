<%-- 
    Document   : contatos
    Created on : 20/09/2017, 21:25:41
    Author     : Marjorie
--%>
<%--<%@page import="app.Contato"%>
<%@page import="app.Bd"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente - JSP Page</title>
    </head>
    <body>
        <h1>Contatos</h1>
        <%try{
         if (request.getParameter("enviar")!=null){
            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String endereço = request.getParameter("endereço");
            
            Contato c= new Contato();
            c.setNome(nome);
            c.setNome(cpf);
            c.setNome(rg);
            c.setEmail(email);
            c.setTelefone(telefone);
            c.setTelefone(endereço);
            
            Bd.getContatos().add(c);
            
         }else if(request.getParameter("remove")!=null){
             int i=Integer.parseInt(request.getParameter("i"));
            Bd.getContatos().remove(i);
        }} catch(Exception ex){ %>
    <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
       <% }  %>
        <fieldset>
            
            </table>
            <legend>Novo Contatos</legend>
            <form>
                Nome:<br>
                <input type="text" name="nome"/><br/>
                 Cpf:<br>
                <input type="text" name="cpf"/><br/>
                 Rg:<br>
                <input type="text" name="rg"/><br/>
                Email:<br>
                <input type="text" name="email"/><br/>
                Telefone:<br>
                <input type="text" name="telefone"/><br/>
                 Endereço:<br>
                <input type="text" name="endereço"/><br/>
                <br>
                <input type="submit" name="enviar" value="Adicionar"/>
            </form>
        </fieldset>
        
        <h2>Lista</h2>
            <table border="1">
                <tr>
                    <th>Indice</th>
                    <th>Nome </th>
                    <th>CPF </th>
                    <th>RG </th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>exclusao</th>
                </tr>
                
                <% for(int i=0; i<Bd.getContatos().size();i++){ %>
                <% Contato c = Bd.getContatos().get(i);%>
                <tr>
                    <td><%=i%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input type="submit" name="remove" value="Excluir"/>
                            
                        </form>
                    </td>
                </tr>
                
                
                <%}%>
        
    </body>
</html>
