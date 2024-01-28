package Vanshika.blog.Helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class ProfiePhoto 
{
		public static boolean deleteFile(String path)
		{
			boolean flag=false;
			
			try 
			{
				File file =new File(path);
				boolean f= file.delete();
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			
			
			return flag;
		}
		
		
		public static boolean SaveFile(InputStream is , String path)
		{
			boolean f=false;
			
			try
			{
				byte b [] = new byte[is.available()];
				is.read(b);
				
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(b);
				fos.flush();
				fos.close();
				f=true;
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
			}
			
			return f;
		}
}