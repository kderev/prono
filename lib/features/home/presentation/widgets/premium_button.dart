import 'package:flutter/material.dart';

/// Reusable premium CTA button with subtle scale animation on tap.
class PremiumButton extends StatefulWidget {
  const PremiumButton({
    required this.label,
    required this.onPressed,
    super.key,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  State<PremiumButton> createState() => _PremiumButtonState();
}

class _PremiumButtonState extends State<PremiumButton> {
  double _scale = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _scale = 0.97),
      onTapCancel: () => setState(() => _scale = 1),
      onTapUp: (_) {
        setState(() => _scale = 1);
        widget.onPressed();
      },
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 140),
        curve: Curves.easeOut,
        child: AbsorbPointer(
          child: ElevatedButton(
            onPressed: () {},
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}
