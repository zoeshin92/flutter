import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:rsp_game/game/enum.dart';
import 'package:rsp_game/game/widget/cpu_input.dart';
import 'package:rsp_game/game/widget/game_result.dart';
import 'package:rsp_game/game/widget/user_input.dart';

import '../model/result_data.dart';

class GameBody extends StatefulWidget {

  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone;
  InputType? _userInput; // nullable인 경우에는 late를 붙여줄 필요 없음
  late InputType _cpuInput;
  late Result? result;

  @override
  void initState() {
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: CpuInput(isDone: isDone, cpuInput: _cpuInput)),
        Expanded(
          child: GameResult(
            isDone: isDone,
            result: getResult(),
            callback: reset,
          ),
        ),
        Expanded(
            child: UserInput(
                isDone: isDone, callback: setUserInput, userInput: _userInput)),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true;
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            _updateResult(Result.draw);
            return Result.draw;
          case InputType.scissors:
            _updateResult(Result.playerWin);
            return Result.playerWin;
          case InputType.paper:
            _updateResult(Result.cpuWin);
            return Result.cpuWin;
        }
      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }
  }

  void _updateResult(Result newResult)  async{
    var box = await Hive.openBox<ResultData>('result');
    // 기존 Result 객체가 없으면 새로 생성
    ResultData resultData = box.get(0) ?? ResultData();

    // 적절한 필드 업데이트
    if (newResult == Results.win) {
    resultData?.win++;
    } else if (newResult == Results.lose) {
    resultData.lose++;
    } else if (newResult == Results.draw) {
    resultData.draw++;
    }

    // 업데이트된 Result 객체 저장
     box.put(0, resultData);
  }

  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

}
