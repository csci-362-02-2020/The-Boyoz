import java.awt.Color;

public class rgb2HslDriver{

	public static void main(String[] args){
	
		ColorConverter checker = new ColorConverter();
		
		String firstArg = "#" + args[0]; 
		
		Color firstColor = Color.decode(firstArg);
		
		System.out.println(checker.rgb2Hsl(firstColor));
	}
}
