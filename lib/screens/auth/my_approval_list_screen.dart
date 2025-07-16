import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';

class MyApprovalListScreen extends StatelessWidget {
  const MyApprovalListScreen({super.key});

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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'My Approval',
                        style: TextStyle(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      // 🔍 Search bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.search, color: Colors.grey),
                            SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // 📋 Approval list
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 7,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final statuses = ['Approved', 'Pending', 'Disapproved'];
                          final status = statuses[index % 3];

                          Color color;
                          FontWeight fontWeight = FontWeight.normal;

                          if (status == 'Approved') {
                            color = Colors.green;
                          } else if (status == 'Pending') {
                            color = Colors.black;
                            fontWeight = FontWeight.bold;
                          } else {
                            color = Colors.red;
                          }

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name'),
                              Text(
                                status,
                                style: TextStyle(color: color, fontWeight: fontWeight),
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      const Center(
                        child: Text(
                          'SIGN OUT',
                          style: TextStyle(fontSize: 12, letterSpacing: 1),
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
