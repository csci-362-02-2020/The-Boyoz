import java.awt.Color;

public class calculateDriver{

	public static void main(String[] args){
	
		DistanceCalculator calculator = new DistanceCalculator();
		
		String firstArg = "#" + args[0]; 
		String secondArg = "#" + args[1]; 
	
		Color firstColor = Color.decode(firstArg);
		Color secondColor = Color.decode(secondArg);
		
		System.out.println(calculator.calculate(firstColor,secondColor));
	}
}
