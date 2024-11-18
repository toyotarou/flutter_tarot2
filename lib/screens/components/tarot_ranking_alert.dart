import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/all_tarot/all_tarot.dart';
import '../../controllers/history/history.dart';
import '../../models/history_model.dart';
import '../../models/tarot_model.dart';
import '../parts/_tarot_dialog.dart';
import 'tarot_alert.dart';

class TarotRankingAlert extends ConsumerStatefulWidget {
  const TarotRankingAlert({super.key});

  @override
  ConsumerState<TarotRankingAlert> createState() => _TarotRankingAlertState();
}

class _TarotRankingAlertState extends ConsumerState<TarotRankingAlert> {
  Map<int, List<String>> historyRankingCountMap = <int, List<String>>{};

  List<int> countNumList = <int>[];

  ///
  @override
  Widget build(BuildContext context) {
    makeRankingList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: displayRankingCount()),
    );
  }

  ///
  void makeRankingList() {
    historyRankingCountMap = <int, List<String>>{};

    final AsyncValue<HistoryState> historyState = ref.watch(historyProvider);
    final Map<String, List<HistoryModel>>? historyRankingMap = historyState.value?.historyRankingMap;

    if (historyRankingMap != null) {
      final Map<int, List<String>> map = <int, List<String>>{};

      historyRankingMap.forEach((String key, List<HistoryModel> value) {
        map[value.length] = <String>[];

        if (!countNumList.contains(value.length)) {
          countNumList.add(value.length);
        }
      });

      historyRankingMap.forEach((String key, List<HistoryModel> value) => map[value.length]?.add(key));

      historyRankingCountMap = map;
    }
  }

  ///
  Widget displayRankingCount() {
    final List<Widget> list = <Widget>[];

    final AllTarotState allTarotState = ref.watch(allTarotProvider);
    final Map<int, TarotModel> tarotMap = allTarotState.tarotMap;

    int keepCount = 0;

    countNumList
      ..sort((int a, int b) => a.compareTo(b) * -1)
      ..forEach((int element) {
        historyRankingCountMap[element]?.forEach((String element2) {
          final String id = element2.split('-')[0];
          final String reverse = element2.split('-')[1];

          final TarotModel? tarot = tarotMap[int.parse(id)];

          if (tarot != null) {
            int qt = 0;
            String image = '';

            qt = (reverse == '0') ? 0 : 2;

            image = (tarot.image == '') ? '' : 'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';

            list.add(
              Card(
                color: Colors.black.withOpacity(0.1),
                child: ListTile(
                  leading: (keepCount != element)
                      ? CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.orangeAccent.withOpacity(0.3),
                          child: Text(element.toString(), style: const TextStyle(fontSize: 12)),
                        )
                      : Container(width: 10),
                  trailing: Column(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => tarotDialog(context: context, widget: TarotAlert(id: int.parse(id))),
                        child: const Icon(Icons.info_outline),
                      ),
                      const SizedBox(height: 10),
                      Text(id, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        child: RotatedBox(quarterTurns: qt, child: Image.network(image)),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: DefaultTextStyle(
                          style: const TextStyle(fontSize: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(tarot.name, style: const TextStyle(fontSize: 16)),
                              Text((reverse == '0') ? 'just' : 'reverse'),
                              Text(tarot.prof1),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          keepCount = element;
        });
      });

    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) => list[index], childCount: list.length),
        ),
      ],
    );
  }
}
