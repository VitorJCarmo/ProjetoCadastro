
package app;

import java.util.ArrayList;


public class BD {
  private static ArrayList<Cliente> clientes;  
  public static ArrayList<Cliente> getClientes(){
      if(clientes==null){
          clientes = new ArrayList<>();
      }
      return clientes;
  }
}
// <Cliente> remete a classe e contatos em verde eh o nome do array