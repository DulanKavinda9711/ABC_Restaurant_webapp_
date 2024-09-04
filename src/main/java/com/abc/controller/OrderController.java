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

        // Define fonts for styling
        Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD);
        Font normalFont = new Font(Font.FontFamily.HELVETICA, 12, Font.NORMAL);

        // Add order summary header (centered)
        Paragraph orderSummaryHeader = new Paragraph("Order Summary", new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD));
        orderSummaryHeader.setAlignment(Element.ALIGN_LEFT);
        orderSummaryHeader.setSpacingAfter(10f);
        document.add(orderSummaryHeader);

        // Add customer details as plain text
        document.add(new Paragraph("Customer Name: " + customerName, normalFont));
        document.add(new Paragraph("Order Time: " + orderTime, normalFont));
        document.add(new Paragraph("Customer Address: " + customerAddress, normalFont));

        // Add some space before the next section
        document.add(new Paragraph("\n")); // Adds a blank line for spacing

        // Create a table for the order summary
        PdfPTable orderSummaryTable = new PdfPTable(2);
        orderSummaryTable.setWidthPercentage(100); // Full width of the page
        orderSummaryTable.setSpacingBefore(10f);
        orderSummaryTable.setSpacingAfter(10f);

        // Add order summary and total price rows
        addTableRow(orderSummaryTable, "Order Summary", orderSummary, boldFont, normalFont);
        addTableRow(orderSummaryTable, "Total Price", "Rs " + totalPrice, boldFont, normalFont);

        // Add the order summary table to the document
        document.add(orderSummaryTable);

        // Add a thank you note
        Paragraph thankYouNote = new Paragraph("Thanks for your order!", new Font(Font.FontFamily.HELVETICA, 14, Font.BOLD));
        thankYouNote.setAlignment(Element.ALIGN_CENTER);
        thankYouNote.setSpacingBefore(20f);
        document.add(thankYouNote);
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
