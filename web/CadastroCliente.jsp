

<%@page import="java.util.Arrays"%>

<%@page import="javax.swing.JOptionPane"%>

<%@page import="app.Cliente"%>

<%@page import="app.BD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <%@include file="WEB-INF/jspf/menu-cliente.jspf"%>
    
<script language='JavaScript'>
function RG(e){
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58 || tecla==88 || tecla==120 )) return true;
    else{
    	if (tecla==8 || tecla==0) return true;
	else  return false;
    }
}
function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;   
    if((tecla>47 && tecla<58)) return true;
    else{
    	if (tecla==8 || tecla==0) return true;
	else  return false;
    }
}
function validacaoEmail(field) {
usuario = field.value.substring(0, field.value.indexOf("@"));
dominio = field.value.substring(field.value.indexOf("@")+ 1, field.value.length);

if ((usuario.length >=1) &&
    (dominio.length >=3) && 
    (usuario.search("@")==-1) && 
    (dominio.search("@")==-1) &&
    (usuario.search(" ")==-1) && 
    (dominio.search(" ")==-1) &&
    (dominio.search(".")!=-1) &&      
    (dominio.indexOf(".") >=1)&& 
    (dominio.lastIndexOf(".") < dominio.length - 1)) {
document.getElementById("msgemail").innerHTML="E-mail válido";
alert("E-mail valido");
}
else{
document.getElementById("msgemail").innerHTML="<font color='red'>E-mail inválido </font>";
alert("E-mail invalido");
}
}
</script>
    <div class="container">
        
    <br/>
        <%

            try{
                
                if ( request.getParameter("enviar")!=null){
                    

                    
                    String nome = request.getParameter("nome");
                    String cpf = request.getParameter("cpf");
                    String rg = request.getParameter("rg");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String endereco = request.getParameter("endereco");
                    
                    
                    if (request.getParameter("nome") != "" && request.getParameter("cpf") != "" && request.getParameter("rg") != "" && request.getParameter("email") != "" && request.getParameter("telefone") != "" && request.getParameter("endereco") != ""){
                    Cliente c= new Cliente(); 
                    
                    c.setNome(nome);
                    c.setCpf(cpf);
                    c.setRg(rg);
                    c.setEmail(email);
                    c.setTelefone(telefone);
                    c.setEndereco(endereco);
                    BD.getCliente().add(c);
                    }else {%>
                    <h3 style="color:red">*Não deixe espaços em branco</h3>
                    <%}
                    
                }else if(request.getParameter("alterar1")!=null){

                    int j = Integer.parseInt(request.getParameter("i"));
                    String nome = request.getParameter("nome1");
                    String cpf = request.getParameter("cpf1");
                    String rg = request.getParameter("rg1");
                    String email = request.getParameter("email1");
                    String telefone = request.getParameter("telefone1");
                    String endereco = request.getParameter("endereco1");
                    
                    Cliente c = new Cliente();
                    
                    c.setNome(nome);
                    c.setCpf(cpf);
                    c.setRg(rg);
                    c.setEmail(email);
                    c.setTelefone(telefone);
                    c.setEndereco(endereco);
                    
                    BD.getCliente().set(j , c);

                }else if(request.getParameter("remove")!=null){
                    int i=Integer.parseInt(request.getParameter("i"));
                    BD.getCliente().remove(i);

                }else if(request.getParameter("removeall") != null){
                    int rt = BD.getCliente().size() - 1;
                    for (int r = rt; r >= 0; r--){
                        BD.getCliente().remove(r);
                    }

                }
            }catch(Exception ex){ %>
                <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
            <%}%>
            
           
        
        
            <!--Formulário para inserir novo Cliente-->
            <%if (request.getParameter("edit") == null) {%>
            <fieldset>
                <h2>Novo Cliente</h2><br/>
                <form name="principal">
                    <label>Nome:</label>
                    <input type="text" name="nome" placeholder="Insira seu nome"/><br/>
                    <label>CPF:</label>
                    <input type="text" name="cpf" onkeypress='return SomenteNumero(event)' maxlength="11" placeholder="Insira seu CPF"/><br/>
                    <label>RG:</label>
                    <input type="text" name="rg" onkeypress='return RG(event)' maxlength="9" placeholder="Insira seu RG"/><br/>
                    <label>E-mail:</label>
                     <input type="text" name="email" onblur="validacaoEmail(principal.email)"  maxlength="60" placeholder="Insira seu E-Mail"/><div id="msgemail"></div><br/>
                    <label>Telefone:</label>
                    <input type="text" name="telefone" onkeypress='return SomenteNumero(event)' maxlength="11" placeholder="Insira seu Telefone" /><br/>
                    <label>Endereço:</label>
                    <input type="text" name="endereco" placeholder="Insira seu Endereço"/><br/>
                    <br>
                    <input type="submit" name="enviar" value="Adicionar" class="form-button"/>
                </form>
            </fieldset>
            <%if(BD.getCliente().size() != 0 && request.getParameter("edit") == null){%>
                <hr id="hr-especial"/>
            <%}%>
            <%}%>
    
    <!--Formulário para editar Cliente-->

     <!--Tabela de Clientes-->
            <%  int i = 0;
                if (BD.getCliente().size() != 0){%>
            
            <h2>Clientes Cadastrados</h2><br/>
            <table align="center" class="table table-striped">
                <tr>
                    <th>Indice</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>RG</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Excluir</th>
                    <th>Editar</th>
                </tr>
                
                <% 
                if(request.getParameter("edit") == null ){
                   for(i=0; i<BD.getCliente().size();i++){ %>
                <% Cliente c = BD.getCliente().get(i);%>

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
                            <input id="table-icon-delete" type="image" name="remove" value="Excluir" src="images/Delete.png"/>
                        </form>
                    </td>
                    <td>
                        <form>
                        <input type="hidden" name="i" value="<%=i%>"/>
                        <input id="table-icon-edit" type="image" name="edit" value="Editar" src="images/edit.png"/>
                        </form>
                    </td>
                </tr>
                

                    <%}
                }else {
                    for(i=0; i<BD.getCliente().size();i++){
                    Cliente c = BD.getCliente().get(i);
                    if(i == Integer.parseInt(request.getParameter("i"))){%>
                    <form>
                        <tr>
                            <td><%=i%></td>
                            <td><input id="input-edit" type="text" name="nome1" value="<%=c.getNome()%>"/></td>
                            <td><input id="input-edit" type="text" name="cpf1" value="<%=c.getCpf()%>"/></td>
                            <td><input id="input-edit" type="text" name="rg1" value="<%=c.getRg()%>"/></td>
                            <td><input id="input-edit" type="text" name="email1" value="<%=c.getEmail()%>"/></td>
                            <td><input id="input-edit" type="text" name="telefone1" value="<%=c.getTelefone()%>"/></td>
                            <td><input id="input-edit" type="text" name="endereco1" value="<%=c.getEndereco()%>"/></td>
                            <td>
                                <input type="hidden" name="i" value="<%=i%>"/>
                                <button href="CadastroCliente.jsp" id="edit-cancel" class="btn btn-danger">Cancelar</button>
                            </td>
                            <td>
                                <input type="hidden" name="i" value="<%=i%>"/>
                                <input id="alterar" class="btn btn-success" type="submit" name="alterar1" value="Alterar"/>
                            </td>    
                        </tr>
                    </form>
                    <%}else { %>
                            
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
                                       <input id="table-icon-delete" type="image" name="remove" value="Excluir" src="images/Delete.png"/>
                                   </form>
                               </td>
                               <td>
                                   <form>
                                   <input type="hidden" name="i" value="<%=i%>"/>
                                   <input id="table-icon-edit" type="image" name="edit" value="Editar" src="images/edit.png"/>
                                   </form>
                               </td>
                           </tr>  

                          <%  } 
                        }
                    
                }%>
            </table>
            
            <%if (i >= 5) {%>
                <a id="topo" href="">Voltar ao topo</a><br/>
            <%}%>
            <br/>
            <% if(request.getParameter("edit") == null){%>
                <form>
                    <input type="submit" name="removeall" value="Limpar Tudo" id="limpar-tudo">
                </form>
            <%}%>
            <br/>
        <%}%>
    
    </div>
    <%@include file="WEB-INF/jspf/footer.jspf" %>  