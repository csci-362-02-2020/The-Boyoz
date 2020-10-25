import java.awt.Color;

public class distanceColorDriver{

	public static void main(String[] args){
	
		ContrastChecker checker = new ContrastChecker();
		
		String firstArg = "#" + args[0]; 
		String secondArg = "#" + args[1]; 
	
		Color firstColor = Color.decode(firstArg);
		Color secondColor = Color.decode(secondArg);
		
	System.out.println(checker.distanceColor(firstColor,secondColor));
	}
}
