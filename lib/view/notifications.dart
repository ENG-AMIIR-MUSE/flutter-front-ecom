import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      "message":
          "Gilbert, you placed red order check your order history for full details"
    },
    {
      "message":
          "Gilbert, Thank you for shopping with us we have canceled order #24566"
    },
    {
      "message":
          "Gilbert, your Order #24566 has been confirmed check your order history for f"
    },
  ];

  Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Main Content
            Expanded(
              child: notifications.isEmpty
                  ? _buildEmptyState()
                  : _buildNotificationsList(),
            ),

            // Bottom Navigation
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.notifications_active,
            size: 64,
            color: Colors.orange,
          ),
          SizedBox(height: 16),
          Text(
            'No Notification yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: Text('Explore Categories'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationsList() {
    return ListView.builder(
      itemCount: notifications.length,
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return Card(
          elevation: 0,
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.notifications_outlined,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    notifications[index]["message"] ?? "",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
