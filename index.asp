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

%>
<div id="DiplayDetails" name="DiplayDetails"></div>


 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript">
        $(function() {
            $('#CustomerID').change(function(){
                    $('#DiplayDetails').empty();
					'alert($( "#CustomerID option:selected" ).text());
					$( "#DiplayDetails" ).append( $( "#CustomerID option:selected" ).text() );
            });
        });
    
    </script>
</body>