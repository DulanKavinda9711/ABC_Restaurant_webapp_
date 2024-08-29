package com.abc.util;

import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.properties.UnitValue;
import com.itextpdf.layout.element.Cell;

import com.abc.model.Reservation;


import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class PDFUtil {

    public static ByteArrayOutputStream generateReservationPDF(List<Reservation> reservations) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();  // Use java.io.ByteArrayOutputStream
        try {
            PdfWriter writer = new PdfWriter(baos);
            PdfDocument pdfDoc = new PdfDocument(writer);
            Document document = new Document(pdfDoc);

            // Sort reservations in reverse order by date and time
            Collections.sort(reservations, new Comparator<Reservation>() {
                @Override
                public int compare(Reservation r1, Reservation r2) {
                    String dateTime1 = r1.getDate() + " " + r1.getTime();
                    String dateTime2 = r2.getDate() + " " + r2.getTime();
                    return dateTime2.compareTo(dateTime1);  // Reverse order
                }
            });

            // Add title
            document.add(new Paragraph("Reservations List").setBold().setFontSize(18));

            // Filter reservations by status
            List<Reservation> acceptedReservations = reservations.stream()
                    .filter(r -> "Accepted".equalsIgnoreCase(r.getStatus()))
                    .collect(Collectors.toList());

            List<Reservation> rejectedReservations = reservations.stream()
                    .filter(r -> "Rejected".equalsIgnoreCase(r.getStatus()))
                    .collect(Collectors.toList());

            List<Reservation> pendingReservations = reservations.stream()
                    .filter(r -> "Pending".equalsIgnoreCase(r.getStatus()))
                    .collect(Collectors.toList());

            // Add tables for each reservation status
            if (!acceptedReservations.isEmpty()) {
                document.add(new Paragraph("Accepted Reservations").setBold().setFontSize(14));
                document.add(createTable(acceptedReservations, new DeviceRgb(0, 128, 0)));  // Green header
            }

            if (!rejectedReservations.isEmpty()) {
                document.add(new Paragraph("Rejected Reservations").setBold().setFontSize(14));
                document.add(createTable(rejectedReservations, new DeviceRgb(255, 0, 0)));  // Red header
            }

            if (!pendingReservations.isEmpty()) {
                document.add(new Paragraph("Pending Reservations").setBold().setFontSize(14));
                document.add(createTable(pendingReservations, new DeviceRgb(255, 165, 0)));  // Orange header
            }

            document.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return baos;
    }

    private static Table createTable(List<Reservation> reservations, Color headerColor) {
        // Create a table with column headers
        Table table = new Table(new float[]{1, 2, 2, 2, 2, 1});
        table.setWidth(UnitValue.createPercentValue(100)); // Set table width to 100% of the page

        // Add header cells with the specified color
        table.addHeaderCell(new Cell().add(new Paragraph("ID")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));
        table.addHeaderCell(new Cell().add(new Paragraph("Name")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));
        table.addHeaderCell(new Cell().add(new Paragraph("Email")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));
        table.addHeaderCell(new Cell().add(new Paragraph("Phone")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));
        table.addHeaderCell(new Cell().add(new Paragraph("Date & Time")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));
        table.addHeaderCell(new Cell().add(new Paragraph("Status")).setBackgroundColor(headerColor).setFontColor(new DeviceRgb(255, 255, 255)));

        // Populate the table with reservation data
        for (Reservation reservation : reservations) {
            table.addCell(new Cell().add(new Paragraph(String.valueOf(reservation.getReservationId()))));
            table.addCell(new Cell().add(new Paragraph(reservation.getName())));
            table.addCell(new Cell().add(new Paragraph(reservation.getEmail())));
            table.addCell(new Cell().add(new Paragraph(reservation.getPhone())));
            table.addCell(new Cell().add(new Paragraph(reservation.getDate() + " " + reservation.getTime())));
            table.addCell(new Cell().add(new Paragraph(reservation.getStatus())));
        }

        return table;
    }
}
