import 'package:flutter/material.dart';
import 'create_organization_screen.dart';
import 'create_team_screen.dart';
import 'create_product_screen.dart';
import 'personal_details_screen.dart';

class MyAccountDetailsScreen extends StatelessWidget {
  const MyAccountDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth > maxContentWidth
                  ? maxContentWidth
                  : constraints.maxWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top bar
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                         ),
                        Image.asset('assets/icons/homepage/icon_epurna_logo.png', height: 40),
                        Image.asset('assets/icons/homepage/icon_help.png', width: 28),
                      ],
                    ),
                  ),

                  // User Card
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(radius: 40, backgroundColor: Colors.white, child: Icon(Icons.person, size: 40)),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                              MaterialPageRoute(
                                builder: (context) => const PersonalDetailsScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/icons/homepage/icon_forward_arrow.png',
                            width: 24,
                            height: 24,
                            color: Colors.white, // remove if your PNG is colored as needed
                          ),
                        ),


                      ],
                    ),
                  ),

                  // Sections
                  _buildSection(context, "My Orders", 5),
                  _buildSection(context, "My Approvals", 5),
                  _buildSection(context, "My Organizations", 5, onPlus: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CreateOrganizationScreen()));
                  }),
                  _buildSection(context, "My Teams", 5, onPlus: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CreateTeamScreen()));
                  }),
                  _buildSection(context, "My Products", 5, onPlus: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => CreateProductScreen()));
                  }),
                  _buildSection(context, "My Services", 0),

                  const Spacer(),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text("SIGN OUT", style: TextStyle(color: Colors.black)),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, int count, {VoidCallback? onPlus}) {
    bool hasPlus = onPlus != null;

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
            if (count > 0) Text("$count", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            if (hasPlus)
              IconButton(
                icon: Icon(Icons.add_circle_outline, color: Colors.grey),
                onPressed: onPlus,
              ),
          ],
        ),
      ),
    );
  }
}
