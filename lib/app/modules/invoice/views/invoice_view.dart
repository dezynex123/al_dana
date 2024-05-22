import 'package:al_dana/app/data/data.dart';
import 'package:al_dana/app/modules/invoice/provider/invoice_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../data/providers/vat_provider.dart';
import '../api/pdf_api.dart';
import '../api/pdf_invoice_api.dart';
import '../widgets/invoice_divider.dart';
import '../widgets/invoice_spacer.dart';
import '../widgets/invoice_split.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({super.key});

  @override
  State<InvoiceView> createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  @override
  void initState() {
    super.initState();
    Provider.of<VATProvider>(context, listen: false).fetchVAT();
  }

  @override
  Widget build(BuildContext context) {
    final invoice = Provider.of<InvoiceProvider>(context);
    final invoiceDetails = invoice.invoice?.data?.invoiceDetails?[0];
    final branchAddress = invoice.invoice?.data?.branchAddress;
    String invoiceDateString = invoiceDetails?.createdAt ?? '';
    DateTime? dateTime;
    final width = MediaQuery.of(context).size.width;
    if (invoiceDateString.isNotEmpty) {
      dateTime = DateTime.tryParse(invoiceDateString);
    }
    String invoiceDate =
        dateTime != null ? DateFormat('dd-MM-yyyy').format(dateTime) : '';
    final vehicleDetails = invoiceDetails?.bookingId?.vehicleId;
    double vatPercentage = double.parse(
        Provider.of<VATProvider>(context).vat!.data![0].percentage.toString());

    return Scaffold(
      backgroundColor: bgColor1,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        title: const Text('Invoice'),
        backgroundColor: primary,
      ),
      body: invoice.isLoading
          ? const Center(child: CircularProgressIndicator())
          : invoice.hasError
              ? const Center(child: Text('Failed to load Invoice'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                        ),
                        margin:
                            const EdgeInsets.only(top: 6, right: 10, left: 10),
                        width: double.infinity,
                        child: Column(
                          children: [
                            const InvoiceSpacer(),
                            Text(
                              invoiceDetails?.bookingId?.branchId?.name
                                      ?.toUpperCase() ??
                                  '',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const InvoiceSpacer(),
                            Text(
                                'Mob No: ${branchAddress?.mob}, P.O: ${branchAddress?.po}'),
                            const InvoiceSpacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(branchAddress?.location ?? ''),
                            ),
                            const InvoiceSpacer(),
                            Text('TRN: ${branchAddress?.trn}'),
                            const InvoiceSpacer(),
                            const InvoiceDivider(),
                            const Text(
                              'TAX INVOICE',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const InvoiceDivider(),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      'Inv No:${invoiceDetails?.invoiceNumber}'),
                                  Text('Date: $invoiceDate')
                                ],
                              ),
                            ),
                            const InvoiceDivider(),
                            const InvoiceSpacer(),
                            Text(
                              'Customer:  ${vehicleDetails?.plateNumber} ${vehicleDetails?.carBrandId?.title} ${vehicleDetails?.carModelId?.title}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w500),
                            ),
                            const InvoiceSpacer(),
                            const InvoiceDivider(),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Ph:'),
                                  Text('Trn'),
                                ],
                              ),
                            ),
                            const InvoiceDivider(),
                            DataTable(
                              columns: const <DataColumn>[
                                DataColumn(
                                  label: Text('ITEM'),
                                ),
                                DataColumn(
                                  label: Text('VAT'),
                                ),
                                DataColumn(
                                  label: Text('QTY'),
                                ),
                                DataColumn(
                                  label: Text('PRICE'),
                                ),
                              ],
                              rows: [
                                if (invoiceDetails!
                                        .bookingId!.service!.isNotEmpty ||
                                    invoiceDetails.bookingId!.service != [])
                                  ...invoiceDetails.bookingId!.service!.map(
                                    (service) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(service.serviceId?.title ?? ''),
                                        ),
                                        DataCell(
                                          Text(vatPercentage.toString()),
                                        ),
                                        DataCell(
                                          Text(invoiceDetails
                                              .bookingId!.service!.length
                                              .toString()),
                                        ),
                                        DataCell(
                                          Text((service.serviceId!.price! *
                                                  100 /
                                                  (100 + vatPercentage))
                                              .toStringAsFixed(3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (invoiceDetails
                                        .bookingId!.package!.isNotEmpty ||
                                    invoiceDetails.bookingId!.package != [])
                                  ...invoiceDetails.bookingId!.package!.map(
                                    (package) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(package.packageId?.title ?? ''),
                                        ),
                                        DataCell(
                                          Text(vatPercentage.toString()),
                                        ),
                                        DataCell(
                                          Text(invoiceDetails
                                              .bookingId!.package!.length
                                              .toString()),
                                        ),
                                        DataCell(
                                          Text((package.packageId!.price! *
                                                  100 /
                                                  (100 + vatPercentage))
                                              .toStringAsFixed(3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (invoiceDetails
                                        .bookingId!.spare!.isNotEmpty ||
                                    invoiceDetails.bookingId!.spare != [])
                                  ...invoiceDetails.bookingId!.spare!.map(
                                    (spare) => DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text(spare.spareId?.title ?? ''),
                                        ),
                                        DataCell(
                                          Text(vatPercentage.toString()),
                                        ),
                                        DataCell(
                                          Text(spare.spareId!.quantity
                                              .toString()),
                                        ),
                                        DataCell(
                                          Text((spare.spareId!.price! *
                                                  100 /
                                                  (100 + vatPercentage))
                                              .toStringAsFixed(3)),
                                        ),
                                      ],
                                    ),
                                  ),
                                DataRow(
                                  cells: <DataCell>[
                                    const DataCell(
                                      Text('Total'),
                                    ),
                                    const DataCell(SizedBox()),
                                    const DataCell(SizedBox()),
                                    DataCell(Text(
                                      'AED ${(invoiceDetails.bookingId!.totalAmount! * 100 / (100 + vatPercentage)).toStringAsFixed(3)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ],
                                ),
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                      Text(
                                        'VAT@$vatPercentage',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        'Gross:\n${(invoiceDetails.bookingId!.totalAmount! * 100 / (100 + vatPercentage)).toStringAsFixed(3)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const DataCell(SizedBox()),
                                    DataCell(
                                      Text(
                                        'Tax:\n${(invoiceDetails.bookingId!.totalAmount! * vatPercentage / (100 + vatPercentage)).toStringAsFixed(3)}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const InvoiceDivider(),
                            const InvoiceSpacer(),
                            InvoiceSplit(
                              name: 'Invoice Discount',
                              width: width,
                              price: invoiceDetails.bookingId!.discountAmount!
                                  .toStringAsFixed(3),
                            ),
                            const InvoiceSpacer(),
                            InvoiceSplit(
                              name: 'Total Before VAT',
                              width: width,
                              price: ((invoiceDetails.bookingId!.totalAmount! *
                                          100 /
                                          (100 + vatPercentage)) -
                                      (invoiceDetails
                                          .bookingId!.discountAmount!))
                                  .toStringAsFixed(3),
                            ),
                            const InvoiceSpacer(),
                            InvoiceSplit(
                              name: 'VAT amount',
                              width: width,
                              price: (invoiceDetails.bookingId!.totalAmount! *
                                      vatPercentage /
                                      (100 + vatPercentage))
                                  .toStringAsFixed(3),
                            ),
                            const InvoiceSpacer(),
                            InvoiceSplit(
                              name: '',
                              width: width,
                              price:
                                  "AED ${invoiceDetails.bookingId!.totalAmount!.toStringAsFixed(3)}",
                            ),
                            const InvoiceSpacer(),
                            const InvoiceDivider(),
                            const InvoiceSpacer(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'BILL AMOUNT',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "AED ${invoiceDetails.bookingId!.totalAmount!.toStringAsFixed(3)}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const InvoiceSpacer(),
                          ],
                        ),
                      ),
                      const InvoiceSpacer(),
                      ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(backgroundColor: primary),
                        onPressed: () async {
                          final pdfFile = await PDFInvoiceApi.generate(
                            invoice,
                            vatPercentage,
                          );
                          PdfApi.openFile(pdfFile);
                        },
                        child: const Text('Download PDF'),
                      ),
                      const InvoiceSpacer(),
                    ],
                  ),
                ),
    );
  }
}
