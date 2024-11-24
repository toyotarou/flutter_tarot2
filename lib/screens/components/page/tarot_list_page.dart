import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/all_tarot/all_tarot.dart';
import '../../../controllers/history/history.dart';
import '../../../extensions/extensions.dart';
import '../../../models/history_model.dart';
import '../../../models/tarot_model.dart';
import '../../parts/_tarot_dialog.dart';
import '../tarot_recently_alert.dart';

class TarotListPage extends ConsumerStatefulWidget {
  const TarotListPage({super.key, required this.date});

  final DateTime date;

  @override
  ConsumerState<TarotListPage> createState() => _TarotListPageState();
}

class _TarotListPageState extends ConsumerState<TarotListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Expanded(child: displayTarotList()),
        ],
      )),
    );
  }

  ///
  Widget displayTarotList() {
    return ref.watch(historyProvider).when(
          data: (HistoryState value) {
            final List<Widget> list = <Widget>[];

            final AllTarotState allTarotState = ref.watch(allTarotProvider);
            final Map<int, TarotModel> tarotMap = allTarotState.tarotMap;

            for (final HistoryModel element in value.historyList) {
              if (widget.date.yyyymm == '${element.year}-${element.month}') {
                if (tarotMap[element.id] != null) {
                  int qt = 0;
                  String image = '';

                  int feeling = 0;

                  qt = (element.reverse == '0') ? 0 : 2;

                  switch (element.reverse) {
                    case '0':
                      feeling = tarotMap[element.id]!.feelJ;
                    case '1':
                      feeling = tarotMap[element.id]!.feelR;
                  }

                  image = (tarotMap[element.id]!.image == '')
                      ? ''
                      : 'http://toyohide.work/BrainLog/tarotcards/${tarotMap[element.id]!.image}.jpg';

                  list.add(Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3)))),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          right: 0,
                          top: 0,
                          child: getFeelingIcon(feeling: feeling),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            if (image != '')
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    width: 60,
                                    child: RotatedBox(quarterTurns: qt, child: Image.network(image)),
                                  ),
                                  Text((element.reverse == '0') ? 'just' : 'reverse'),
                                ],
                              ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(),
                                      Text('${element.year}-${element.month}-${element.day}'),
                                    ],
                                  ),
                                  Text(tarotMap[element.id]!.name),
                                  Text(tarotMap[element.id]!.prof1),
                                  Text(
                                    (element.reverse == '0')
                                        ? tarotMap[element.id]!.wordJ
                                        : tarotMap[element.id]!.wordR,
                                  ),
                                  Text(
                                    (element.reverse == '0') ? tarotMap[element.id]!.msgJ : tarotMap[element.id]!.msgR,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(),
                                      GestureDetector(
                                        onTap: () {
                                          tarotDialog(
                                            context: context,
                                            widget: TarotRecentlyAlert(
                                              date: DateTime.parse(
                                                '${element.year}-${element.month}-${element.day} 00:00:00',
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.pages_outlined,
                                          color: Colors.white.withOpacity(0.3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
                }
              }
            }

            return SingleChildScrollView(child: Column(children: list));
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
