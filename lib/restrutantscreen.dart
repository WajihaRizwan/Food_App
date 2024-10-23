import 'package:flutter/material.dart';
import 'package:foodapp/menuscreen.dart';
import 'package:foodapp/orderdetail.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
      backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple.shade900,
                Colors.black,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Restaurant Image
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('asessts/image 18.png'), // Corrected path
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              // Restaurant Info
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kinka Izakaya',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '2972 Westheimer Rd, Santa Ana',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDeliveryInfo('\$3.99', 'Delivery fee'),
                        _buildDeliveryInfo('\$3.99', 'Take Out fee'),
                      ],
                    ),
                  ],
                ),
              ),
              // Menu Options
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildMenuButton(context, 'Delivery', true),
                    _buildMenuButton(context, 'Take Out', false),
                    _buildMenuButton(context, 'Group Order', false, icon: Icons.group),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryButton('Featured items', true),
                    _buildCategoryButton('Appetizers', false),
                    _buildCategoryButton('Sushi', false),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Featured Items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured Items',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Repeated Banners
                    for (int i = 0; i < 4; i++) ...[
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                child: const Image(
                                  image: AssetImage('asessts/Item 1.png'), // Corrected path
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Last Banner Section
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: const Image(
                                image: AssetImage('asessts/Item 1.png'), // Corrected path
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryInfo(String price, String label) {
    return Column(
      children: [
        Text(
          price,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, bool isSelected, {IconData? icon}) {
    return OutlinedButton.icon(
      onPressed: () {
        // Example navigation to another screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MenuScreen(),
          ),
        );
      },
      icon: icon != null ? Icon(icon, color: Colors.white) : Container(),
      label: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.white,
        ),
      ),
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.white70,
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String title, bool isSelected) {
    return TextButton(
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white70,
          fontSize: 16,
        ),
      ),
    );
  }
}

// Dummy screen for navigation example
class AnotherScreen extends StatelessWidget {
  final String title;

  AnotherScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Welcome to $title screen!'),
      ),
    );
  }
}
