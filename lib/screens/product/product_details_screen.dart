import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: maxWidth),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top Bar
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Image.asset(
                              'assets/icons/homepage/icon_epurna_logo.png',
                              height: 40,
                            ),
                            Image.asset(
                              'assets/icons/homepage/icon_help.png',
                              width: 28,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        const Text(
                          'Products',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 12),

                        // Product Title & Rating
                        const Text(
                          'Product Nkctdhbkjgcnscsl Nkctdhbdvhhhh',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: const [
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            Icon(Icons.star, size: 16, color: Colors.amber),
                            Icon(Icons.star_half, size: 16, color: Colors.amber),
                            Icon(Icons.star_border, size: 16, color: Colors.amber),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Product Image
                        Container(
                          width: double.infinity,
                          height: 200,
                          color: Colors.grey.shade300,
                          child: const Center(child: Icon(Icons.image, size: 80)),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Price & Description
                        const Text('MRP: 1200',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const Text(
                          'Product Nkctdhbkjgcnscsl Nkctdhbdv',
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 16),

                        // Add to Cart & Buy Now Buttons
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber.shade400,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart-details');
                          },
                          child: const Text(
                            'ADD TO CART',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cart-details');
                          },
                          child: const Text(
                            'BUY NOW',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
