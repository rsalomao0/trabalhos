<% @LANGUAGE="VBSCRIPT" CODEPAGE="65001" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Untitled Document</title>

</head>
 
<body>

<select name="CustomerID" id="CustomerID">
  <option> -- Select Customer -- </option>
  <option value="1"> verde </option>
  <option value="2"> amarelo </option>
  <option value="3"> azul </option>
</select>

<%
'##Declara as variaveis a serem utilizadas no script
Dim conexao, stringConexao, host, usuario, senha, banco

'##Informe os dados de conexão junto ao banco Microsoft SQL Server
host ="localhost\SQLEXPRESS"
usuario="rafael_salomao" 
senha ="123456"
banco ="db_teste"

'Server=localhost\SQLEXPRESS;Database=master;Trusted_Connection=True;

'##Monta a string de conexão utilizando os dados informados anteriormente
stringConexao = "Provider=SQLNCLI11;SERVER="&host&";DATABASE="&banco&";UID="&usuario&";PWD="&senha&";"

'##Instancia o objeto de conexão com o banco
SET conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next

'##Abre a conexão junto ao banco
conn.Open stringConexao

'##Tratamento de erro. Caso ocorra problemas na conexão, exibe esta informação e apresenta detalhes.
If Err.Number <> 0 Then
response.write " <br>Conexão com o banco '" & banco & "' Microsoft SQL Server falhou !"
response.write ""
response.write "<br>Erro.Description: " & Err.Description 

response.write "<br>Erro.Number: " & Err.Number

response.write "<br> Erro.Source: " & Err.Source 

Else
'##Caso a conexão seja bem sucedida, mostra mensagem de confirmação.
response.write "<br> Conexão com o banco '" & banco & "' Microsoft SQL Server estabelecida com sucesso !"
End If
set rs = Server.CreateObject("ADODB.recordset")
rs.Open "SELECT * FROM Persons", conn
%>
<div id="content" style="width:120; height:100px; overflow-y:scroll;">
<%
do while not rs.eof
    Response.Write(rs("FirstName"))
    Response.Write(" = ")
    Response.Write(rs("LastName") & "<br>")
  
  Response.Write("<br>")
  rs.MoveNext
  loop


rs.close
conn.close
'##Remove as referência do objeto da memória
SET conn = Nothing
%>
</div>


<div id="DiplayDetails" name="DiplayDetails"></div>


 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script >
    $(document).ready(function() {
    $("#content").scroll(function() {
		  if ($(this).scrollTop() + $(this).height() == $(this).get(0).scrollHeight) {
			$(document).ready(function() {
    $("#content").scroll(function() { 
      if ($(this).scrollTop() + $(this).height() == $(this).get(0).scrollHeight) {
			$.ajax({
				  type: "post",
				  url: "/maisitems/",
				  success: function(data) {
					//manipula os dados
					$("#content ul").append("<li>" + item + "</li>");
				  },
				  error: function() {
				  }
				});
			  }
			});
		  });
		  }
		});
	  });
    </script>
</body>