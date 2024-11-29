package edu.sm.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

public class FileUploadUtil {

    // 파일 삭제 메서드
    public static void deleteFile(String filename, String dir) throws IOException {
        Path filePath = Paths.get(dir, filename);  // 경로 구분자 문제 해결
        Files.delete(filePath);
    }

    // 파일 저장 메서드
    public static void saveFile(MultipartFile mf, String dir) throws IOException {
        // 파일명이 null 또는 비어있는지 확인
        if (mf.isEmpty()) {
            throw new IOException("File is empty.");
        }

        // 원본 파일명 가져오기
        String imgName = mf.getOriginalFilename();
        if (imgName == null) {
            throw new IOException("Filename is null.");
        }

        // 중복을 피하기 위해 UUID 추가
        String uniqueFileName = UUID.randomUUID().toString() + "_" + imgName;
        Path filePath = Paths.get(dir, uniqueFileName);

        // 디렉토리 존재 여부 확인 및 생성
        Path dirPath = Paths.get(dir);
        if (!Files.exists(dirPath)) {
            Files.createDirectories(dirPath);  // 디렉토리가 없으면 생성
        }

        try (FileOutputStream fos = new FileOutputStream(filePath.toFile())) {
            // MultipartFile을 byte 배열로 변환하여 파일에 저장
            byte[] data = mf.getBytes();
            fos.write(data);
            System.out.println("File uploaded successfully: " + uniqueFileName);
        } catch (IOException e) {
            e.printStackTrace();
            throw new IOException("Error while saving the file: " + imgName, e);
        }
    }
}
