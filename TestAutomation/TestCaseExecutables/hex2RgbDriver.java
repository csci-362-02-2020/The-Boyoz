import java.awt.Color;

public class hex2RgbDriver{

	public static void main(String[] args){
	
		ColorConverter checker = new ColorConverter();
		
		String firstArg = "#" + args[0]; 
		
		System.out.println(checker.hex2Rgb(firstArg));
	}
}
