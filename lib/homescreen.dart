import 'package:flutter/material.dart';
import 'package:foodapp/restrutantscreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Color.fromARGB(255, 28, 28, 71),
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Delivery',
                style: TextStyle(color: Colors.white, fontSize: 14)),
            Text('Maplewood Suites',
                style: TextStyle(color: Colors.white, fontSize: 18)),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.directions_bike, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RestaurantScreen()),
              );
            },
          ),
        ],
      ),
      body: Container(
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
        child: SingleChildScrollView(
          // Wrap entire content in SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                // Search Bar
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Your order?',
                    hintStyle: TextStyle(color: Colors.white70),
                    filled: true,
                    fillColor: Colors.white10,
                    prefixIcon: Icon(Icons.search, color: Colors.white70),
                    suffixIcon: Icon(Icons.qr_code, color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryItem(icon: Icons.fastfood, label: 'Burgers'),
                      SizedBox(width: 30),
                      CategoryItem(icon: Icons.cake, label: 'Dessert'),
                      SizedBox(width: 30),
                      CategoryItem(icon: Icons.local_pizza, label: 'Mexican'),
                      SizedBox(width: 30),
                      CategoryItem(icon: Icons.local_activity, label: 'Sushi'),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // "Fastest Near You" Section
                Text('Category',
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                SizedBox(height: 10),
                // Banner
                Center(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: const Image(
                            image: AssetImage(
                                'asessts/Card.png'), // Corrected asset path
                            height: 150, // Set height for the image
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: const Image(
                            image: AssetImage(
                                'asessts/Card.png'), // Corrected asset path
                            height: 150, // Set height for the image
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Exclusive Offer Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Fastest Near You',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Added text color
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                            color: Colors.blueAccent), // Added text color
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // Repeated Banners
                for (int i = 0; i < 4; i++) ...[
                  Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            child: const Image(
                              image: AssetImage('asessts/Card(2).png'),
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
                            image: AssetImage('asessts/Card(2).png'),
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
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.white70,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}

// CategoryItem Widget
class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white10,
            child: Icon(icon, color: Colors.white),
          ),
          SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

// NearbyItem Widget
class NearbyItem extends StatelessWidget {
  final String imagePath;

  NearbyItem({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
