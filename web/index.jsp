<%-- 
    Document   : index
    Created on : 24/09/2017, 14:20:07
    Author     : Henrique
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%@include file="WEB-INF/jspf/header.jspf"%>
<%@include file="WEB-INF/jspf/menu-index.jspf"%>
        
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
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
            <h3 style="font-weight: bold">Cadastro de Fornecedor</h3>
            <p>Não perca tempo! Geramos para você sua tabela de fornecedores, para
            que faça sua administração de maneira eficiente</p>
            <a href="CadastroFornecedor.jsp">
                <button>Cadastrar Fornecedores</button>
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

<button id="team-collapse" data-toggle="collapse" data-target="#team" aria-expanded="true" aria-controls="team">Conheça nossa equipe</button>

<div id="team" class="collapse container-fluid">
    <div id="team-div" class="col-sm-3">
        <legend>Vitor do Carmo</legend>
        <img class="team-pic" src="images/vitor.jpg"><br/>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-google"></a>
        <br/>
    </div>
    <div id="team-div" class="col-sm-3">
        <legend>Karin Cristine</legend>
        <img class="team-pic" src="images/karin.jpg"><br/>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-google"></a>
        <br/>
    </div>
    <div id="team-div" class="col-sm-3">
        <legend>Henrique Melo</legend>
        <img class="team-pic" src="images/henrique.jpg"><br/>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-google"></a>
        <br/>
    </div>
    <div id="team-div" class="col-sm-3">
        <legend>Derek Souza</legend>
        <img class="team-pic" src="images/derek.jpg"><br/>
        <a href="#" class="fa fa-facebook"></a>
        <a href="#" class="fa fa-linkedin"></a>
        <a href="#" class="fa fa-google"></a>
        <br/>
    </div>
</div>

<%@include file="WEB-INF/jspf/footer.jspf" %>        
       
