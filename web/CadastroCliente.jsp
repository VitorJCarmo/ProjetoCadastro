
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

            String endereco = request.getParameter("endereco");

            

            Cliente c= new Cliente();

            c.setNome(nome);

            c.setCpf(cpf);

            c.setRg(rg);

            c.setEmail(email);

            c.setTelefone(telefone);

            c.setEndereco(endereco);

            

            BD.getClientes().add(c);

            

         }
         else if(request.getParameter("alterar1")!=null){
             int i = 0;
             Cliente c = BD.getClientes().get(0);
            c.editarCliente(request.getParameter("nome1"), request.getParameter("cpf1"), request.getParameter("rg1"), request.getParameter("email1"), request.getParameter("telefone1"), request.getParameter("endereco1"));
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

                <input type="text" name="nome" placeholder="Insira seu nome"/><br/>

                Cpf:<br>

                <input type="text" name="cpf" placeholder="Insira seu CPF"/><br/>

                Rg:<br>

                <input type="text" name="rg" placeholder="Insira seu RG"/><br/>

                Email:<br>

                <input type="text" name="email" placeholder="Insira seu E-Mail"/><br/>

                Telefone:<br>

                <input type="text" name="telefone" placeholder="Insira seu Telefone" /><br/>

                 Endereço:<br>

                <input type="text" name="endereco" placeholder="Insira seu Endereço"/><br/>

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

                    <td><%=c.getEndereco()%></td>

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

                <%
                    
                    if(request.getParameter("edit")!=null){ 

                int i=Integer.parseInt(request.getParameter("i"));

                Cliente c = BD.getClientes().get(i);%>

                          <fieldset>

            <legend>Editar Cliente</legend>

            <form>

                Nome:<br>

                <input type="text" name="nome1" value="<%=c.getNome()%>"/><br/>

                Cpf:<br>

                <input type="text" name="cpf1" value="<%=c.getCpf()%>"/><br/>

                Rg:<br>

                <input type="text" name="rg1" value="<%=c.getRg()%>"/><br/>

                Email:<br>

                <input type="text" name="email1" value="<%=c.getEmail()%>"/><br/>

                Telefone:<br>

                <input type="text" name="telefone1" value="<%=c.getTelefone()%>"/><br/>

                 Endereço:<br>

                <input type="text" name="endereco1" value="<%=c.getEndereco()%>"/><br/>

                <br>

                <input type="submit" name="alterar1" value="Editar"/>
               <%}%>
            </form>

        </fieldset>  

    </body>

</html>