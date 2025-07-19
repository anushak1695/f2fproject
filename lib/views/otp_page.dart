import 'package:f2fproject/views/create_password_page.dart';
import 'package:f2fproject/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'package:f2fproject/utils/constants.dart';
import 'package:f2fproject/widgets/common_text_form_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  const OtpPage({super.key, required this.phoneNumber});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _otp = '';
  String? _message;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authVM = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Image.asset(
                'assets/images/f2f_logo.jpeg',
                width: 180,
                height: 180,
              ),
              const SizedBox(height: 20),
              const Text(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: CustomColors.kPrimaryBlue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'We have sent the verifcation code to your\nphone number.',
                style: TextStyle(
                  fontSize: 14,
                  color: CustomColors.kSecondaryGray,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {
                  setState(() {
                    _otp = value;
                  });
                },
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  fieldOuterPadding: EdgeInsets.all(8),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 44,
                  fieldWidth: 50,
                  activeColor: CustomColors.kPrimaryBlue,
                  selectedColor: CustomColors.kPrimaryBlue,
                  inactiveColor: CustomColors.kBackgroundGray,
                ),
                mainAxisAlignment: MainAxisAlignment.center,
                // No validation logic here
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () async {},
                child: RichText(
                  text: TextSpan(
                    text: "Code not received? ",
                    style: TextStyle(
                      color: CustomColors.kSecondaryGray,
                      fontSize: AdaptiveSize.sp(16),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend',
                        style: TextStyle(
                          color: CustomColors.kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 32),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const CreatePasswordPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3B5998), Color(0xFFB22234)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: const Text(
                      'Verify OTP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
