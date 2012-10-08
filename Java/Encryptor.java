

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class Encryptor {
	
	private String iv= "TwPbnsr6StYwMh5G";
	 
	public Encryptor(){} // empty constructor so this can be used from ColdFusion
	
	public String encrypt(String text, String password) throws Exception{
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			byte[] keyBytes= new byte[16];
		  	byte[] b= password.getBytes("UTF-8");
		  	byte[] ivBytes = iv.getBytes("UTF-8");
		  	int len= b.length; 
		  	if (len > keyBytes.length){
		  		len = keyBytes.length;
		  	}
		  	System.arraycopy(b, 0, keyBytes, 0, len);
		  	
			SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
			IvParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			
			cipher.init(Cipher.ENCRYPT_MODE,keySpec,ivSpec);

			byte [] results = cipher.doFinal(text.getBytes("UTF-8"));
			BASE64Encoder encoder = new BASE64Encoder();
			return encoder.encode(results);
	}
	
	public String decrypt(String text, String password) throws Exception{
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			
			byte[] keyBytes= new byte[16];
		  	byte[] b= password.getBytes("UTF-8");
		  	byte[] ivBytes = iv.getBytes("UTF-8");
		  	
		  	int len= b.length; 
		  	if (len > keyBytes.length){
		  		len = keyBytes.length;
		  	}
		  	System.arraycopy(b, 0, keyBytes, 0, len);
		  	
			SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");
			IvParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			
			cipher.init(Cipher.DECRYPT_MODE,keySpec,ivSpec);
			
			BASE64Decoder decoder = new BASE64Decoder();
			byte [] results = cipher.doFinal(decoder.decodeBuffer(text));
			return new String(results,"UTF-8");
	}

}
