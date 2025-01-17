import 'package:flutter/material.dart';
import 'package:sketch/core/constant/app_colors/app_colors.dart';
import 'package:sketch/translations.dart';

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
            title: Text(
              AppLocalizations.of(context)!.user,
            ),
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
            title: Text(
              AppLocalizations.of(context)!.architect,
            ),
            activeColor: AppColors.primary,
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}
