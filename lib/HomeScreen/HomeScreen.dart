import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> products = [
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
    {
      'title': 'Panadol',
      'price': 15.0,
      'image': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKAsyYeLTQa7bzHhiDvtIbBkGhAhyexmklTQ&s',
    },
  ];

  List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      final existingProduct = cart.firstWhere(
        (item) => item['title'] == product['title'],
        orElse: () => {},
      );

      if (existingProduct.isEmpty) {
        cart.add({'title': product['title'], 'price': product['price'], 'quantity': 1, 'image': product['image']});
      } else {
        existingProduct['quantity'] += 1;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${product['title']} added to cart!')),
    );
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    const HomeScreen(), 
    TotalOrderScreen(cart: [], removeFromCart: (product) {}), 
    const ProfileScreen(), 
  ];

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
      body: _screens[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Add to Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class TotalOrderScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cart;
  final Function(Map<String, dynamic>) removeFromCart;

  const TotalOrderScreen({super.key, required this.cart, required this.removeFromCart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final product = cart[index];
          return ListTile(
            title: Text(product['title']),
            subtitle: Text('Price: \$${product['price']} x${product['quantity']}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle),
              onPressed: () => removeFromCart(product),
            ),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: const Text('User Profile Screen'),
      ),
    );
  }
}
