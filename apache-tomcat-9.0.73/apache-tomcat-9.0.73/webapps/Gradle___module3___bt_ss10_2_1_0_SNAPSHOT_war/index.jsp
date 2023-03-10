<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
<h1><%= "Calculator" %>
</h1>
<br/>
<form action="/calculator" method="post">
    <table>
        <tr>
            <td>
                First operand:
            </td>
            <td>
                <input type="text" name="firstOperand">
            </td>
        </tr>
        <tr>
            <td>
                Operator:
            </td>
            <td>
                <select name="operator">
                    <option value="+">Addition</option>
                    <option value="-">Subtraction</option>
                    <option value="*">Multiplication</option>
                    <option value="/">Division</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Second Operand:
            </td>
            <td>
                <input name="secondOperand" type="text"/>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit" value="calculate">Calculator</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>