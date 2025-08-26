import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../common/widgets/base_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  final List<Map<String, dynamic>> invoiceItems = const [
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 250,
      'gst': 20,
      'rating': 4.5,
      'discount': '20%',
      'qr': 'assets/icons/homepage/icon_qr.png',
      'image': 'assets/icons/homepage/shopping_section.png'
    },
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 15000,
      'gst': 0,
      'rating': 0.0,
      'discount': null,
      'qr': 'assets/icons/homepage/icon_qr.png',
      'image': 'assets/icons/homepage/shopping_section.png'
    },
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 1400,
      'gst': 0,
      'rating': 0.0,
      'discount': null,
      'qr': 'assets/icons/homepage/icon_qr.png',
      'image': 'assets/icons/homepage/shopping_section.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Order # 12332123', style: TextStyle(fontSize: 16)),
              const Text('Tracking # 12222333', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Cost: 4500', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('GST (9%): 430', style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 12),

              // Table Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey.shade300,
                child: const Row(
                  children: [
                    Expanded(child: Center(child: Text('Qr Code', style: TextStyle(fontWeight: FontWeight.bold)))),
                    Expanded(child: Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold))),
                    Expanded(child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
              const SizedBox(height: 8),

              // Product List
              ...invoiceItems.map((item) => _buildItemCard(item)).toList(),
              const SizedBox(height: 20),

              // Address
              const Text('Shipping Address:', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 6),
              const Text(
                '4th floor, Church Road,\nMadhavarao Circle,\nBasavanagudi, Bengaluru,\nKarnataka 560004',
                style: TextStyle(height: 1.4),
              ),
              const SizedBox(height: 24),

              // Download Invoice
              ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: () => generateAndDownloadInvoicePdf(),
                child: const Text('DOWNLOAD INVOICE'),
              ),
              const SizedBox(height: 12),

              // Share Invoice
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () => generateAndShareInvoicePdf(),
                child: const Text('SHARE VIA WHATSAPP'),
              ),
              const SizedBox(height: 20),
              const Center(child: Text('SIGN OUT', style: TextStyle(color: Colors.grey))),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildItemCard(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Image.asset(item['qr'], width: 48, height: 48)),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                if (item['discount'] != null)
                  Text("Offers:\nDiscount ${item['discount']}", style: const TextStyle(color: Colors.red)),
                if (item['rating'] > 0)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < item['rating'].round() ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 16,
                        );
                      }),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Rs. ${item['price']}'),
                if (item['gst'] > 0) Text('Rs. ${item['gst']} (GST)'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> generateAndDownloadInvoicePdf() async {
    final pdfBytes = await _buildPdfDocument();
    await Printing.layoutPdf(onLayout: (_) async => pdfBytes);
  }

  Future<void> generateAndShareInvoicePdf() async {
    final pdfBytes = await _buildPdfDocument();
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/invoice.pdf');
    await file.writeAsBytes(pdfBytes);
    await Share.shareXFiles([XFile(file.path)], text: 'Here is your e-Purna invoice');
  }

  Future<Uint8List> _buildPdfDocument() async {
    final pdf = pw.Document();
    final ByteData logoData = await rootBundle.load('assets/icons/homepage/icon_epurna_logo.png');
    final Uint8List logoBytes = logoData.buffer.asUint8List();
    final pw.ImageProvider logoImage = pw.MemoryImage(logoBytes);
    final fontData = await rootBundle.load('assets/fonts/NotoSans-Regular.ttf');
    final pw.Font ttf = pw.Font.ttf(fontData);

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Image(logoImage, width: 60, height: 60),
              pw.Text('INVOICE', style: pw.TextStyle(font: ttf, fontSize: 22, fontWeight: pw.FontWeight.bold)),
            ],
          ),
          pw.SizedBox(height: 20),
          ...invoiceItems.map((item) => pw.Column(children: [
            pw.Text(item['title'], style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold)),
            pw.Text('Price: ₹${item['price']}', style: pw.TextStyle(font: ttf)),
            if (item['gst'] > 0) pw.Text('GST: ₹${item['gst']}', style: pw.TextStyle(font: ttf)),
            if (item['rating'] > 0) pw.Text('Rating: ${item['rating']}/5', style: pw.TextStyle(font: ttf)),
            pw.SizedBox(height: 8),
          ])),
          pw.Divider(),
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('Total', style: pw.TextStyle(font: ttf, fontSize: 18, fontWeight: pw.FontWeight.bold)),
              pw.Text('₹2000', style: pw.TextStyle(font: ttf, fontSize: 18)),
            ],
          ),
          pw.SizedBox(height: 20),
          pw.Text('Shipping Address:', style: pw.TextStyle(font: ttf, fontWeight: pw.FontWeight.bold)),
          pw.Text('4th floor, Church Road,\nMadhavarao Circle,\nBasavanagudi, Bengaluru,\nKarnataka 560004', style: pw.TextStyle(font: ttf)),
        ],
      ),
    );

    return pdf.save();
  }
}
