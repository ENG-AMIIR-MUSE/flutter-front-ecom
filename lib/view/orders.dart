import 'package:flutter/material.dart';

class Order {
  final String id;
  final int items;
  final String status;
  final String date;
  final String? address;

  Order({
    required this.id,
    required this.items,
    required this.status,
    required this.date,
    this.address,
  });
}

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  final List<String> _filters = [
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Canceled'
  ];
  String _selectedFilter = 'Processing';

  final List<Order> _orders = [
    Order(id: '#56765', items: 4, status: 'Delivered', date: '28 May'),
    Order(id: '#54569', items: 2, status: 'Shipped', date: '28 May'),
    Order(id: '#54809', items: 1, status: 'Processing', date: '28 May'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _orders.isEmpty ? _buildEmptyState() : _buildOrdersList(),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Icon(Icons.shopping_cart_outlined,
                  size: 64, color: Colors.black54),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'No Orders yet',
            style: TextStyle(
              fontSize: 18,
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
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Orders',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: _filters.map((filter) {
              bool isSelected = _selectedFilter == filter;
              return Padding(
                padding: EdgeInsets.only(right: 8),
                child: FilterChip(
                  label: Text(filter),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() => _selectedFilter = filter);
                  },
                  backgroundColor: Colors.grey[100],
                  selectedColor: Colors.purple[100],
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.purple : Colors.black87,
                    fontSize: 13,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: _orders.length,
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder: (context, index) {
              final order = _orders[index];
              return Container(
                margin: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.receipt_outlined, color: Colors.black54),
                  ),
                  title: Text(
                    'Order ${order.id}',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  subtitle: Text(
                    '${order.items} items',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 13,
                    ),
                  ),
                  trailing: Icon(Icons.chevron_right, color: Colors.grey),
                  onTap: () => _showOrderDetails(order),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showOrderDetails(Order order) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OrderDetailsScreen(order: order),
      ),
    );
  }
}

class OrderDetailsScreen extends StatelessWidget {
  final Order order;

  OrderDetailsScreen({required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          'Order ${order.id}',
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimeline(),
            SizedBox(height: 24),
            _buildOrderItems(),
            SizedBox(height: 24),
            _buildShippingDetails(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineItem('Delivered', '28 May', true),
        _buildTimelineItem('Shipped', '28 May', true),
        _buildTimelineItem('Order Confirmed', '28 May', true),
        _buildTimelineItem('Order Placed', '28 May', true),
      ],
    );
  }

  Widget _buildTimelineItem(String title, String date, bool completed) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: completed ? Colors.purple : Colors.grey[300],
            ),
            child: completed
                ? Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            title: Text(
              '4 items',
              style: TextStyle(fontSize: 14),
            ),
            trailing: Text(
              'View All',
              style: TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShippingDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Shipping details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey[50],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '275 Ash Dr, San Jose, South Dakota 83475',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Text(
                '121-224-7890',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
