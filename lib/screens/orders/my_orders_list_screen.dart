import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart';

class MyOrdersListScreen extends StatelessWidget {
  const MyOrdersListScreen({super.key});

  final List<Map<String, dynamic>> orders = const [
    {
      'title': 'Order #12332123',
      'tracking': 'Tracking #12222333',
      'status': 'Shipped-1',
      'image': 'assets/icons/homepage/shopping_section.png'
    },
    {
      'title': 'Order #87564345',
      'tracking': 'Tracking #34224322',
      'status': 'Delivered',
      'image': 'assets/icons/homepage/shopping_section.png'
    },
    {
      'title': 'Order #55667892',
      'tracking': 'Tracking #90900123',
      'status': 'Pending',
      'image': 'assets/icons/homepage/shopping_section.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      showBackButton: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Text(
            'My Orders',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 16),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search orders',
                border: InputBorder.none,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Order List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, index) {
              final order = orders[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(order['image'], width: 60, height: 60, fit: BoxFit.cover),
                ),
                title: Text(order['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order['tracking'], style: const TextStyle(fontSize: 13)),
                    Text(order['status'], style: const TextStyle(fontSize: 13)),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  Navigator.pushNamed(context, '/order-details');
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
