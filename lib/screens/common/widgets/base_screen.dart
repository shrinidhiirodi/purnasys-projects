import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/responsive_helper.dart';
import '../../auth/common/login_state.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final bool showBackButton;

  const BaseScreen({
    super.key,
    required this.child,
    this.showBackButton = true,
  });

  bool isMobilePortrait(BoxConstraints constraints) {
    return constraints.maxWidth < 600;
  }

  void _showHelpSheet(BuildContext context) {
    final Map<String, String> whatsappTemplates = {
      'en': 'Hi, I need help with my order on e-Purna.',
      'hi': 'नमस्ते, मुझे अपने ई-पुर्णा ऑर्डर में मदद चाहिए।',
      'ta': 'வணக்கம், எனது e-Purna ஆர்டருக்கு உதவி தேவை.',
    };

    final ValueNotifier<String> selectedLang = ValueNotifier('en');

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Help & Support',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text('• Tap "Details" to view product-specific information.'),
                const Text('• Tap the cart icon to view or modify your cart.'),
                const Text('• Tap the QR icon to scan or explore products.'),
                const Text('• Tap logout icon to sign out from your account.'),
                const SizedBox(height: 16),

                Row(
                  children: [
                    const Text('Language: ', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    ValueListenableBuilder<String>(
                      valueListenable: selectedLang,
                      builder: (context, lang, _) => DropdownButton<String>(
                        value: lang,
                        items: const [
                          DropdownMenuItem(value: 'en', child: Text('English')),
                          DropdownMenuItem(value: 'hi', child: Text('हिंदी')),
                          DropdownMenuItem(value: 'ta', child: Text('தமிழ்')),
                        ],
                        onChanged: (value) {
                          if (value != null) selectedLang.value = value;
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                ValueListenableBuilder<String>(
                  valueListenable: selectedLang,
                  builder: (context, lang, _) => ElevatedButton.icon(
                    icon: const Icon(Icons.chat),
                    label: const Text('WhatsApp Help'),
                    onPressed: () async {
                      final message = whatsappTemplates[lang] ?? whatsappTemplates['en']!;
                      final encodedMessage = Uri.encodeComponent(message);
                      final phone = '919999999999';
                      final whatsappUrl = Uri.parse('https://wa.me/$phone?text=$encodedMessage');

                      if (await canLaunchUrl(whatsappUrl)) {
                        await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
                      } else {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text('WhatsApp Not Available'),
                            content: const Text(
                                'WhatsApp does not seem to be installed on your device.\n\n'
                                    'You can still contact us by phone or email.'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(44),
                      backgroundColor: Colors.green,
                    ),
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              icon: const Icon(Icons.phone),
              label: const Text('Call Support'),
              onPressed: () async {
                final phoneUri = Uri(scheme: 'tel', path: '+919999999999');
                if (await canLaunchUrl(phoneUri)) {
                  await launchUrl(phoneUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not launch dialer')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                backgroundColor: Colors.blue,
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              icon: const Icon(Icons.email),
              label: const Text('Email Support'),
              onPressed: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'support@epurna.com',
                  query: Uri.encodeQueryComponent(
                      'subject=Need Help&body=Hello, I need help with my order on e-Purna.'),
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Could not open email client')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                backgroundColor: Colors.orange,
              ),
            ),

            const SizedBox(height: 12),

            ElevatedButton.icon(
              icon: const Icon(Icons.help_outline),
              label: const Text('Visit FAQ'),
              onPressed: () => Navigator.pushNamed(context, '/faq'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(44),
                backgroundColor: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    ) //SingleChildScrollView
    ) //SafeArea
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool mobilePortrait = isMobilePortrait(constraints);
        final double maxWidth = ResponsiveHelper.getResponsiveMaxWidth(constraints.maxWidth);

        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: maxWidth),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      child: Row(
                        children: [
                          showBackButton
                              ? IconButton(
                            icon: const Icon(Icons.arrow_back),
                            onPressed: () => Navigator.pop(context),
                          )
                              : IconButton(
                            padding: EdgeInsets.zero,
                            icon: Image.asset(
                              'assets/icons/homepage/icon_profile.png',
                              height: 28,
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                          ),
                          const SizedBox(width: 6),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Image.asset(
                              'assets/icons/homepage/icon_epurna_logo.png',
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const Spacer(),
                          if (!mobilePortrait)
                            Wrap(
                              alignment: WrapAlignment.end,
                              spacing: 12,
                              runSpacing: 4,
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Image.asset('assets/icons/homepage/icon_cart.png', height: 24),
                                  onPressed: () => Navigator.pushNamed(context, '/order-review'),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Image.asset('assets/icons/homepage/icon_qr.png', height: 24),
                                  onPressed: () => Navigator.pushNamed(context, '/products'),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Image.asset('assets/icons/homepage/icon_help.png', height: 24),
                                  onPressed: () => _showHelpSheet(context),
                                ),
                                if (LoginState.isLoggedIn.value)
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: Image.asset('assets/icons/homepage/icon_logout.png', height: 24),
                                    onPressed: () {
                                      LoginState.isLoggedIn.value = false;
                                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                    },
                                  ),
                              ],
                            )
                          else
                            PopupMenuButton<String>(
                              icon: const Icon(Icons.menu),
                              onSelected: (value) {
                                switch (value) {
                                  case 'cart':
                                    Navigator.pushNamed(context, '/order-review');
                                    break;
                                  case 'products':
                                    Navigator.pushNamed(context, '/products');
                                    break;
                                  case 'help':
                                    _showHelpSheet(context);
                                    break;
                                  case 'logout':
                                    LoginState.isLoggedIn.value = false;
                                    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(value: 'cart', child: Text('Cart')),
                                const PopupMenuItem(value: 'products', child: Text('Products')),
                                const PopupMenuItem(value: 'help', child: Text('Help')),
                                if (LoginState.isLoggedIn.value)
                                  const PopupMenuItem(value: 'logout', child: Text('Logout')),
                              ],
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
