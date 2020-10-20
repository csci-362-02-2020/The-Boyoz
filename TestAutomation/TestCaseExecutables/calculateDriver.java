package TestCaseExecutables;
import java.awt.Color;

public class calculateDriver{

	public static void main(String[] args){
		
		Color firstColor = Color.decode(args[0]);
		Color secondColor = Color.decode(args[1]);
		
		System.out.println(DistanceCalculator.calculate(firstColor,secondColor));
			
	}
}
