package module;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	// SHA256 암호화
	public static String encryption(String data) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(data.getBytes());

		return bytesToHex(md.digest());
	}

	// 바이트값을 Hex화
	private static String bytesToHex(byte[] bytes) {
		StringBuilder sb = new StringBuilder();
		for (byte b : bytes) {
			sb.append(String.format("%02x", b));
		}
		return sb.toString();
	}
}
