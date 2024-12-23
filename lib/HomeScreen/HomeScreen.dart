import 'package:flutter/material.dart';
import 'total_order_screen.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
    {'title': 'Kinal', 'price': 2.5, 'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_r41N1EwwSfc7qwrvUMhh-Wa8E1XOJak2OQ&s'},
    {'title': 'Paracetamol', 'price': 2.5, 'image': 'https://pharmacyhealth.com.au/wp-content/uploads/2021/07/Paracetamol-20-Tabs.jpg'},
    {'title': 'Alexan', 'price': 2.5, 'image': 'https://mymedicine.com.mm/web/image/product.template/1273/image_1024?unique=1b72ac3'},
    {'title': 'Doliprane', 'price': 2.0, 'image': 'https://tovpet.com/cdn/shop/products/C4B96421-8C27-4EA6-91D3-B3E579325920.png?v=1632809828'},
  ];

  List<Map<String, dynamic>> filteredProducts = []; // List to store filtered products
  List<Map<String, dynamic>> cart = [];

  @override
  void initState() {
    super.initState();
    filteredProducts = products; // Initially show all products
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = products; // Show all products if the search query is empty
      } else {
        filteredProducts = products.where((product) {
          return product['title'].toLowerCase().contains(query.toLowerCase());
        }).toList(); // Filter products based on the query
      }
    });
  }

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      bool productExists = cart.any((item) => item['title'] == product['title']);
      if (productExists) {
        final existingProduct = cart.firstWhere((item) => item['title'] == product['title']);
        existingProduct['quantity'] += 1;
      } else {
        cart.add({'title': product['title'], 'price': product['price'], 'image': product['image'], 'quantity': 1});
      }
    });
  }

  void removeFromCart(Map<String, dynamic> product) {
    setState(() {
      cart.removeWhere((item) => item['title'] == product['title']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Shop'),
        backgroundColor: const Color(0xFF2196F3),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to TotalOrderScreen with the cart and removeFromCart function
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TotalOrderScreen(
                    cart: cart,
                    removeFromCart: removeFromCart,
                  ),
                ),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56.0), // Height of the search bar
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: TextField(
              onChanged: filterProducts, // Update filtered products on text change
              decoration: InputDecoration(
                hintText: 'Search for a product...',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              // Navigate to Detail Screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    product: product,
                    addToCart: addToCart,
                  ),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              child: ListTile(
                leading: Image.network(product['image'], width: 60, height: 60, fit: BoxFit.cover),
                title: Text(product['title']),
                subtitle: Text('\$${product['price']}'),
                trailing: ElevatedButton(
                  onPressed: () {
                    // Add product to cart on button press
                    addToCart(product);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2196F3)),
                  child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
