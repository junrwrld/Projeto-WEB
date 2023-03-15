<%@page language="java" import="java.sql.*" %>

<%
    // cria as variaveis e armazena as informações digitadas pelo usuario
    String vnome  = request.getParameter("txtNome");
    int    vidade = Integer.parseInt( request.getParameter("txtIdade") );
    String vemail = request.getParameter("txtEmail");

    // variaveis para o banco de dados
    String banco    = "projetoweb";
    String endereco = "jdbc:mysql://localhost:3306/" + banco ;
    String usuario  = "root" ;
    String senha    = "" ;

    String driver   = "com.mysql.jdbc.Driver" ;

    //Carregar o driver na memoria
    Class.forName( driver );

    //cria a variavel para conectar com o banco
    Connection conexao ;
    //Abrir a conexao com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha) ;

    //Cria a variavel sql com o comando de Inserir
    String sql = "INSERT INTO projetoweb (nome,idade,email) values(?,?,?)" ;

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setInt(2, vidade);
    stm.setString(3, vemail);

    stm.execute() ;
    stm.close() ;

    out.print("Seu cadastro foi concluido com sucesso. Clique no link abaixo para ser redirecionado para pagina de download");
    out.print("<br><br>");
    out.print("<a target='blank' href='https://playvalorant.com/pt-br/download'>Baixar</a>");
%>