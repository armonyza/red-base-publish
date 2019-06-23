<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fizzbuzz.aspx.cs" Inherits="Project_red.fizzbuzz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>


    <script>

        function fizzbuzz()
        {
            for (i = 1; i <= 100; i++) {


                if (i % 3 == 0 && i % 5 == 0) {
                    console.log("fizzbuzz");
                }

                else if (i % 5 == 0) {
                    console.log('buzz');
                }

                else if (i % 3 == 0) {
                    console.log('fizz');
                }
                else
                {
                    console.log(i);
                }

            }
            
        }

        fizzbuzz();
        


    </script>
</body>
</html>
