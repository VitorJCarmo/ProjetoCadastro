<%@page import="java.util.Arrays"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="app.Cliente"%>
<%@page import="app.BD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cliente - JSP Page</title>
    </head>
    <body>
        <h1>Cliente</h1>
        <%
            try{

            
         if (request.getParameter("enviar")!=null){

            String nome = request.getParameter("nome");
            String cpf = request.getParameter("cpf");
            String rg = request.getParameter("rg");
            String email = request.getParameter("email");
            String telefone = request.getParameter("telefone");
            String endereco = request.getParameter("endereço");
            
            Cliente c= new Cliente();
            c.setNome(nome);
            c.setCpf(cpf);
            c.setRg(rg);
            c.setEmail(email);
            c.setTelefone(telefone);
            c.setEndereço(endereco);
            
            BD.getClientes().add(c);
            
         }else if(request.getParameter("remove")!=null){
             int i=Integer.parseInt(request.getParameter("i"));
            BD.getClientes().remove(i);
          }

        } catch(Exception ex){ %>
    <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
       <% }  %>
        <fieldset>
            
            </table>
            <legend>Novo Cliente</legend>
            <form name="principal">
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
        
        <h2>Listagem</h2>
            <table border="1">
                <tr>
                    <th>Indice</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Exclusao</th>
                    <th>Edição</th>
                </tr>
                
                <% for(int i=0; i<BD.getClientes().size();i++){ %>
                <% Cliente c = BD.getClientes().get(i);%>
                <tr>
                    <td><%=i%></td>
                    <td><%=c.getNome()%></td>
                    <td><%=c.getCpf()%></td>
                    <td><%=c.getRg()%></td>
                    <td><%=c.getEmail()%></td>
                    <td><%=c.getTelefone()%></td>
                    <td><%=c.getEndereço()%></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%=i%>"/>
                            <input type="submit" name="remove" value="Excluir"/>
                        </form>
                    </td>
                    <td>
                        <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input type="submit" name="edit" value="Editar"/>
                        </form>
                    </td>
                </tr>
                <%}%>
                  </table>
                <%if(request.getParameter("edit")!=null){ 
                int i=Integer.parseInt(request.getParameter("i"));
                Cliente c = BD.getClientes().get(i);%>
                          <fieldset>
            <legend>Editar Cliente</legend>
            <form>
                Nome:<br>
                <input type="text" name="novonome" value="<%=c.getNome()%>"/><br/>
                Cpf:<br>
                <input type="text" name="novocpf" value="<%=c.getCpf()%>"/><br/>
                Rg:<br>
                <input type="text" name="novorg" value="<%=c.getRg()%>"/><br/>
                Email:<br>
                <input type="text" name="novoemail" value="<%=c.getEmail()%>"/><br/>
                Telefone:<br>
                <input type="text" name="novotelefone" value="<%=c.getTelefone()%>"/><br/>
                 Endereço:<br>
                <input type="text" name="novoendereço" value="<%=c.getEndereço()%>"/><br/>
                <br>
                <input type="submit" name="alterar" value="alterar"/>
            </form>
        </fieldset>
          
           <%
               if(request.getParameter("alterar")!=null){
             BD.getClientes().remove(i);
            String nome = request.getParameter("novonome");
            String cpf = request.getParameter("novocpf");
            String rg = request.getParameter("novorg");
            String email = request.getParameter("novoemail");
            String telefone = request.getParameter("novotelefone");
            String endereço = request.getParameter("novoendereço");
            c.setNome(nome);
            c.setCpf(cpf);
            c.setRg(rg);
            c.setEmail(email);
            c.setTelefone(telefone);
            c.setEndereço(endereço);
            
            BD.getClientes().add(c);
               }
         }%>
        
    </body>
</html>
