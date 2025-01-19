package com.example.evoucher.common;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Path;

public class QRCodeGenerator {
    public static String generateQRCodeImage(String promoCode)
            throws WriterException, IOException {
        int width = 100, height =100;
        String filePath = System.getProperty("user.dir") + "/QrCodes";
        String fileName = promoCode + ".png";

        // Create directory if it doesn't exist
        File directory = new File(filePath);
        if (!directory.exists()) {
            directory.mkdirs();
        }
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(promoCode, BarcodeFormat.QR_CODE, width, height);

        Path path = new File(directory, fileName).toPath(); //FileSystems.getDefault().getPath(filePath);
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", path);
        return "/QrCodes/" + fileName;
    }

    public static byte[] getQRCodeImage(String filePath) throws IOException {
        // Load the image from the file path
        String projectPath = System.getProperty("user.dir");
        File file = new File(projectPath + filePath);
        if(!file.exists()) {
            //throw new IOException("File not found: " + file.getAbsolutePath());
            return null;
        }
        BufferedImage bufferedImage = ImageIO.read(file);

        // Convert the image to a byte array
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        if(bufferedImage != null) {
            ImageIO.write(bufferedImage, "PNG", byteArrayOutputStream);
            byte[] imageBytes = byteArrayOutputStream.toByteArray();
            return imageBytes;
        }
        return null;
    }


    public static byte[] getQRCodeImage(String text, int width, int height) throws WriterException, IOException {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageConfig con = new MatrixToImageConfig( 0xFF000002 , 0xFFFFC041 ) ;

        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream,con);
        byte[] pngData = pngOutputStream.toByteArray();
        return pngData;
    }
}
