import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/all_tarot/all_tarot.dart';
import '../../controllers/history/history.dart';
import '../../extensions/extensions.dart';
import '../../models/history_model.dart';
import '../../models/tarot_model.dart';

class TarotScoreGraphAlert extends ConsumerStatefulWidget {
  const TarotScoreGraphAlert({super.key});

  @override
  ConsumerState<TarotScoreGraphAlert> createState() => _TarotScoreGraphAlertState();
}

class _TarotScoreGraphAlertState extends ConsumerState<TarotScoreGraphAlert> {
  Map<String, String> scoreMap = <String, String>{};

  Map<int, TarotModel> tarotMap = <int, TarotModel>{};

  ///
  @override
  Widget build(BuildContext context) {
    makeScoreMap();

    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Column(children: <Widget>[
        Container(width: context.screenSize.width),
        Expanded(child: displayScoreGraph()),
      ]),
    );
  }

  ///
  void makeScoreMap() {
    if (ref.watch(historyProvider).value != null) {
      final AllTarotState allTarotState = ref.watch(allTarotProvider);
      tarotMap = allTarotState.tarotMap;

      final Map<String, List<int>> map = <String, List<int>>{};

      for (final HistoryModel element in ref.watch(historyProvider).value!.historyList) {
        map['${element.year}-${element.month}'] = <int>[];
      }

      for (final HistoryModel element in ref.watch(historyProvider).value!.historyList) {
        map['${element.year}-${element.month}']?.add(getScore(element: element));
      }

      map.forEach((String key, List<int> value) {
        int score = 0;
        for (final int element in value) {
          score += element;
        }

        scoreMap[key] = (score / value.length).toStringAsFixed(2);
      });
    }
  }

  ///
  int getScore({required HistoryModel element}) {
    int feeling = 0;

    switch (element.reverse) {
      case '0':
        feeling = tarotMap[element.id]!.feelJ;

      case '1':
        feeling = tarotMap[element.id]!.feelR;
    }

    return (feeling == 9) ? 100 : 0;
  }

  ///
  Widget displayScoreGraph() {
    final List<Widget> list = <Widget>[];

    scoreMap.forEach((String key, String value) {
      list.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(key),
          Text(
            value,
            style: TextStyle(color: (double.parse(value) > 50) ? Colors.yellowAccent : Colors.white),
          )
        ],
      ));
    });

    return SingleChildScrollView(child: Column(children: list));
  }
}
