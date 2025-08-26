import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

          return SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Products', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      const Text(
                        'Product Nkctdhbkjgcnscsl Nkctdhbdvhhhh',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),

                      // ⭐ Ratings Summary
                      Row(
                        children: const [
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star, size: 16, color: Colors.amber),
                          Icon(Icons.star_half, size: 16, color: Colors.amber),
                          Icon(Icons.star_border, size: 16, color: Colors.amber),
                          SizedBox(width: 6),
                          Text('(4.3/5 • 120 reviews)', style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // 🖼️ Product Image
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

                      const Text('MRP: ₹1200', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text(
                        'Product Nkctdhbkjgcnscsl Nkctdhbdv',
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 16),

                      // 🔢 Quantity Selector
                      Row(
                        children: [
                          const Text('Quantity:', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(width: 12),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: quantity > 1
                                      ? () => setState(() => quantity--)
                                      : null,
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('$quantity'),
                                IconButton(
                                  onPressed: () => setState(() => quantity++),
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber.shade400,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/order-review');
                        },
                        child: const Text('ADD TO CART', style: TextStyle(color: Colors.black)),
                      ),


                      const SizedBox(height: 24),

                      // 🔁 Related Products
                      const Text(
                        'Related Products',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 160,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          separatorBuilder: (_, __) => const SizedBox(width: 12),
                          itemBuilder: (context, index) => Container(
                            width: 120,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.image, size: 60),
                                SizedBox(height: 8),
                                Text('Product ${1}', style: TextStyle(fontSize: 12)),
                                Text('₹999', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 🧾 Reviews
                      const Text(
                        'Customer Reviews',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(2, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                Text('⭐⭐⭐⭐⭐'),
                                SizedBox(height: 4),
                                Text('Great product! Works exactly as expected.'),
                              ],
                            ),
                          ),
                        );
                      }),
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
