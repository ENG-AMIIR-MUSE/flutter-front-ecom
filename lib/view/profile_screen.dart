import 'package:ecomerce_final/controllers/auth_controller.dart';
import 'package:ecomerce_final/view/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      // Profile Image
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/image-1wF6LbccDOA16KRvWGpHgambEvNTMz.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Name
                      Text(
                        authController.user.value.firstName ?? "NA",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            authController.user.value.email ?? "NA",
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Phone

                      const SizedBox(height: 30),
                      // Menu Items
                      _buildMenuItem('Address'),
                      _buildMenuItem('Wishlist'),
                      _buildMenuItem('Payment'),
                      _buildMenuItem('Help'),
                      _buildMenuItem('Support'),
                      const SizedBox(height: 30),
                      // Sign Out Button
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            print("helo");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUP()));
                            // authController.logout();
                          },
                          child: const Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Navigation Bar
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}
