import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class OrderReviewScreen extends StatefulWidget { // ----CHANGED----
  const OrderReviewScreen({super.key});

  @override
  State<OrderReviewScreen> createState() => _OrderReviewScreenState(); // ----CHANGED----
}

class _OrderReviewScreenState extends State<OrderReviewScreen> { // ----CHANGED----
  // Track quantity for each line item
  final int _itemCount = 3; // sample items as in the list below // ----CHANGED----
  late List<int> _qty; // ----CHANGED----

  @override
  void initState() { // ----CHANGED----
    super.initState();
    _qty = List<int>.filled(_itemCount, 1);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth =
          ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PAY & CONFIRM Button
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2277B5),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/order-confirmation');
                          },
                          child: const Text(
                            "PAY & CONFIRM",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),

                    const Text("Please review the cart",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),

                    const SizedBox(height: 12),

                    // Shipping Address
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Shipping Address:',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text(
                                  '4th floor, Church Road,\nMadhavarao Circle,\nBasavanagudi, Bengaluru,\nKarnataka 560004',
                                ),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/address-list');
                            },
                            child: const Text("ADD/EDIT ADDRESS"),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Cost Summary (static as before)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Total Cost: 4500'),
                              Text('GST (9%): 430'),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Table Header
                    Container(
                      color: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 8),
                      child: const Row(
                        children: [
                          Expanded(flex: 2, child: Text("Qr Code")),
                          Expanded(flex: 5, child: Text("Product Name")),
                          Expanded(
                            flex: 3,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text("Price"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Product List
                    ...List.generate(_itemCount, (index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Card(
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // QR Code
                                  Image.asset(
                                    'assets/icons/homepage/icon_qr.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                  const SizedBox(width: 8),

                                  // Product Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Product Nkctdhb kjgcnscsl Nkctdhbdv",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500),
                                        ),
                                        const SizedBox(height: 4),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/product-details');
                                          },
                                          style: TextButton.styleFrom(
                                            backgroundColor:
                                            const Color(0xFFF2F2F2),
                                            foregroundColor: Colors.black,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 4),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(16),
                                            ),
                                            elevation: 1,
                                          ),
                                          child: const Text('Details'),
                                        ),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  // Price & Details Column
                                  ConstrainedBox(
                                    constraints:
                                    const BoxConstraints(maxWidth: 120),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        const Text("Rs. 250",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const Text("Rs. 20 (GST)"),
                                        const SizedBox(height: 4),

                                        const Wrap(
                                          spacing: 4,
                                          children: [
                                            Text('Offers:',
                                                style: TextStyle(
                                                    fontWeight:
                                                    FontWeight.bold)),
                                            Text('Discount',
                                                style: TextStyle(fontSize: 12)),
                                            Text('20%',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.red)),
                                          ],
                                        ),

                                        const SizedBox(height: 4),

                                        const Wrap(
                                          spacing: 2,
                                          children: [
                                            Icon(Icons.star,
                                                size: 14, color: Colors.orange),
                                            Icon(Icons.star,
                                                size: 14, color: Colors.orange),
                                            Icon(Icons.star,
                                                size: 14, color: Colors.orange),
                                            Icon(Icons.star,
                                                size: 14, color: Colors.orange),
                                            Icon(Icons.star_half,
                                                size: 14, color: Colors.orange),
                                            Text('(4.5)',
                                                style:
                                                TextStyle(fontSize: 12)),
                                          ],
                                        ),

                                        const SizedBox(height: 6),

                                        // Qty controls
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons
                                                  .remove_circle_outline),
                                              onPressed: () {
                                                setState(() {
                                                  if (_qty[index] > 1) {
                                                    _qty[index]--; // ----CHANGED----
                                                  }
                                                });
                                              },
                                            ),
                                            Text('${_qty[index]}'), // ----CHANGED----
                                            IconButton(
                                              icon: const Icon(Icons
                                                  .add_circle_outline), // ----CHANGED----
                                              onPressed: () {
                                                setState(() {
                                                  _qty[index]++; // ----CHANGED----
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
