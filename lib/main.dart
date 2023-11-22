import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rsp_game/game/game_body.dart';
import 'package:rsp_game/game/result_page.dart';
import 'model/result_data.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ResultDataAdapter()); // 생성된 어댑터 등록
  var box = await Hive.openBox<ResultData>('result');
  var resultBox = box.values.toList();

  runApp(
    MaterialApp.router(
      routerConfig: GoRouter(
          initialLocation: '/',
        routes: [
          GoRoute(path: '/', name:'home', builder: (context,_)=> const RSPApp()),
          GoRoute(path: '/result', name:'result', builder: (context,_)=> ResultPage(results: resultBox))
        ]
      ),
    )
  );
}

class RSPApp extends StatefulWidget {

  const RSPApp({super.key});

  @override
  State<RSPApp> createState() => _RSPAppState();
}

class _RSPAppState extends State<RSPApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('가위 바위 보!'),
        ),
        body:  const GameBody()
      );
  }
}
