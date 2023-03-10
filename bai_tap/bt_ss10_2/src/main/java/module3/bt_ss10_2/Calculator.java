package module3.bt_ss10_2;

public class Calculator {
public static float calculator(float firstOperand, float secondOperand, char operator){
    switch (operator){
        case '+':
            return firstOperand+secondOperand;
        case '-':
            return firstOperand-secondOperand;
        case '*':
            return firstOperand*secondOperand;
        case '/':
            if (secondOperand!=0){
                return firstOperand/secondOperand;
            } else
                throw new RuntimeException("Cannot be divided by 0");
        default:
            throw new RuntimeException("Invalid operator");
    }
}
}
