import 'package:flutter/material.dart';

class AppSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    bool fromTop = true,
    Color backgroundColor = Colors.black87,
    IconData? icon,
  }) {
    final overlay = Overlay.of(context);

    late OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) {
        return _SnackBarWidget(
          message: message,
          duration: duration,
          fromTop: fromTop,
          backgroundColor: backgroundColor,
          icon: icon,
          onDismissed: () {
            overlayEntry.remove();
          },
        );
      },
    );

    overlay.insert(overlayEntry);
  }

  //  Convenience methods
  static void success(
    BuildContext context,
    String message, {
    bool fromTop = false,
  }) {
    show(
      context,
      message: message,
      backgroundColor: Colors.green,
      icon: Icons.check_circle,
      fromTop: fromTop,
    );
  }

  static void error(
    BuildContext context,
    String message, {
    bool fromTop = false,
  }) {
    show(
      context,
      message: message,
      backgroundColor: Colors.red,
      icon: Icons.error,
      fromTop: fromTop,
    );
  }

  static void warning(
    BuildContext context,
    String message, {
    bool fromTop = false,
  }) {
    show(
      context,
      message: message,
      backgroundColor: Colors.orange,
      icon: Icons.warning,
      fromTop: fromTop,
    );
  }

  static void info(
    BuildContext context,
    String message, {
    bool fromTop = false,
  }) {
    show(
      context,
      message: message,
      backgroundColor: Colors.blue,
      icon: Icons.info,
      fromTop: fromTop,
    );
  }
}

class _SnackBarWidget extends StatefulWidget {
  final String message;
  final Duration duration;
  final bool fromTop;
  final Color backgroundColor;
  final IconData? icon;
  final VoidCallback onDismissed;

  const _SnackBarWidget({
    required this.message,
    required this.duration,
    required this.fromTop,
    required this.backgroundColor,
    required this.icon,
    required this.onDismissed,
  });

  @override
  State<_SnackBarWidget> createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<_SnackBarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(milliseconds: 600),
    );

    _offsetAnimation =
        Tween<Offset>(
          begin: widget.fromTop ? const Offset(0, -1.2) : const Offset(0, 1.2),
          end: const Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeOutBack,
            reverseCurve: Curves.easeIn,
          ),
        );

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) => widget.onDismissed());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Align(
          alignment: widget.fromTop
              ? Alignment.topCenter
              : Alignment.bottomCenter,
          child: SlideTransition(
            position: _offsetAnimation,
            child: Padding(
              padding: EdgeInsets.only(
                top: widget.fromTop ? 40 : 0,
                bottom: widget.fromTop ? 0 : 40,
              ),
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.icon != null) ...[
                        Icon(widget.icon, color: Colors.white, size: 18),
                        const SizedBox(width: 8),
                      ],
                      Flexible(
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
