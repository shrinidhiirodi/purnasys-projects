import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class OrderConfirmationScreen extends StatefulWidget {
  const OrderConfirmationScreen({super.key});

  @override
  State<OrderConfirmationScreen> createState() => _OrderConfirmationScreenState();
}

class _OrderConfirmationScreenState extends State<OrderConfirmationScreen> {
  final ScreenshotController screenshotController = ScreenshotController();

  final List<Map<String, dynamic>> invoiceItems = [
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 250,
      'gst': 20,
      'rating': 4.5,
      'discount': '20%',
      'qr': 'assets/icons/homepage/icon_qr.png',
    },
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 350,
      'gst': 35,
      'rating': 4.5,
      'discount': '20%',
      'qr': 'assets/icons/homepage/icon_qr.png',
    },
    {
      'title': 'Product Nkctdhb kjgcnscsl Nkctdhbdv',
      'price': 1400,
      'gst': 140,
      'rating': 0.0,
      'discount': null,
      'qr': 'assets/icons/homepage/icon_qr.png',
    },
  ];

  Future<void> _downloadPdf() async {
    final Uint8List? capturedImage = await screenshotController.capture();
    if (capturedImage != null) {
      await Printing.layoutPdf(onLayout: (format) => capturedImage);
    }
  }

  Future<void> _sharePdf() async {
    final Uint8List? capturedImage = await screenshotController.capture();
    if (capturedImage != null) {
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/invoice_screenshot.pdf');
      await file.writeAsBytes(capturedImage);
      await Share.shareXFiles([XFile(file.path)], text: 'Your e-Purna Invoice');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double maxWidth = MediaQuery.of(context).size.width;

    return BaseScreen(
      showBackButton: true,
      child: Screenshot(
        controller: screenshotController,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final double responsiveWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

            return Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: responsiveWidth),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Address:', style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 4),
                            Text(
                              '4th floor, Church Road,\nMadhavarao Circle,\nBasavanagudi, Bengaluru,\nKarnataka 560004',
                            ),
                            SizedBox(height: 12),
                            Text('Order # 12332123', style: TextStyle(fontSize: 16)),
                            Text('Tracking # 12222333', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),

                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Cost: 4500', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('GST (9%): 430', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      Container(
                        color: Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child: const Row(
                          children: [
                            Expanded(flex: 2, child: Text("Qr Code")),
                            Expanded(flex: 4, child: Text("Product Name")),
                            Expanded(flex: 2, child: Text("Price")),
                          ],
                        ),
                      ),

                      const SizedBox(height: 12),

                      ...invoiceItems.map((item) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IntrinsicHeight(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // QR
                                    Image.asset(
                                      item['qr'],
                                      height: 48,
                                      width: 48,
                                    ),
                                    const SizedBox(width: 8),

                                    // Product Info
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(item['title']),
                                          const SizedBox(height: 6),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, '/product-details');
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor: const Color(0xFFF2F2F2),
                                              foregroundColor: Colors.black,
                                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(16),
                                              ),
                                              elevation: 1,
                                            ),
                                            child: const Text('Details'),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 8),

                                    // Pricing
                                    ConstrainedBox(
                                      constraints: const BoxConstraints(maxWidth: 120),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text('Rs. ${item['price']}'),
                                          if (item['gst'] > 0) Text('Rs. ${item['gst']} (GST)'),
                                          const SizedBox(height: 4),
                                          if (item['discount'] != null)
                                            const Wrap(
                                              spacing: 4,
                                              children: [
                                                Text('Offers:', style: TextStyle(fontWeight: FontWeight.bold)),
                                                Text('Discount', style: TextStyle(fontSize: 12)),
                                                Text('20%', style: TextStyle(fontSize: 12, color: Colors.red)),
                                              ],
                                            ),
                                          if (item['rating'] > 0)
                                            Wrap(
                                              spacing: 2,
                                              children: List.generate(5, (index) {
                                                return Icon(
                                                  index < item['rating'].round()
                                                      ? Icons.star
                                                      : Icons.star_border,
                                                  size: 14,
                                                  color: Colors.orange,
                                                );
                                              }),
                                            ),
                                          const SizedBox(height: 4),
                                          const Text('Qty: 1', style: TextStyle(fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),

                      const SizedBox(height: 24),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: const Color(0xFFFADADA),
                            foregroundColor: Colors.black,
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: _downloadPdf,
                          child: const Text('DOWNLOAD INVOICE'),
                        ),
                      ),

                      const SizedBox(height: 12),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onPressed: _sharePdf,
                          child: const Text('SHARE VIA WHATSAPP'),
                        ),
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
