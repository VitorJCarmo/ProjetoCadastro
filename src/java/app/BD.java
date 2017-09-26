
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
}
// <Cliente> remete a classe e contatos em verde eh o nome do array