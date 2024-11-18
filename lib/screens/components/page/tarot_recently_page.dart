import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/all_tarot/all_tarot.dart';
import '../../../controllers/history/history.dart';
import '../../../controllers/today_tarot/today_tarot.dart';
import '../../../extensions/extensions.dart';
import '../../../models/history_model.dart';
import '../../../models/tarot_model.dart';
import '../../parts/_tarot_dialog.dart';
import '../tarot_alert.dart';

class TarotRecentlyPage extends ConsumerStatefulWidget {
  const TarotRecentlyPage({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<TarotRecentlyPage> createState() => _TarotRecentlyPageState();
}

class _TarotRecentlyPageState extends ConsumerState<TarotRecentlyPage> {
  ///
  @override
  void initState() {
    super.initState();

    ref.read(allTarotProvider.notifier).getAllTarot();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: displayRecentlyTarot()),
    );
  }

  ///
  Widget displayRecentlyTarot() {
    return ref.watch(historyProvider).when(
          data: (HistoryState value) {
            if (value.historyDateMap[widget.date.yyyymmdd] != null) {
              final AllTarotState allTarotState = ref.watch(allTarotProvider);
              final Map<int, TarotModel> tarotMap = allTarotState.tarotMap;

              if (tarotMap[value.historyDateMap[widget.date.yyyymmdd]] != null) {
                final TarotModel? tarot = tarotMap[value.historyDateMap[widget.date.yyyymmdd]];

                final HistoryModel? history = value.historyDateModelMap[widget.date.yyyymmdd];

                int qt = 0;
                String image = '';

                int feeling = 0;

                if (tarot != null) {
                  if (history != null) {
                    qt = (history.reverse == '0') ? 0 : 2;

                    switch (history.reverse) {
                      case '0':
                        feeling = tarot.feelJ;
                      case '1':
                        feeling = tarot.feelR;
                    }
                  }

                  image = (tarot.image == '') ? '' : 'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';
                }

                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                            decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.3)),
                            child: Text(widget.date.yyyymmdd),
                          ),
                          IconButton(
                            onPressed: () => tarotDialog(context: context, widget: TarotAlert(id: tarot!.id)),
                            icon: const Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(tarot!.name, style: const TextStyle(fontSize: 30)),
                      Stack(
                        children: <Widget>[
                          Positioned(
                            right: 0,
                            top: 0,
                            child: getFeelingIcon(feeling: feeling),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Expanded(child: Container()),
                              if (image != '')
                                RotatedBox(
                                  quarterTurns: qt,
                                  child: Image.network(image),
                                ),
                              Expanded(
                                  child: Column(
                                children: <Widget>[
                                  OutlinedButton(
                                    onPressed: () {
                                      ref.read(todayTarotProvider.notifier).updateTarotFeeling(
                                        uploadData: <String, dynamic>{
                                          'id': tarot.id,
                                          'just_reverse': (history?.reverse == '0') ? 'just' : 'reverse',
                                          'feeling': 9,
                                        },
                                      );
                                    },
                                    child: const Icon(Icons.circle_outlined),
                                  ),
                                  OutlinedButton(
                                    onPressed: () {
                                      ref.read(todayTarotProvider.notifier).updateTarotFeeling(
                                        uploadData: <String, dynamic>{
                                          'id': tarot.id,
                                          'just_reverse': (history?.reverse == '0') ? 'just' : 'reverse',
                                          'feeling': 1,
                                        },
                                      );
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        child: Text(tarot.prof2),
                      ),
                      const Divider(color: Colors.indigo),
                      if (history != null) ...<Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text((history.reverse == '0') ? '正位置' : '逆位置'),
                        ),
                        if (history.reverse == '0') ...<Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: Text(tarot.wordJ, style: const TextStyle(color: Colors.yellowAccent)),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10), alignment: Alignment.topLeft, child: Text(tarot.msgJ)),
                          Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg2J)),
                          Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg3J)),
                        ],
                        if (history.reverse == '1') ...<Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            child: Text(tarot.wordR, style: const TextStyle(color: Colors.yellowAccent)),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10), alignment: Alignment.topLeft, child: Text(tarot.msgR)),
                          Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg2R)),
                          Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg3R)),
                        ],
                      ],
                    ],
                  ),
                );
              }
            }

            return Container();
          },
          error: (Object error, StackTrace stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  ///
  Widget getFeelingIcon({required int feeling}) {
    switch (feeling) {
      case 9:
        return Icon(Icons.circle_outlined, color: Colors.greenAccent.withOpacity(0.4), size: 100);
      case 1:
        return Icon(Icons.close, color: Colors.redAccent.withOpacity(0.4), size: 100);
      default:
        return Container();
    }
  }
}
