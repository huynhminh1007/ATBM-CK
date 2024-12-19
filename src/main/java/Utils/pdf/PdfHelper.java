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
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

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

    public static Map<String, String> verifyPdfMetadata(InputStream inputStream) {
        try (PDDocument pdfDocument = PDDocument.load(inputStream)) {
            // Truy xuất metadata
            var result = new HashMap<String, String>();
            PDDocumentInformation metadata = pdfDocument.getDocumentInformation();
            // Xác minh chữ ký
            String digitalSignature = metadata.getCustomMetadataValue("DigitalSignature");
            if (digitalSignature != null && !digitalSignature.isEmpty()) {
                result.put("UserId", metadata.getCustomMetadataValue("UserId"));
                result.put("orderId", metadata.getCustomMetadataValue("OrderId"));
                result.put("digitalSignature", digitalSignature);
                return result;
            } else {
                throw new RuntimeException("No digitalSignature found");
            }
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

}
