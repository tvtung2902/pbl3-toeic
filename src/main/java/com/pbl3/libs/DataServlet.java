package com.pbl3.libs;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet({"/data/*", "/course-data/*"})
public class DataServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("vao day de show anh ");
        // Lấy đường dẫn tệp ảnh từ URL
        String imagePath = request.getPathInfo();
        
        // Kiểm tra nếu đường dẫn tệp không tồn tại hoặc là một thư mục
        if (imagePath == null || imagePath.equals("/") || imagePath.equals("")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        
        // Đường dẫn thực của tệp ảnh trên máy chủ
        String realPath = "";
        if (request.getServletPath().startsWith("/data")) realPath = getServletContext().getRealPath("/data" + imagePath);
        else if (request.getServletPath().startsWith("/course-data")) realPath = getServletContext().getRealPath("/course-data" + imagePath);
        // Mở luồng để đọc dữ liệu từ tệp ảnh
        try (InputStream inputStream = new FileInputStream(realPath);
             OutputStream outputStream = response.getOutputStream()) {
             
            // Đặt kiểu MIME cho phản hồi dựa trên định dạng của tệp ảnh
            response.setContentType(getServletContext().getMimeType(realPath));
            
            // Đọc dữ liệu từ tệp ảnh và ghi vào luồng đầu ra của phản hồi
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }
    }
}

