package Utils;

import com.google.common.base.Charsets;
import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.ByteArrayOutputStream;
import java.io.File;

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
}
