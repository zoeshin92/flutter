import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rsp_game/model/result_data.dart';
import 'package:hive/hive.dart';

class ResultPage extends StatelessWidget {

  const ResultPage({super.key});

  // final ResultData resulxwts;
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        TextButton(
          onPressed: () => context.pushNamed('home'),
          child: Text('홈으로 이동'),
        ),
      ],
    );
  }
}
