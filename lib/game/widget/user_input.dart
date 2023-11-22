import 'package:flutter/material.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widget/input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;

  final Function(InputType) callback;

  const UserInput({required this.isDone, this.userInput, required this.callback, super.key});

  @override
  Widget build(BuildContext context) {
    if (isDone) {
      return Row(
        children: [
          Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          Expanded(child: SizedBox.shrink()),
        ],
      );
    }

    return Row(children: _getInputs(callback));
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map(
            (type) => InputCard(
                callback: () => callback.call(type),
                child:Image.asset(type.path)
            ),
        )
        .toList();
  }
}


