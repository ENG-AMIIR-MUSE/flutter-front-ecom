// import 'package:flutter/material.dart';

// class OrderSuccessScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(32),
//                   decoration: BoxDecoration(
//                     color:
//                         Color.fromARGB(255, 58, 16, 112), // Purple background
//                   ),
//                   child: // Your SVG would go here
//                       Container(
//                     height: 150,
//                     width: 150,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.all(24),
//                   decoration: BoxDecoration(
//                     color: const Color.fromARGB(255, 44, 20, 20),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(16),
//                       topRight: Radius.circular(16),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 10,
//                         offset: Offset(0, 5),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       SizedBox(height: 24),
//                       Text(
//                         'Order Placed Successfully',
//                         style: TextStyle(
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         'You will receive an email confirmation',
//                         style: TextStyle(
//                           fontSize: 16,
//                           color: Colors.grey[600],
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 32),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Navigate to order details
//                         },
//                         child: Text('See Order details'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF9747FF),
//                           minimumSize: Size(double.infinity, 56),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           textStyle: TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class OrderPlacedScreen extends StatelessWidget {
  const OrderPlacedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Top illustration
          Expanded(
            flex: 3,
            child: Container(
              color: Colors.purple,
              child: Center(
                child: Image.asset(
                  'assets/images/man.png', // Replace with your image path
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),

          // Order placed text and details
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Order Placed Successfully',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'You will receive an email confirmation',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Add navigation logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: Text(
                      'See Order details',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
