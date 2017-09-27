

<%@page import="java.util.Arrays"%>

<%@page import="javax.swing.JOptionPane"%>

<%@page import="app.Fornecedor"%>

<%@page import="app.BD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script language='JavaScript'>
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
        
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <%@include file="WEB-INF/jspf/menu-fornecedor.jspf"%>
    <div class="container">
        
    <br/>
        <%

            try{
                
                if ( request.getParameter("enviar")!=null){
                    

                    
                    String nome = request.getParameter("nome");
                    String razao_social = request.getParameter("razao_social");
                    String cnpj = request.getParameter("cnpj");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String endereco = request.getParameter("endereco");
                    
                    if(request.getParameter("nome") != "" && request.getParameter("razao_social") != "" && request.getParameter("cnpj") != "" && request.getParameter("email") != "" && request.getParameter("telefone") != "" && request.getParameter("endereco") != "") {
                    Fornecedor fncd= new Fornecedor(); 
                    fncd.setNome(nome);
                    fncd.setRazao_social(razao_social);
                    fncd.setCnpj(cnpj);
                    fncd.setEmail(email);
                    fncd.setTelefone(telefone);
                    fncd.setEndereco(endereco);
                    BD.getFornecedor().add(fncd);
                    }else {%>
                        <h3 style="color: red">*Não deixe campos em branco</h3>
                    <%
                    }
                    
                }else if(request.getParameter("alterar1")!=null){
                    int j = Integer.parseInt(request.getParameter("i"));
                    String nome = request.getParameter("nome1");
                    String razao_social = request.getParameter("razao_social1");
                    String cnpj = request.getParameter("cnpj1");
                    String email = request.getParameter("email1");
                    String telefone = request.getParameter("telefone1");
                    String endereco = request.getParameter("endereco1");
                    
                    Fornecedor fncd = new Fornecedor();
                    
                    fncd.setNome(nome);
                    fncd.setRazao_social(razao_social);
                    fncd.setCnpj(cnpj);
                    fncd.setEmail(email);
                    fncd.setTelefone(telefone);
                    fncd.setEndereco(endereco);
                    
                    BD.getFornecedor().set(j,fncd);
                   }else if (request.getParameter("remove") != null){
                       int i=Integer.parseInt(request.getParameter("i"));
                    BD.getFornecedor().remove(i);
                   }
                   else if(request.getParameter("removeall") != null){
                    int rt = BD.getFornecedor().size() - 1;
                    for (int r = rt; r >= 0; r--){
                        BD.getFornecedor().remove(r);
                    }

                }
            }catch(Exception ex){ %>
                <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
            <%}%>
            
                      <!---- Inserir Fornecedor---->
            <%if (request.getParameter("edit") == null) {%>
            <fieldset>
                <h2>Novo Fornecedor</h2><br/>
                <form name="principal">
                    <label>Nome:</label>
                    <input type="text" name="nome" placeholder="Insira seu nome"/><br/>
                    <label>Razão Social:</label>
                    <input type="text" name="razao_social" placeholder="Insira a razão social"/><br/>
                    <label>CNPJ:</label>
                    <input type="text" name="cnpj" onkeypress='return SomenteNumero(event)' maxlength="14" placeholder="Insira o CNPJ"/><br/>
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
            <%if (request.getParameter("edit") == null && BD.getFornecedor().size() != 0){%>
                <hr id="hr-especial"/>
            <%}%>
            <%}%>

     <!--Tabela de Fornecedor-->
            <%  int i = 0;
                if (BD.getFornecedor().size() != 0){%>
            
            <h2>Fornecedores Cadastrados</h2><br/>
            <table align="center" class="table table-striped">
                <tr>
                    <th>Indice</th>
                    <th>Nome</th>
                    <th>Razão Social</th>
                    <th>CNPJ</th>
                    <th>Email</th>
                    <th>Telefone</th>
                    <th>Endereço</th>
                    <th>Excluir</th>
                    <th>Editar</th>
                </tr>
                
                <% 
                if(request.getParameter("edit") == null ){
                   for(i=0; i<BD.getFornecedor().size();i++){ %>
                <% Fornecedor fncd = BD.getFornecedor().get(i);%>

                <tr>
                    <td><%=i%></td>
                    <td><%=fncd.getNome()%></td>
                    <td><%=fncd.getRazao_social()%></td>
                    <td><%=fncd.getCnpj()%></td>
                    <td><%=fncd.getEmail()%></td>
                    <td><%=fncd.getTelefone()%></td>
                    <td><%=fncd.getEndereco()%></td>
                    
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
                    for(i=0; i<BD.getFornecedor().size();i++){
                    Fornecedor fncd = BD.getFornecedor().get(i);
                    if(i == Integer.parseInt(request.getParameter("i"))){%>
                    
                 <form>
                        <tr>
                            <td><%=i%></td>
                            <td><input id="input-edit" type="text" name="nome1" value="<%=fncd.getNome()%>"/></td>
                            <td><input id="input-edit" type="text" name="razao_social1" value="<%=fncd.getRazao_social()%>"/></td>
                            <td><input id="input-edit" type="text" name="cnpj1" value="<%=fncd.getCnpj()%>"/></td>
                            <td><input id="input-edit" type="text" name="email1" value="<%=fncd.getEmail()%>"/></td>
                            <td><input id="input-edit" type="text" name="telefone1" value="<%=fncd.getTelefone()%>"/></td>
                            <td><input id="input-edit" type="text" name="endereco1" value="<%=fncd.getEndereco()%>"/></td>
                            <td>
                                <input type="hidden" name="i" value="<%=i%>"/>
                                <button href="CadastroFornecedor.jsp" id="edit-cancel" class="btn btn-danger">Cancelar</button>
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
                               <td><%=fncd.getNome()%></td>
                               <td><%=fncd.getRazao_social()%></td>
                               <td><%=fncd.getCnpj()%></td>
                               <td><%=fncd.getEmail()%></td>
                               <td><%=fncd.getTelefone()%></td>
                               <td><%=fncd.getEndereco()%></td>
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