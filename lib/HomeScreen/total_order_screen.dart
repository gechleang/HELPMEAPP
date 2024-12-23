import 'package:flutter/material.dart';

class TotalOrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cart;

  const TotalOrderScreen({super.key, required this.cart, required void Function(Map<String, dynamic> product) removeFromCart});

  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = cart.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Total Order'),
        backgroundColor: const Color(0xFF2196F3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // List of cart items
            Expanded(
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final item = cart[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: Image.network(item['image'], width: 60, height: 60, fit: BoxFit.cover),
                      title: Text(item['title']),
                      subtitle: Text('\$${item['price']} x ${item['quantity']}'),
                    ),
                  );
                },
              ),
            ),
            // To Display total price
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Total Price: \$${totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            
            ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2196F3)),
              child: const Text('Proceed to Checkout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
