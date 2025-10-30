import 'package:flutter/material.dart';

class SimpleAddCloseIcon extends StatelessWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;

  const SimpleAddCloseIcon({
    Key? key,
    required this.progress,
    this.size = 24.0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        return SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: progress.value * (3.14159 / 4), 
                child: Opacity(
                  opacity: 1.0 - progress.value,
                  child: Icon(
                    Icons.add,
                    size: size,
                    color: color ?? Colors.white,
                  ),
                ),
              ),
              Transform.rotate(
                angle: (1.0 - progress.value) * (3.14159 / 4), 
                child: Opacity(
                  opacity: progress.value,
                  child: Icon(
                    Icons.close,
                    size: size,
                    color: color ?? Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}