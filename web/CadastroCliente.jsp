
<%@page import="java.util.Arrays"%>

<%@page import="javax.swing.JOptionPane"%>

<%@page import="app.Cliente"%>

<%@page import="app.BD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
        <%@include file="WEB-INF/jspf/header.jspf" %>

    <div class="container">
        
        <h1>Clientes</h1><br/>
        <%
            boolean t = true;
            try{
                if ( request.getParameter("enviar")!=null){
                    
                    t = true;
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

                }else if(request.getParameter("alterar1")!=null){
                    t = true;
                    int i = 0;
                    Cliente c = BD.getClientes().get(0);
                    c.editarCliente(request.getParameter("nome1"), request.getParameter("cpf1"), request.getParameter("rg1"), request.getParameter("email1"), request.getParameter("telefone1"), request.getParameter("endereco1"));
                }else if(request.getParameter("remove")!=null){
                    int i=Integer.parseInt(request.getParameter("i"));
                    BD.getClientes().remove(i);
                    if (BD.getClientes().size() == 0){
                        t = false;
                    }else{
                        t = true;
                    }
                }else if(request.getParameter("removeall") != null){
                    int rt = BD.getClientes().size() - 1;
                    for (int r = rt; r >= 0; r--){
                        BD.getClientes().remove(r);
                    }
                    t = false;
                }
            }catch(Exception ex){ %>
                <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
            <%}%>
            
            <!--Tabela de Clientes-->
            <%if (BD.getClientes().size() != 0 && request.getParameter("novo") == null && request.getParameter("edit") == null){%>
            <h2>Clientes Cadastrados</h2><br/>
            <table align="center" border="1">
                <tr>
                    <th>Indice</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Exclusão</th>
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
            <br/>
            <form>
                <input type="submit" name="novo" value="Novo">
                <input type="submit" name="removeall" value="Remover Tudo">
            </form>
        <%}%>
        
        
            <!--Formulário para inserir novo Cliente-->
            <%if (BD.getClientes().size() == 0 || request.getParameter("novo") != null) {%>
            <fieldset>
                <h2>Novo Cliente</h2><br/>
                <form name="principal">
                    <label>Nome:</label>
                    <input type="text" name="nome" placeholder="Insira seu nome"/><br/>
                    <label>CPF:</label>
                    <input type="text" name="cpf" placeholder="Insira seu CPF"/><br/>
                    <label>RG:</label>
                    <input type="text" name="rg" placeholder="Insira seu RG"/><br/>
                    <label>E-mail:</label>
                    <input type="text" name="email" placeholder="Insira seu E-Mail"/><br/>
                    <label>Telefone:</label>
                    <input type="text" name="telefone" placeholder="Insira seu Telefone" /><br/>
                    <label>Endereço:</label>
                    <input type="text" name="endereco" placeholder="Insira seu Endereço"/><br/>
                    <br>
                    <input type="submit" name="enviar" value="Adicionar"/>
                </form>
            </fieldset>
        <% } %>
    
    <!--Formulário para editar Cliente-->
    
    <%                   
        if(request.getParameter("edit")!=null){
            int i=Integer.parseInt(request.getParameter("i"));
            Cliente c = BD.getClientes().get(i);%>

    <fieldset>
        <h2>Editar Cliente</h2><br/>
            <form>
                <label>Nome:</label>
                <input type="text" name="nome1" value="<%=c.getNome()%>"/><br/>
                <label>CPF:</label>
                <input type="text" name="cpf1" value="<%=c.getCpf()%>"/><br/>
                <label>RG:</label>
                <input type="text" name="rg1" value="<%=c.getRg()%>"/><br/>
                <label>E-mail:</label>
                <input type="text" name="email1" value="<%=c.getEmail()%>"/><br/>
                <label>Telefone:</label>
                <input type="text" name="telefone1" value="<%=c.getTelefone()%>"/><br/>
                <label>Endereço:</label>
                <input type="text" name="endereco1" value="<%=c.getEndereco()%>"/><br/>
                <br>
                <input type="submit" name="alterar1" value="Editar"/>
                
            </form>
    </fieldset>  
    <%}%>
    
    </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>

</html>