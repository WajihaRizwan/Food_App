import 'package:flutter/material.dart';
import 'package:foodapp/trackorder.dart';

class FindLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 252, 252),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Location',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[850],
                  hintText: 'Find your location',
                  hintStyle: TextStyle(color: Colors.white70),
                  prefixIcon: Icon(Icons.search, color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Restaurant Image
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Frame 109.png'), // Corrected path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Location',
                style: TextStyle(color: Colors.white70, fontSize: 18),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.location_on, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    'Manchester, Kentucky 39495',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.blueAccent,
                  ),
                  onPressed: () {
                    // Navigate to LocationDetails screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TrackOrderPage(), // New screen to navigate to
                      ),
                    );
                  },
                  child: Text(
                    'Set Location',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the new LocationDetails screen
class LocationDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Details'),
      ),
      body: Center(
        child: Text(
          'Here are the details of your location!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
