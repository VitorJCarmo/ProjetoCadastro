
package app;

import java.util.ArrayList;


public class BD {
  private static ArrayList<Contato> contatos;  
  public static ArrayList<Contato> getContatos(){
      if(contatos==null){
          contatos = new ArrayList<>();
      }
      return contatos;
  }
}
// <Contato> remete a classe e contatos em verde eh o nome do array