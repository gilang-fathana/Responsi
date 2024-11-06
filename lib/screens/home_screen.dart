import 'package:flutter/material.dart';
import 'package:flutter_basic/screens/login_screen.dart';
import 'package:flutter_basic/screens/profile_screen.dart';
import 'package:flutter_basic/widgets/bottom_navigation_bar.dart';
import 'package:flutter_basic/screens/product_card_horizontal.dart';
import 'package:flutter_basic/screens/product_card_vertical.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> products = [
    {'name': 'Product 1', 'price': 29.99},
    {'name': 'Product 2', 'price': 49.99},
    {'name': 'Product 3', 'price': 19.99},
    {'name': 'Product 4', 'price': 99.99},
    {'name': 'Product 5', 'price': 59.99},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Products - Grid View',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardHorizontal(
                    productName: products[index]['name'],
                    price: products[index]['price'],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Products - List View',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCardVertical(
                    productName: products[index]['name'],
                    price: products[index]['price'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
