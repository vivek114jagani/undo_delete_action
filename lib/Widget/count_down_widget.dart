import 'package:flutter/material.dart';

class CountDownWidget extends StatefulWidget {
  final Duration duaration;
  const CountDownWidget({
    super.key,
    required this.duaration,
  });

  @override
  State<CountDownWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  String get countertext {
    final Duration count = controller.duration! * controller.value;
    return count.inSeconds.toString();
  }

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: widget.duaration,
    );

    controller.reverse(from: 1);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                backgroundColor: Colors.transparent,
                color: Colors.white,
                value: controller.value,
                strokeWidth: 2,
              ),
            ),
            Text(
              countertext,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
