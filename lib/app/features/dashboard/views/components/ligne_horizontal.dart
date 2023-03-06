import 'package:daily_task/app/constans/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LigneHorizontaleData {
  final int totalTask;
  final int totalCompleted;
  final String title;

  const LigneHorizontaleData({
    required this.totalTask,
    required this.totalCompleted,
    required this.title,
  });
}

class LigneHorizontale extends StatelessWidget {
  const LigneHorizontale({
    required this.data,
    Key? key,
  }) : super(key: key);

  final LigneHorizontaleData data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildText(),
        Expanded(child: _buildProgress()),
      ],
    );
  }

  Widget _buildText() {
    return Text(
      "${data.title}",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: kFontColorPallets[2],
        fontSize: 13,
      ),
    );
  }

  Widget _buildProgress() {
    return LinearPercentIndicator(
      percent: data.totalCompleted / data.totalTask,
      progressColor: Colors.blueGrey,
      backgroundColor: Colors.blueGrey[200],
    );
  }
}
