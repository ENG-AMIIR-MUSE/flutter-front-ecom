import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              // Content section
              Container(
                height: 200, // Define a fixed height
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 150,
                      margin: EdgeInsets.only(right: 16),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text('Item $index'),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // List section
              ListView.builder(
                shrinkWrap: true, // Important!
                physics: NeverScrollableScrollPhysics(), // Disable scrolling
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    margin: EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text('List Item $index'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
