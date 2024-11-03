import 'package:flutter/material.dart';
import 'package:sketch/constants.dart';

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
            activeColor: kPrimaryColor,
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
            activeColor: kPrimaryColor,
            dense: true,
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ),
      ],
    );
  }
}
