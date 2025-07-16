import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),

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
                        children: List.generate(3, (index) {
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2),
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 16),

                      const Text(
                        'MRP: 1200',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Product Nkctdhbkjgcnscsl Nkctdhbdv',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),

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
          );
        },
      ),
    );
  }
}
