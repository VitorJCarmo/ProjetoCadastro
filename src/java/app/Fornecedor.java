/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package app;

/**
 *
 * @author Karin Cristine Martins Santos
 */
public class Fornecedor {
    private String nome;
    private String razao_social;
    private String cnpj;
    private String email;
    private String telefone;
    private String endereco;

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getRazao_social() {
        return razao_social;
    }

    public void setRazao_social(String razao_social) {
        this.razao_social = razao_social;
    }

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }
    public void editarFornecedor(String nome,String razao_social, String cnpj, String email, String telefone,String endereco){
        this.nome=nome;
        this.razao_social=razao_social;
        this.cnpj=cnpj;
        this.email=email;
        this.telefone=telefone;
        this.endereco=endereco;
    }
    
    
    
}
