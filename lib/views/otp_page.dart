import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  bool _otpSent = false;
  String? _message;

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('OTP Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_otpSent) ...[
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
              ),
              const SizedBox(height: 20),
              authVM.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        await authVM.sendOtp(_phoneController.text);
                        setState(() {
                          _otpSent = true;
                        });
                      },
                      child: const Text('Send OTP'),
                    ),
            ] else ...[
              TextField(
                controller: _otpController,
                decoration: const InputDecoration(labelText: 'Enter OTP'),
              ),
              const SizedBox(height: 20),
              authVM.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        bool success = await authVM.verifyOtp(
                          _otpController.text,
                        );
                        setState(() {
                          _message = success ? 'OTP Verified!' : 'Invalid OTP';
                        });
                      },
                      child: const Text('Verify OTP'),
                    ),
              if (_message != null) ...[
                const SizedBox(height: 10),
                Text(_message!),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
