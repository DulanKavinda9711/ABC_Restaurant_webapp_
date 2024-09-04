package com.abc.controller;

import com.abc.model.Order;
import com.abc.service.OrderService;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@WebServlet("/order")
public class OrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderService orderService;

    public void init() throws ServletException {
        orderService = OrderService.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            listOrders(request, response);
        } else if (action.equals("delete")) {
            deleteOrder(request, response);
        } else if (action.equals("generateBill")) {
            generateBill(request, response);
        }
    }

    private void listOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("orders", orderService.getAllOrders());
        request.getRequestDispatcher("WEB-INF/view/listOrders.jsp").forward(request, response);
    }

    private void deleteOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("id"));
        orderService.deleteOrder(orderId);
        request.getSession().setAttribute("message", "Order Deleted Successfully");
        response.sendRedirect("admin");
    }

    // New method for generating order bill PDF
    private void generateBill(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Order order = (Order) session.getAttribute("order");

        if (order == null) {
            response.sendRedirect("errorPage.jsp");
            return;
        }

        // Extracting PDF generation logic to a separate method for better modularity
        generateOrderBillPdf(order, response);
    }

    // Refactored method for generating the PDF to keep the code modular and readable
    private void generateOrderBillPdf(Order order, HttpServletResponse response) throws IOException {
        try (ByteArrayOutputStream baos = new ByteArrayOutputStream()) {
            Document document = new Document();
            PdfWriter.getInstance(document, baos);
            document.open();

            // Add content to the PDF
            addOrderDetailsToPdf(document, order);

            document.close();

            // Send the PDF as a response
            response.setContentType("application/pdf");
            response.setHeader("Content-Disposition", "attachment;filename=order_summary.pdf");
            response.setContentLength(baos.size());
            baos.writeTo(response.getOutputStream());
            response.getOutputStream().flush();
        } catch (DocumentException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp");
        }
    }

    // Helper method to add content to the PDF document
    private void addOrderDetailsToPdf(Document document, Order order) throws DocumentException {
        // Handle potential null values with default empty strings or placeholders
        String customerName = (order.getCustomerName() != null) ? order.getCustomerName() : "Unknown Customer";
        String orderTime = (order.getOrderTime() != null) ? order.getOrderTime() : "Unknown Time";
        String orderSummary = (order.getOrderSummary() != null) ? order.getOrderSummary() : "No details available";
        String customerAddress = (order.getCustomerAddress() != null) ? order.getCustomerAddress() : "Unknown Address";
        double totalPrice = order.getTotalPrice();

        // Create a table with 2 columns for labels and values
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100); // Full width of the page
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);

        // Define fonts for styling
        Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
        Font normalFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

        // Add table headers
        PdfPCell header = new PdfPCell(new Paragraph("Order Summary", new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD)));
        header.setColspan(2); // Span both columns
        header.setHorizontalAlignment(Element.ALIGN_CENTER);
        header.setPadding(10);
        table.addCell(header);

        // Add customer details row by row
        addTableRow(table, "Customer Name", customerName, boldFont, normalFont);
        addTableRow(table, "Order Time", orderTime, boldFont, normalFont);
        addTableRow(table, "Order Summary", orderSummary, boldFont, normalFont);
        addTableRow(table, "Customer Address", customerAddress, boldFont, normalFont);
        addTableRow(table, "Total Price", "Rs " + totalPrice, boldFont, normalFont);

        // Add the table to the document
        document.add(table);
    }

    // Helper method to add a row to the table with labels and values
    private void addTableRow(PdfPTable table, String label, String value, Font labelFont, Font valueFont) {
        PdfPCell labelCell = new PdfPCell(new Paragraph(label, labelFont));
        labelCell.setPadding(5);
        table.addCell(labelCell);

        PdfPCell valueCell = new PdfPCell(new Paragraph(value, valueFont));
        valueCell.setPadding(5);
        table.addCell(valueCell);
    }

}
