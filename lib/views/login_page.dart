import 'package:f2fproject/utils/constants.dart';
import 'package:f2fproject/views/forgot_password_page.dart';
import 'package:f2fproject/views/register_page.dart';
import 'package:f2fproject/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/auth_viewmodel.dart';
import 'package:f2fproject/widgets/common_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AdaptiveSize.init(context);
    final authVM = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AdaptiveSize.w(16.0)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AdaptiveSize.h(40)),
              Image.asset(
                'assets/images/f2f_logo.jpeg',
                width: AdaptiveSize.w(180),
                height: AdaptiveSize.h(180),
              ),
              SizedBox(height: AdaptiveSize.h(20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: AdaptiveSize.sp(16),
                    fontWeight: FontWeight.bold,
                    color: CustomColors.kPrimaryBlue,
                  ),
                ),
              ),
              SizedBox(height: AdaptiveSize.h(10)),
              CommonTextFormField(
                controller: _phoneNumberController,
                labelText: 'Enter phone number',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: AdaptiveSize.h(20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Password',
                  style: TextStyle(
                    fontSize: AdaptiveSize.sp(16),
                    fontWeight: FontWeight.bold,
                    color: CustomColors.kPrimaryBlue,
                  ),
                ),
              ),
              SizedBox(height: AdaptiveSize.h(10)),
              CommonTextFormField(
                controller: _passwordController,
                labelText: 'Enter password',
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => const ForgotPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: CustomColors.kSecondaryGray,
                      fontSize: AdaptiveSize.sp(16),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AdaptiveSize.h(40)),
              Container(
                width: double.infinity,
                height: AdaptiveSize.h(50),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF3B5998), Color(0xFFB22234)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AdaptiveSize.sp(16),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: AdaptiveSize.h(40)),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => const RegisterPage()),
                  );
                  // Navigate to sign up
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(
                      color: CustomColors.kSecondaryGray,
                      fontSize: AdaptiveSize.sp(16),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: TextStyle(
                          color: CustomColors.kPrimaryBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
