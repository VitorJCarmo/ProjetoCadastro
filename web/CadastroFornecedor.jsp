
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
                    BD.getCliente().remove(i);
                   }
                   else if(request.getParameter("removeall") != null){
                    int rt = BD.getCliente().size() - 1;
                    for (int r = rt; r >= 0; r--){
                        BD.getCliente().remove(r);
                    }
               
                        }
}catch(Exception ex){ %>
                <div> *erro ao processar o comando:<%=ex.getMessage()%></div>
            <%}%>
            