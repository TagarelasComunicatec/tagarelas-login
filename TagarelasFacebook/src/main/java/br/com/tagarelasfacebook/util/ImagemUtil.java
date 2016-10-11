package br.com.tagarelasfacebook.util;

import java.awt.geom.AffineTransform;
import java.awt.geom.Point2D;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class ImagemUtil {
	
	public static BufferedImage converterMultiPartFileParaBufferedImage(MultipartFile arquivo) throws IOException{
		byte[] bytes = arquivo.getBytes();
		InputStream inputStream = new ByteArrayInputStream(bytes);
		return ImageIO.read(inputStream);
		
	}
	
	public static BufferedImage rotacionar(BufferedImage imagem, int larguraOriginal, int alturaOriginal, double angulo){
		AffineTransform affineTransform = new AffineTransform();
		affineTransform.rotate(Math.toRadians(angulo), larguraOriginal/2, alturaOriginal/2);
		
		double yTranslation = 0;
	    double xTranslation = 0;
	    
	    if (angulo == 90){
	        xTranslation = affineTransform.transform(new Point2D.Double(0, alturaOriginal), null).getX();
	        yTranslation = affineTransform.transform(new Point2D.Double(0, 0), null).getY();
	        
	    } else if (angulo == 180){
	        xTranslation = affineTransform.transform(new Point2D.Double(larguraOriginal, alturaOriginal), null).getX();
	        yTranslation = affineTransform.transform(new Point2D.Double(0, alturaOriginal), null).getY();
	        
	    } else if (angulo == 270){
	        xTranslation = affineTransform.transform(new Point2D.Double(larguraOriginal, 0), null).getX();
	        yTranslation = affineTransform.transform(new Point2D.Double(larguraOriginal, alturaOriginal), null).getY();
	        
	    }
		
		AffineTransform translationAffineTransform = new AffineTransform();
	    translationAffineTransform.translate(-xTranslation, -yTranslation);
	    affineTransform.preConcatenate(translationAffineTransform);

	    AffineTransformOp affineTransformOp = new AffineTransformOp(affineTransform, AffineTransformOp.TYPE_NEAREST_NEIGHBOR);
	    return affineTransformOp.filter(imagem, null);
	}
	
	public static BufferedImage cortar(BufferedImage imagem, double x, double y, double largura, double altura, double larguraOriginal, double alturaOriginal, double escala){
		int xCorte = (int) (x/escala);
		int yCorte = (int) (y/escala);
		
		int larguraCorte = (int) (largura/escala);
		if (xCorte + larguraCorte > larguraOriginal){
			larguraCorte -= xCorte + larguraCorte - larguraOriginal;
		}
		
		int alturaCorte = (int) (altura/escala);
		if (yCorte + alturaCorte > alturaOriginal){
			alturaCorte -= yCorte + alturaCorte - alturaOriginal;
		}
		
		return imagem.getSubimage(xCorte, yCorte, larguraCorte, alturaCorte);
	}
	
	public static byte[] converterBufferedImageParaByteArray(BufferedImage imagem, String extensao) throws IOException{
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		ImageIO.write(imagem, extensao, out);
		out.flush();
		return out.toByteArray();
	}

}
