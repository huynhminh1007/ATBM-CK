package Utils.pdf;

import com.google.common.base.Charsets;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDDocumentInformation;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

public class PdfHelper {
    private String sanitizeHtml(String html) {
        Document document = Jsoup.parse(html);
        document.outputSettings()
                .syntax(Document.OutputSettings.Syntax.xml)
                .charset(Charsets.UTF_8); // Đảm bảo mã hóa UTF-8
        document.head().appendElement("meta").attr("charset", "UTF-8"); // Thêm meta charset
        return document.html();
    }

    public byte[] generatePdfFromHtml(String html) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            // Sanitize the HTML using Jsoup
            String sanitizedHtml = sanitizeHtml(html);

            sanitizedHtml = sanitizedHtml.replace(
                    "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;\">",
                    "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px; font-size: 12px;\">"
            );

            // Set up the PDF renderer
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode(); // Optional: Enable fast rendering mode
            builder.withHtmlContent(sanitizedHtml, null);
            builder.toStream(outputStream);

            // Add font for Vietnamese support
            // Load font từ thư mục resources/fonts
            builder.useFont(new File(getClass()
                    .getClassLoader()
                    .getResource("fonts/ARIAL.TTF")
                    .toURI()), "Arial");


            builder.run();
            return outputStream.toByteArray();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public byte[] generatePdfFromHtml(String html, String userId, String orderId, String digitalSignature) {
        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            // Sanitize the HTML
            String sanitizedHtml = sanitizeHtml(html);

            sanitizedHtml = sanitizedHtml.replace(
                    "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px;\">",
                    "<div style=\"font-family: Arial, sans-serif; max-width: 600px; margin: 0 auto; padding: 20px; background-color: #f5f5f5; border: 1px solid #ddd; border-radius: 8px; font-size: 12px;\">"
            );

            // Render HTML to PDF
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.useFastMode();
            builder.withHtmlContent(sanitizedHtml, null);
            builder.toStream(outputStream);

            builder.useFont(new File(getClass()
                    .getClassLoader()
                    .getResource("fonts/ARIAL.TTF")
                    .toURI()), "Arial");

            builder.run();

            // Add metadata to the PDF
            try (PDDocument pdfDocument = PDDocument.load(outputStream.toByteArray())) {
                PDDocumentInformation metadata = pdfDocument.getDocumentInformation();
                metadata.setTitle("Order Invoice");
                metadata.setAuthor("Lương Thực Việt");
                metadata.setSubject("Order Details");
                metadata.setKeywords("invoice, order, digital signature");
                metadata.setCustomMetadataValue("DigitalSignature", digitalSignature);
                metadata.setCustomMetadataValue("UserId", userId);
                metadata.setCustomMetadataValue("OrderId", orderId);

                // Save the PDF with updated metadata
                ByteArrayOutputStream finalOutput = new ByteArrayOutputStream();
                pdfDocument.save(finalOutput);
                return finalOutput.toByteArray();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void verifyPdfMetadata(File pdfFile) {
        try (PDDocument pdfDocument = PDDocument.load(pdfFile)) {
            // Truy xuất metadata
            PDDocumentInformation metadata = pdfDocument.getDocumentInformation();

            // In thông tin metadata chung
            System.out.println("Title: " + metadata.getTitle());
            System.out.println("Author: " + metadata.getAuthor());
            System.out.println("Subject: " + metadata.getSubject());
            System.out.println("Keywords: " + metadata.getKeywords());

            // Lấy chữ ký điện tử từ metadata (Custom Metadata)
            String digitalSignature = metadata.getCustomMetadataValue("DigitalSignature");
            System.out.println("Digital Signature: " + digitalSignature);

            String userId = metadata.getCustomMetadataValue("UserId");
            System.out.println("User Id: " + userId);

            String orderId = metadata.getCustomMetadataValue("OrderId");
            System.out.println("Order Id: " + orderId);

            // Xác minh chữ ký
            if (digitalSignature != null && !digitalSignature.isEmpty()) {
                System.out.println("Chữ ký điện tử hợp lệ: " + digitalSignature);
            } else {
                System.out.println("Không tìm thấy chữ ký điện tử.");
            }
        } catch (IOException e) {
            System.err.println("Không thể đọc file PDF: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        // Đường dẫn đến file PDF cần xác minh
        File pdfFile = new File("C:\\Users\\DLCD\\Downloads\\Order_ODR92.pdf");
        verifyPdfMetadata(pdfFile);
    }
}
