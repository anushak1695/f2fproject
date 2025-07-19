import 'package:f2fproject/utils/constants.dart';
import 'package:f2fproject/views/otp_page.dart';
import 'package:f2fproject/widgets/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:f2fproject/widgets/common_text_form_field.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  String _phoneNumber = '';
  final List<String> _languages = ['English', 'Kannada', 'Hindi'];
  String _selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    _languageController.text = _selectedLanguage;
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select Language',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            ..._languages.map(
              (lang) => ListTile(
                title: Text(lang),
                onTap: () {
                  setState(() {
                    _selectedLanguage = lang;
                    _languageController.text = lang;
                  });
                  Navigator.pop(context);
                },
                selected: _selectedLanguage == lang,
                selectedTileColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
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
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Phone Number',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: CustomColors.kPrimaryBlue,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: CustomColors.kBackgroundGray,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                ),
                initialCountryCode: 'IN',
                pickerDialogStyle: PickerDialogStyle(
                  backgroundColor: Colors.white,
                ),
                onChanged: (phone) {
                  _phoneNumber = phone.completeNumber;
                },
              ),
              const SizedBox(height: 20),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: const Text(
              //     'Select Language',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: CustomColors.kPrimaryBlue,
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 10),
              GestureDetector(
                onTap: () => _showLanguagePicker(context),
                child: AbsorbPointer(
                  child: CommonTextFormField(
                    controller: _languageController,
                    labelText: 'Select Language',
                  ),
                ),
              ),
              SizedBox(height: 40),

              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const OtpPage(phoneNumber: ''),
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
                  child: const Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
