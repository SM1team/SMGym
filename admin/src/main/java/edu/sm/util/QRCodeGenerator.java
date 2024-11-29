package edu.sm.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.util.HashMap;
import java.util.Map;

public class QRCodeGenerator {
    public static byte[] generateQRCodeImage(String content) throws Exception {
        int width = 150; // QR 코드의 가로 크기 (픽셀)
        int height = 150; // QR 코드의 세로 크기 (픽셀)

        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        var bitMatrix = qrCodeWriter.encode(content, BarcodeFormat.QR_CODE, width, height, hints);

        BufferedImage qrImage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        qrImage.createGraphics();

        Graphics2D graphics = (Graphics2D) qrImage.getGraphics();
        graphics.setColor(Color.WHITE); // 배경색
        graphics.fillRect(0, 0, width, height);
        graphics.setColor(Color.BLACK); // QR 코드 색상

        for (int x = 0; x < width; x++) {
            for (int y = 0; y < height; y++) {
                if (bitMatrix.get(x, y)) {
                    graphics.fillRect(x, y, 1, 1);
                }
            }
        }

        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ImageIO.write(qrImage, "PNG", outputStream);
        return outputStream.toByteArray(); // 바이트 배열로 반환
    }
}
