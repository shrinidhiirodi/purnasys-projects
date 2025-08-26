import 'package:flutter/material.dart';
import '../common/widgets/base_screen.dart';
import '../teams/team_members_approval_screen.dart';
import '../product/product_approval_screen.dart';
import '../teams/team_member_details_screen.dart';

class MyApprovalsListScreen extends StatelessWidget {
  const MyApprovalsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> approvals = [
      {"name": "Name", "type": "Product", "status": "Approved"},
      {"name": "Name", "type": "Product", "status": "Pending"},
      {"name": "Name", "type": "Product", "status": "Disapproved"},
      {"name": "Name", "type": "Team & Members", "status": "Approved"},
      {"name": "Name", "type": "Team & Members", "status": "Pending"},
      {"name": "Name", "type": "Product", "status": "Disapproved"},
      {"name": "Name", "type": "Team Details", "status": "Disapproved"},
    ];

    return BaseScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'My Approvals',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
          const SizedBox(height: 16),

          // Table header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: const [
                Expanded(flex: 2, child: Text('Name')),
                Expanded(flex: 2, child: Text('Type')),
                Expanded(flex: 2, child: Text('Status')),
              ],
            ),
          ),
          const Divider(),

          // Approvals list
          Expanded(
            child: ListView.separated(
              itemCount: approvals.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final item = approvals[index];
                return InkWell(
                  onTap: () {
                    final type = item['type'];
                    if (type == 'Product') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProductApprovalScreen(),
                        ),
                      );
                    } else if (type == 'Team & Members') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TeamMembersApprovalScreen(),
                        ),
                      );
                    } else if (type == 'Team Details') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const TeamMemberDetailsScreen(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(item['name'] ?? '')),
                        Expanded(flex: 2, child: Text(item['type'] ?? '')),
                        Expanded(
                          flex: 2,
                          child: Text(
                            item['status'] ?? '',
                            style: TextStyle(
                              color: _getStatusColor(item['status'] ?? ''),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'disapproved':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}
