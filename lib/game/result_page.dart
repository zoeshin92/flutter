import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rsp_game/model/result_data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ResultPage extends StatelessWidget {
  final List<ResultData> results;

  const ResultPage({required this.results, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('결과 페이지'),
        backgroundColor: Colors.pink,
      ),
      body: GetResult(results: results),
    );
  }
}

class GetResult extends StatelessWidget {
  final List<ResultData> results;

  const GetResult({required this.results, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => context.pushNamed('home'),
          child: Text('홈으로 이동'),
        ),
        SfCartesianChart(
          // 여기에 차트 설정 및 데이터 바인딩을 추가하세요.
          primaryXAxis: CategoryAxis(),
          series: <LineSeries<ResultData, String>>[
            LineSeries<ResultData, String>(
                dataSource: results,
                xValueMapper: (ResultData data, _) => data.win.toString(),
                yValueMapper: (ResultData data, _) => data.lose),
          ],
        )
      ],
    );
  }
}
