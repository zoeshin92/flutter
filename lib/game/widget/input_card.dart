import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? callback;

  const InputCard({
    required this.child,
    this.callback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: InputContents(child: child),
        onTap: () => callback?.call(),
      ),
    );
  }
}

class InputContents extends StatelessWidget {
  const InputContents({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 8),
            borderRadius: BorderRadius.circular(24)),
        // inputType의 path를 받아올 게 아니라 child 라는 Widget으로 받아오기
        // child: Image.asset(type.path),
        child: child);
  }
}
