import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Product list with title, image URL, and price
  final List<Map<String, dynamic>> products = const [
    {
      'title': 'Kinal',
      'image': 'https://ppmpharma.com/cdn/shop/products/KINAL-IBU-GEL-Etui-BT-10x10.png?v=1652860771',
      'price': '\$5.00',
      'description': 'Kinal is used for treating fever and mild pain relief.',
    },
    {
      'title': 'Panadol',
      'image': 'https://tovpet.com/cdn/shop/files/1649301786_8794_1-removebg-preview.png?v=1687166350',
      'price': '\$3.50',
      'description': 'Paracetamol helps to reduce fever and relieve headaches.',
    },
    {
      'title': 'Decoxan',
      'image': 'https://tovpet.com/cdn/shop/files/DECOLGEN_FORTE_5x20tab_box-removebg-preview.png?v=1682675623',
      'price': '\$4.00',
      'description': 'Alexan is a medicine used for treating infections.',
    },
    {
      'title': 'Doliprane',
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVFaL0bBiia8hg239LPKNFrzZu9tQ3CZm1Uw&s',
      'price': '\$6.00',
      'description': 'Doliprane is used for managing fever and body pain.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Medicines',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF2196F3),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index]; // Get current product details
          return GestureDetector(
            onTap: () {
              // Navigate to DetailScreen with current product details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(8),
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

                  // Product Title and Price
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          product['price'],
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// DetailScreen - Displays detailed information about the specific product
class DetailScreen extends StatelessWidget {
  final Map<String, dynamic> product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['title']),
        backgroundColor: const Color(0xFF2196F3),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  product['image'],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Product Title
            Text(
              product['title'],
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              'Price: ${product['price']}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),

            // Product Description
            const Text(
              'Description:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              product['description'],
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
            const Spacer(),

            // Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product['title']} added to cart'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2196F3),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
