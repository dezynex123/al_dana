import 'dart:developer';
import 'dart:io';
import 'package:al_dana/app/modules/invoice/api/pdf_api.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import '../provider/invoice_provider.dart';

class PDFInvoiceApi {
  static Future<File> generate(
      InvoiceProvider invoice, double vatPercentage) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      pageFormat: const PdfPageFormat(
        80.0 * PdfPageFormat.mm,
        297.0 * PdfPageFormat.mm,
        marginAll: 8.0,
      ),
      build: (context) => [
        header(invoice),
        subDetails(invoice),
        invoiceTable(invoice, vatPercentage),
        invoiceFooter(invoice, vatPercentage),
      ],
    ));
    return PdfApi.saveDocument(
      name: '${invoice.invoice?.data?.invoiceDetails?[0].invoiceNumber}.pdf',
      pdf: pdf,
    );
  }

  static Widget header(InvoiceProvider invoice) {
    final invoiceDetails = invoice.invoice?.data?.invoiceDetails?[0];
    final branchAddress = invoice.invoice?.data?.branchAddress;
    String filterString(String input) {
      String filteredString = '';

      for (int i = 0; i < input.length; i++) {
        final char = input[i];
        final codeUnit = char.codeUnitAt(0);

        if ((codeUnit >= 65 && codeUnit <= 90) ||
            (codeUnit >= 97 && codeUnit <= 122) ||
            (codeUnit >= 48 && codeUnit <= 57) ||
            ' !@#\$%^&*()_+={}[]:;"\',.<>?/\\|`~'.contains(char)) {
          filteredString += char;
        }
      }
      log(filteredString);
      return filteredString;
    }

    String filteredString = filterString(branchAddress?.location ?? '');
    String cleanString(String input) {
      final cleanedString = input.replaceAll(RegExp(r'\s+'), ' ');

      final finalCleanedString =
          cleanedString.replaceAll(RegExp(r',{2,}'), ',');

      return finalCleanedString.trim();
    }

    final address = cleanString(filteredString);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            invoiceDetails?.bookingId?.branchId?.name?.toUpperCase() ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Mob No: ${branchAddress?.mob}, P.O: ${branchAddress?.po}',
            style: const TextStyle(fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            address.trim().replaceAll(',', '').replaceAll('  ', ','),
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'TRN: ${branchAddress?.trn}',
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  static Widget subDetails(InvoiceProvider invoice) {
    final invoiceDetails = invoice.invoice?.data?.invoiceDetails?[0];
    String invoiceDateString = invoiceDetails?.createdAt ?? '';
    DateTime? dateTime;
    if (invoiceDateString.isNotEmpty) {
      dateTime = DateTime.tryParse(invoiceDateString);
    }
    String invoiceDate =
        dateTime != null ? DateFormat('dd-MM-yyyy').format(dateTime) : '';
    final vehicleDetails = invoiceDetails?.bookingId?.vehicleId;
    return Column(
      children: [
        Divider(),
        Text(
          'TAX INVOICE',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Inv No:${invoiceDetails?.invoiceNumber}',
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                'Date: $invoiceDate',
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 8),
        Text(
          'Customer:  ${vehicleDetails?.plateNumber} ${vehicleDetails?.carBrandId?.title} ${vehicleDetails?.carModelId?.title}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(height: 8),
        Divider(),
      ],
    );
  }

  static Widget invoiceTable(InvoiceProvider invoice, double percentage) {
    final invoiceDetails = invoice.invoice?.data?.invoiceDetails?[0];
    final headers = [
      'ITEM',
      'VAT(%)',
      'QTY',
      'PRICE',
    ];
    double vatPercentage = percentage.toDouble();

    final data = <List<String?>>[];

    if (invoiceDetails?.bookingId?.service != null &&
        invoiceDetails!.bookingId!.service!.isNotEmpty) {
      for (final service in invoiceDetails.bookingId!.service!) {
        final serviceRow = [
          service.serviceId?.title ?? '',
          vatPercentage.toString(),
          invoiceDetails.bookingId?.service?.length.toString(),
          (service.serviceId?.price ?? 0 * 100 / (100 + vatPercentage))
              .toStringAsFixed(2),
        ];
        data.add(serviceRow);
      }
    }

    if (invoiceDetails?.bookingId?.package != null &&
        invoiceDetails!.bookingId!.package!.isNotEmpty) {
      for (final package in invoiceDetails.bookingId!.package!) {
        final packageRow = [
          package.packageId?.title ?? '',
          vatPercentage.toString(),
          invoiceDetails.bookingId?.package?.length.toString(),
          (package.packageId?.price ?? 0 * 100 / (100 + vatPercentage))
              .toStringAsFixed(2),
        ];
        data.add(packageRow);
      }
    }

    if (invoiceDetails?.bookingId?.spare != null &&
        invoiceDetails!.bookingId!.spare!.isNotEmpty) {
      for (final spare in invoiceDetails.bookingId!.spare!) {
        final spareRow = [
          spare.spareId?.title ?? '',
          vatPercentage.toString(),
          spare.spareId?.quantity.toString(),
          (spare.spareId?.price ?? 0 * 100 / (100 + vatPercentage))
              .toStringAsFixed(3),
        ];
        data.add(spareRow);
      }
    }
    final totalAmount = (invoiceDetails?.bookingId?.totalAmount ??
            0 * 100 / (100 + vatPercentage))
        .toStringAsFixed(2);
    final taxAmount = (invoiceDetails?.bookingId?.totalAmount ??
            0 * vatPercentage / (100 + vatPercentage))
        .toStringAsFixed(2);

    data.add(['Total', '', '', 'AED $totalAmount']);
    data.add(
        ['VAT@$vatPercentage', 'Gross:\n$totalAmount', '', 'Tax:\n$taxAmount']);

    return Table.fromTextArray(
      border: null,
      headerStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      cellStyle: const TextStyle(
        fontSize: 10,
      ),
      headers: headers,
      headerDecoration: const BoxDecoration(color: PdfColors.grey300),
      data: data,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.center,
        2: Alignment.center,
        3: Alignment.centerRight,
      },
    );
  }

  static Widget invoiceFooter(InvoiceProvider invoice, double vatPercentage) {
    final invoiceDetails = invoice.invoice?.data?.invoiceDetails?[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 8),
          Divider(),
          Row(
            children: [
              Text(
                'Invoice Discount',
                style: const TextStyle(fontSize: 12),
              ),
              Spacer(),
              Text(
                invoiceDetails!.bookingId!.discountAmount!.toStringAsFixed(3),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Total Before VAT',
                style: const TextStyle(fontSize: 12),
              ),
              Spacer(),
              Text(
                ((invoiceDetails.bookingId!.totalAmount! *
                            100 /
                            (100 + vatPercentage)) -
                        (invoiceDetails.bookingId!.discountAmount!))
                    .toStringAsFixed(3),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                'VAT amount',
                style: const TextStyle(fontSize: 12),
              ),
              Spacer(),
              Text(
                (invoiceDetails.bookingId!.totalAmount! *
                        vatPercentage /
                        (100 + vatPercentage))
                    .toStringAsFixed(3),
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Spacer(),
              Text(
                "AED ${invoiceDetails.bookingId!.totalAmount!.toStringAsFixed(3)}",
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(),
          Row(
            children: [
              Text(
                'BILL AMOUNT',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                "AED ${invoiceDetails.bookingId!.totalAmount!.toStringAsFixed(3)}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider()
        ],
      ),
    );
  }
}
