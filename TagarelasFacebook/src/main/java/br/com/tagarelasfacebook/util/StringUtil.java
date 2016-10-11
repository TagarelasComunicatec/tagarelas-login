package br.com.tagarelasfacebook.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import br.com.tagarelasfacebook.exception.UsuarioException;

public class StringUtil {
	
	private static final String MIME_JPEG = "image/jpeg";
	private static final String MIME_PNG = "image/png";
	private static final String MIME_PJPEG = "image/pjpeg";
	
	public static final String FACEBOOK = "facebook";
	public static final String DOMINIO_APLICACAO = "http://208f49c9.ngrok.io";
	
	private static Map<String, String> extensaoImagens = new HashMap<>();
	
	static{
		extensaoImagens.put(MIME_JPEG, "jpg");
		extensaoImagens.put(MIME_PNG, "png");
		extensaoImagens.put(MIME_PJPEG, "jpg");
	}

	public static String criptografarSenha(String senha) {
		if (!stringVazia(senha)) {

			MessageDigest algorithm;
			byte messageDigest[];

			try {
				algorithm = MessageDigest.getInstance("MD5");
				messageDigest = algorithm.digest(senha.getBytes("UTF-8"));
				StringBuilder hexString = new StringBuilder();

				for (byte b : messageDigest) {
					hexString.append(String.format("%02X", 0xFF & b));
				}

				return hexString.toString();

			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

		}
		
		return null;
	}
	
	public static boolean stringVazia(String string){
		return StringUtils.isBlank(string);
		
	}
	
	public static String getExtensao(String mimeType) throws UsuarioException{
		String extensao = extensaoImagens.get(mimeType);
		
		if (extensao == null){
			throw new UsuarioException("A extensão do arquivo é inválida.");
		}
		
		return extensao;
	}
	
	
	
}