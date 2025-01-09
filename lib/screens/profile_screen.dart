import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 50),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Name: Avail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Email: Avail@example.com',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            ListTile(
              title: const Text('Video Preference'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to video preferences
              },
            ),
            ListTile(
              title: const Text('Account Security'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to account security
              },
            ),
            ListTile(
              title: const Text('Learning Reminders'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Handle navigation to learning reminders
              },
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Log Out'),
                        content: const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context); // Close dialog
                              // Add logout logic here
                            },
                            child: const Text('Log Out'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Log Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
