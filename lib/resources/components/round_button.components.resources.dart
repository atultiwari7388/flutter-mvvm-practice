import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

// Size? size;

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.text,
    this.loading = false,
    required this.onPressed,
  }) : super(key: key);
  final String text;
  final bool loading;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    // size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: Adaptive.h(7),
        width: Adaptive.w(60),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(Adaptive.h(7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: loading
              ? const CircleAvatar()
              : Text(
                  text,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white,
                      ),
                ),
        ),
      ),
    );
  }
}
