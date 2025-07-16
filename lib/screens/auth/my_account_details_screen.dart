import 'package:flutter/material.dart';
import '../../utils/responsive_helper.dart';
import '../common/widgets/base_screen.dart';
import 'create_organization_screen.dart';
import 'create_team_screen.dart';
import 'create_product_screen.dart';
import 'personal_details_screen.dart';

class MyAccountDetailsScreen extends StatelessWidget {
  const MyAccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = 600;

    return BaseScreen(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth > maxContentWidth
              ? maxContentWidth
              : constraints.maxWidth;

          return Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ✅ User Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.person, size: 40),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Iam Admin", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                              Text("9964132347", style: TextStyle(color: Colors.white)),
                              Text("sirodi@gmail.com", style: TextStyle(color: Colors.white)),
                              Text("GST: 29AA123456I", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text("PAN: AAJPI8765E", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const PersonalDetailsScreen()),
                            );
                          },
                          child: Image.asset(
                            'assets/icons/homepage/icon_forward_arrow.png',
                            width: 24,
                            height: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // ✅ Sections
                  _buildTapSection(context, "My Orders", '/myOrdersList'),
                  _buildTapSection(context, "My Approvals", '/myApprovalList'),
                  _buildTapSection(context, "My Organizations", '/organizationList',
                      onPlus: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateOrganizationScreen()))),
                  _buildTapSection(context, "My Teams", '/teamsList',
                      onPlus: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateTeamScreen()))),
                  _buildTapSection(context, "My Products", '/products',
                      onPlus: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateProductScreen()))),
                  _buildSection(context, "My Services", 0),

                  const SizedBox(height: 32),

                  // Sign out
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("SIGN OUT", style: TextStyle(color: Colors.black)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTapSection(BuildContext context, String title, String route, {VoidCallback? onPlus}) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: _buildSection(context, title, 5, onPlus: onPlus),
    );
  }

  Widget _buildSection(BuildContext context, String title, int count, {VoidCallback? onPlus}) {
    final hasPlus = onPlus != null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: count > 0 ? Colors.blue.shade700 : Colors.transparent,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: ListTile(
        title: Text(title, style: TextStyle(color: count > 0 ? Colors.white : Colors.black)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (count > 0)
              Text("$count", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            if (hasPlus)
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.grey),
                onPressed: onPlus,
              ),
          ],
        ),
      ),
    );
  }
}
