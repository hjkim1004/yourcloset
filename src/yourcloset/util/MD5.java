package yourcloset.util;

/*
 * MD5 Class : Message Digest 암호화 클래스
 */
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5 {
	public MD5() {
	}

	public static String getMd5(String str) {
		String md5 = "";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(str.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			md5 = sb.toString();

		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			md5 = null;
		}
		return md5;
	}
}