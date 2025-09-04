import 'package:flutter/material.dart';

// A Flutter widget displaying a switch tile with an icon and title, managing its own toggle state.
// Provides a reusable component for settings or preferences screens.
class SettingsSwitchTile extends StatefulWidget {
  final IconData icon; // Leading icon
  final String title; // Switch title text
  final bool value; // Initial value of the switch

  const SettingsSwitchTile({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  State<SettingsSwitchTile> createState() => _SettingsSwitchTileState();
}

class _SettingsSwitchTileState extends State<SettingsSwitchTile> {
  late bool _value; // Local copy of the switch state

  @override
  void initState() {
    super.initState();
    _value = widget.value; // Initialize with passed value
  }

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _value,
      onChanged: (v) {
        // Update local state when switch is toggled
        setState(() => _value = v);
      },
      title: Text(widget.title),
      secondary: Icon(widget.icon),
    );
  }
}
