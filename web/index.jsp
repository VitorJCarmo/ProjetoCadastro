<%-- 
    Document   : index
    Created on : 24/09/2017, 14:20:07
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

        <%@include file="WEB-INF/jspf/header.jspf" %>
        
 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner" role="listbox">
    <div class="carousel-item active">
        <img id="carousel" class="d-block img-fluid" src="images/home.jpg" >
        <div class="carousel-caption d-none d-md-block">
            <h3 style="font-weight: bold">Cadastre sua própria Tabela</h3>
            <p>Faça uso de nosso site para criar seu próprio cadastro de clientes e funcionários,
            na maneira mais facil e simples</p>
        </div>
    </div>
    <div class="carousel-item">
       <img id="carousel" class="d-block img-fluid" src="images/clientes.jpg" >
       <div class="carousel-caption d-none d-md-block">
            <h3 style="font-weight: bold">Cadastro de Clientes</h3>
            <p>Cadastre agora sua tabela de clientes, para ter um melhor controle
            de seus clientes</p>
            <a href="CadastroCliente.jsp">
                <button>Cadastrar Clientes</button>
            </a>
        </div>
    </div>
    <div class="carousel-item">
        <img id="carousel" class="d-block img-fluid" src="images/funcionário.jpg" >
        <div class="carousel-caption d-none d-md-block">
            <h3 style="font-weight: bold">Cadastro de Funcionários</h3>
            <p>Não perca tempo! Geramos para você sua tabela de funcionários, para
            que administre sua empresa de forma eficiente</p>
            <a href="...">
                <button>Cadastrar Funcionários</button>
            </a>
        </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Anterior</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Próximo</span>
  </a>
</div>
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    </body>
</html>
