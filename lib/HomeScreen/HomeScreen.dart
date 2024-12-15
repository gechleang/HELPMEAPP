import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  
  final List<Map<String, dynamic>> products = const [
    {
      'title': 'Kinal',
      'image': 'https://ppmpharma.com/cdn/shop/products/KINAL-IBU-FORT-CP-BT-10x10.png?v=1652861288',
      'price': '\$5.00',
    },
    {
      'title': 'Paracetamol',
      'image': 'https://tiimg.tistatic.com/fp/1/007/784/paracetamol-500mg-tablets--229.jpg',
      'price': '\$3.50',
    },
    {
      'title': 'Alexan',
      'image': 'https://mymedicine.com.mm/web/image/product.template/1273/image_1024?unique=1b72ac3',
      'price': '\$4.00',
    },
    {
      'title': 'Doliprane',
      'image': 'https://www.hrkcare.com/cdn/shop/files/tabs500mg_pack1imgpng_453x.png?v=1698725712',
      'price': '\$6.00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2196F3),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Top Container with Profile or Logo
          Container(
            color: const Color(0xFF2196F3),
            height: 150,
            child: Center(
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Product List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(8),
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Product Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          product['image'],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Product Title
                            Text(
                              product['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),

                            // Product Price
                            Text(
                              product['price'],
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart Button
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  '${product['title']} added to cart at ${product['price']}'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2196F3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Add to Cart',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 6.0,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home, color: Colors.black),
                onPressed: () {
                  // Add navigation logic if needed
                },
              ),
              const SizedBox(width: 40),
            ],
          ),
        ),
      ),

      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add floating button logic if needed
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
