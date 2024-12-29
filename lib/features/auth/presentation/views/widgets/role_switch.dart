import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';

class RoleSwitch extends StatefulWidget {
  const RoleSwitch({super.key});

  @override
  RoleSwitchState createState() => RoleSwitchState();
}

class RoleSwitchState extends State<RoleSwitch> {
  String _selectedRole = "User";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: RadioListTile<String>(
            value: "User",
            groupValue: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
            title: const Text("User"),
            activeColor: AppColors.primary,
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
        Expanded(
          child: RadioListTile<String>(
            value: "Architect",
            groupValue: _selectedRole,
            onChanged: (value) {
              setState(() {
                _selectedRole = value!;
              });
            },
            title: const Text("Architect"),
            activeColor: AppColors.primary,
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}
