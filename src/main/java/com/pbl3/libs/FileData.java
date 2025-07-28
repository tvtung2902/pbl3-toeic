package com.pbl3.libs;

import jakarta.servlet.http.Part;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID; // Import thư viện UUID

import jakarta.servlet.ServletException;

// part : lay tu form
// realPart: đường dẫn thư muc để lưu dữ liệu, không có thì phải tạo
// originalFileName: đường dẫn tệp gửi lên
// fileName: tên đường dẫn trong máy chủ 

public class FileData {
	private static String name = "data/";

	// check trùng
	public static String Check(String directory, String fileName) {
		System.out.println(1);
		Path path = Paths.get(directory, fileName);
		System.out.println(2);
		if (Files.exists(path)) {
			System.out.println(3);
			String baseName = fileName.substring(0, fileName.lastIndexOf('.'));
			System.out.println(4);
			String extension = fileName.substring(fileName.lastIndexOf('.'));
			System.out.println(5);
			String uniqueName = baseName + "_" + UUID.randomUUID().toString() + extension;
			System.out.println(6);
			return Check(directory, uniqueName);
		}
		return fileName;
	}

	public static void delete(String fileDelete){
		try {
            // Chuyển đổi đường dẫn tệp thành đối tượng Path
            Path path = Paths.get(fileDelete);
            Files.deleteIfExists(path);

            System.out.println("Đã xóa tệp: " + fileDelete);
        } catch (IOException e) {
            System.err.println("Lỗi khi xóa tệp: " + fileDelete);
            e.printStackTrace();
        }
    }

	// thêm
	public static String add(Part part, String realPart) throws IOException, ServletException {
		String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		if(originalFileName.equals("")){
			return null;
		}
		String fileName = Check(realPart, originalFileName);
		if (!Files.exists(Paths.get(realPart))) {
			Files.createDirectories(Paths.get(realPart));
		}
		part.write(Paths.get(realPart, fileName).toString());
		String str = name + fileName;
		return str;
	}
	
	public static String addDataCourse(Part part, String realPart) throws IOException, ServletException {
		String originalFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
		if(originalFileName.equals("")){
			return null;
		}
		String fileName = Check(realPart, originalFileName);
		if (!Files.exists(Paths.get(realPart))) {
			Files.createDirectories(Paths.get(realPart));
		}
		part.write(Paths.get(realPart, fileName).toString());
		String str = "course-data/" + fileName;
		return str;
	}

	public static String getName() {
		return name;
	}

	public static void setName(String name) {
		FileData.name = name;
	}
}
