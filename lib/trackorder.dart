import 'package:flutter/material.dart';


class TrackOrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Track order', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order ID: 4544882266',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 4),
            Text(
              'Today',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                children: [
                  _buildOrderStatus('04:30pm', 'Confirmed', true),
                  _buildOrderStatus('04:38pm', 'Processing', true),
                  _buildOrderStatus('04:42pm', 'On the way', true),
                  _buildOrderStatus('04:46pm', 'Delivered', false),
                ],
              ),
            ),
            Divider(color: Colors.white54),
            SizedBox(height: 16),
            Text(
              'Order Track',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 16),
            _buildDriverInfo(),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call button action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Background color
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Call', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderStatus(String time, String status, bool isCompleted) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.white : Colors.white54,
            ),
            Container(
              height: 30,
              width: 2,
              color: Colors.white54,
            ),
          ],
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
            Text(
              status,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDriverInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage('assets/driver.jpg'), // Replace with actual image path
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mr Kemplas',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              '25 minutes on the way',
              style: TextStyle(color: Colors.white54, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
