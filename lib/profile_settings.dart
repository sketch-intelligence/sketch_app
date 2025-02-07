import 'package:flutter/material.dart';
import 'package:sketch/core/ui/widgets/custom_button.dart';
import 'package:sketch/core/widgets/custom_text_field.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  bool isDarkMode = false;
  String selectedLanguage = 'English';
  bool showPasswordFields = false;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void _togglePasswordFields() {
    setState(() {
      showPasswordFields = !showPasswordFields;
    });
  }

  void _changePassword() {
    // Implement password change logic
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth * 0.045;
    double paddingSize = screenWidth * 0.04;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Settings',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(paddingSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('App Theme',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: Text(isDarkMode ? 'Dark Mode' : 'Light Mode',
                  style: TextStyle(fontSize: fontSize)),
              value: isDarkMode,
              onChanged: (value) {
                setState(() {
                  isDarkMode = value;
                });
                // Apply theme change logic here
              },
            ),
            Divider(),
            Text('Language',
                style:
                    TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              value: selectedLanguage,
              items: ['English', 'Arabic'].map((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(language, style: TextStyle(fontSize: fontSize)),
                );
              }).toList(),
              onChanged: (newLanguage) {
                setState(() {
                  selectedLanguage = newLanguage!;
                });
                // Apply language change logic here
              },
            ),
            Divider(),
            SizedBox(height: screenHeight * 0.02),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  showPasswordFields
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
              title:
                  Text('Change Password', style: TextStyle(fontSize: fontSize)),
              onTap: _togglePasswordFields,
            ),
            if (showPasswordFields) ...[
              SizedBox(height: screenHeight * 0.02),
              Text('New Password',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold)),
              CustomTextField(
                  controller: newPasswordController,
                  hint: 'Enter new password',
                  isObscure: true),
              SizedBox(height: screenHeight * 0.01),
              Text('Confirm Password',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold)),
              CustomTextField(
                  controller: confirmPasswordController,
                  hint: 'Re-enter new password',
                  isObscure: true),
              SizedBox(height: screenHeight * 0.07),
              Center(
                child: CustomButton(
                  onPressed: _changePassword,
                  text: 'Submit',
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
