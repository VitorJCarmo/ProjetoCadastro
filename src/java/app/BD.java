
package app;

import java.util.ArrayList;


public class BD {
  private static ArrayList<Cliente> cliente;  
  public static ArrayList<Cliente> getCliente(){
      if(cliente==null){
          cliente = new ArrayList<>();
      }
      return cliente;
  }
  private static ArrayList<Fornecedor> fornecedor;
  public static ArrayList<Fornecedor> getFornecedor(){
      if(fornecedor==null){
          fornecedor= new ArrayList<>();
      }
      return fornecedor;
  }
}
// <Cliente> remete a classe e contatos em verde eh o nome do array