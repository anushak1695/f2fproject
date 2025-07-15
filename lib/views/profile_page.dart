import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    final user = authVM.user;
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: user == null
          ? const Center(child: Text('Not logged in'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${user.name}'),
                  Text('Email: ${user.email}'),
                  if (user.phone != null) Text('Phone: ${user.phone}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      authVM.logout();
                      Navigator.pop(context);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              ),
            ),
    );
  }
}
