
<%@page import="java.util.Arrays"%>

<%@page import="javax.swing.JOptionPane"%>

<%@page import="app.Fornecedor"%>

<%@page import="app.BD"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <% 
try{
                
                if ( request.getParameter("enviar")!=null){
                    

                    
                    String nome = request.getParameter("nome");
                    String razao_social = request.getParameter("razao_social");
                    String cnpj = request.getParameter("cnpj");
                    String email = request.getParameter("email");
                    String telefone = request.getParameter("telefone");
                    String endereco = request.getParameter("endereco");
                
                    
                    Fornecedor fncd= new Fornecedor(); 
                    fncd.setNome(nome);
                    fncd.setRazao_social(razao_social);
                    fncd.setCnpj(cnpj);
                    fncd.setEmail(email);
                    fncd.setTelefone(telefone);
                    fncd.setEndereco(endereco);
                    BD.getFornecedor().add(fncd);
                  
                    
                           
                            }
                }catch(Exception ex){ %>
                <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
            <%}%>