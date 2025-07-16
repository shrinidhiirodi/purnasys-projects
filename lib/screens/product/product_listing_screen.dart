import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Search Bar
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search products',
                          prefixIcon: const Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Header Row
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        color: Colors.grey.shade300,
                        child: Row(
                          children: const [
                            SizedBox(width: 80, child: Text('Qr Code')),
                            Expanded(flex: 5, child: Text('Product Name')),
                            SizedBox(width: 80, child: Text('Price')),
                          ],
                        ),
                      ),

                      // Product List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 80,
                                    child: Icon(Icons.qr_code, size: 30),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Product Nkctdhbkjgcnscsl Nkctdhbdv',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 2),
                                        const Text(
                                          'Offers: Discount 20%',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: const [
                                            Icon(Icons.star, size: 14, color: Colors.amber),
                                            SizedBox(width: 4),
                                            Text('(4.5)', style: TextStyle(fontSize: 12)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 80,
                                    child: Text('Rs. 250'),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),

                              // Buttons row
                              Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/product-details');
                                    },
                                    child: const Text('Details'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/cart-details');
                                    },
                                    child: const Text('Add to cart'),
                                  ),
                                ],
                              ),

                              const Divider(),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
