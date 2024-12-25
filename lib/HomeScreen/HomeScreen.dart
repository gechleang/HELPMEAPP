import 'package:flutter/material.dart';
import 'total_order_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> cart = [];
  
  final List<Map<String, dynamic>> medicine = [
    {
      'title': 'Kinal',
      'price': 2.0,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSpQK3wjAeNm1eLLSltk_oycZyG-2wyNqbAPg&s',
    },
    {
      'title': 'Alexan',
      'price': 2.0,
      'image': 'https://mymedicine.com.mm/web/image/product.template/1273/image_1024?unique=1b72ac3',
    },
   
  ];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      int existingIndex = cart.indexWhere((item) => item['title'] == product['title']);
      
      if (existingIndex != -1) {
        
        cart[existingIndex] = {
          ...cart[existingIndex],
          'quantity': (cart[existingIndex]['quantity'] ?? 1) + 1,
        };
      } else {
        
        cart.add({
          ...product,
          'quantity': 1,
        });
      }
    });
  }

  Widget _buildHomeContent() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.75,
      ),
      itemCount: medicine.length,
      itemBuilder: (context, index) {
        final product = medicine[index];
        return _buildProductCard(product);
      },
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              product['image'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('\$${product['price']}'),
                ElevatedButton(
                  onPressed: () => addToCart(product),
                  child: const Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Shop'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TotalOrderScreen(
                    cart: cart,
                    removeFromCart: (product) {
                      setState(() {
                        cart.remove(product);
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _selectedIndex == 0 
          ? _buildHomeContent()
          : _selectedIndex == 1 
              ? TotalOrderScreen(cart: cart, removeFromCart: (product) {
                  setState(() {
                    cart.remove(product);
                  });
                })
              : const ProfileScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
