import 'package:flutter/material.dart';

class CustomSnackbar extends StatefulWidget {
  final String message;
  final Duration duration;

  const CustomSnackbar({
    super.key,
    required this.message,
    this.duration = const Duration(seconds: 3),
  });

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000), // 👈 very slow
      reverseDuration: const Duration(milliseconds: 1000), // 👈 slow exit too
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1.0), // starts offscreen
      end: const Offset(0, 0),     // ends at bottom
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutCubic,     // 👈 super smooth
        reverseCurve: Curves.easeInOutCubic,
      ),
    );

    _showSnackbar();
  }

  Future<void> _showSnackbar() async {
    await _controller.forward();
    await Future.delayed(widget.duration);
    await _controller.reverse();
    if (mounted) Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SlideTransition(
        position: _offsetAnimation,
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            widget.message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

/// Call this function to show the custom snackbar
void showCustomSnackbar(BuildContext context, String message) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false,
    barrierLabel: '',
    pageBuilder: (context, _, __) {
      return CustomSnackbar(message: message);
    },
  );
}
