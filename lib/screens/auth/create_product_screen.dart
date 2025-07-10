import 'package:flutter/material.dart';

class CreateProductScreen extends StatelessWidget {
  const CreateProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double maxContentWidth = 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Products'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            children: [
              const SizedBox(height: 20),
              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                   Image.asset('assets/icons/homepage/icon_epurna_logo.png', height: 40),
                   Image.asset('assets/icons/homepage/icon_help.png', width: 28),
                ],
              ),
              // Profile box
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.all(16),
                color: Colors.blue[800],
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 50),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Iam Admin', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('9964132347', style: TextStyle(color: Colors.white)),
                          Text('sirodi@gmail.com', style: TextStyle(color: Colors.white)),
                          Text('GST: 29AA123456I', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Text('PAN: AAJPI8765E', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
              // Form card
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ListView(
                    children: [
                      const Text('Create Product', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(hintText: 'Product Name', border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(hintText: 'Product Category', border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        decoration: InputDecoration(hintText: 'Product ID', border: OutlineInputBorder(borderRadius: BorderRadius.circular(32))),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 120,
                              color: Colors.white,
                              child: const Center(child: Text('+ \nUpload Image', textAlign: TextAlign.center)),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              height: 120,
                              color: Colors.white,
                              child: const Center(child: Text('+ \nUpload Image', textAlign: TextAlign.center)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.white,
                        child: const Center(child: Text('+ \nUpload Video', textAlign: TextAlign.center)),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('CANCEL'),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                              onPressed: () {},
                              child: const Text('CREATE'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text('SIGN OUT'),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
