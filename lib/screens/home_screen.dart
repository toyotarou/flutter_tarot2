import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/all_tarot/all_tarot.dart';
import '../controllers/today_tarot/today_tarot.dart';
import '../models/tarot_model.dart';
import '../models/today_tarot_model.dart';
import '../utility/utility.dart';
import 'components/parts/drawer_card.dart';
import 'components/tarot_alert.dart';
import 'components/tarot_list_alert.dart';
import 'components/tarot_ranking_alert.dart';
import 'components/tarot_recently_alert.dart';
import 'components/tarot_score_graph_alert.dart';
import 'parts/_tarot_dialog.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  Utility utility = Utility();

  ///
  @override
  void initState() {
    super.initState();

    ref.read(allTarotProvider.notifier).getAllTarot();

    ref.read(todayTarotProvider.notifier).getTodayTarot();
  }

  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Tarot"),
        backgroundColor: Colors.transparent,
        flexibleSpace: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/appBarBack.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () => tarotDialog(context: context, widget: const TarotScoreGraphAlert()),
              icon: const Icon(Icons.graphic_eq)),
          IconButton(
            onPressed: () => tarotDialog(context: context, widget: const TarotListAlert()),
            icon: const Icon(Icons.list),
          ),
          IconButton(
            onPressed: () => tarotDialog(context: context, widget: TarotRecentlyAlert()),
            icon: const Icon(Icons.pages_outlined),
          ),
          IconButton(
            onPressed: () => tarotDialog(context: context, widget: const TarotRankingAlert()),
            icon: const Icon(Icons.trending_down_outlined),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          utility.getBackGround(),
          SafeArea(child: displayTodayTarot()),
        ],
      ),
      drawer: dispDrawer(context),
    );
  }

  ///
  Widget displayTodayTarot() {
    final TodayTarotModel? todayTarot =
        ref.watch(todayTarotProvider.select((TodayTarotState value) => value.todayTarot));

    final int selectedFeeling = ref.watch(todayTarotProvider.select((TodayTarotState value) => value.selectedFeeling));

    if (todayTarot == null) {
      return Container();
    }

    int qt = 0;
    String image = '';

    qt = (todayTarot.justReverse == 'just') ? 0 : 2;

    image = (todayTarot.image == '') ? '' : 'http://toyohide.work/BrainLog/tarotcards/${todayTarot.image}.jpg';

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
                child: Text(DateTime.now().toString().split(' ')[0]),
              ),
              IconButton(
                onPressed: () => tarotDialog(context: context, widget: TarotAlert(id: todayTarot.id)),
                icon: const Icon(Icons.info_outline),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(todayTarot.name, style: const TextStyle(fontSize: 30)),
          Stack(
            children: <Widget>[
              Positioned(right: 0, top: 0, child: getFeelingIcon(feeling: selectedFeeling)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Expanded(child: Container()),
                  if (image != '') RotatedBox(quarterTurns: qt, child: Image.network(image)),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      OutlinedButton(
                        onPressed: () {
                          ref.read(todayTarotProvider.notifier).updateTarotFeeling(
                            uploadData: <String, dynamic>{
                              'id': todayTarot.id,
                              'just_reverse': todayTarot.justReverse,
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
                              'id': todayTarot.id,
                              'just_reverse': todayTarot.justReverse,
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
            child: Text(todayTarot.prof2),
          ),
          const Divider(color: Colors.indigo),
          Container(
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
            padding: const EdgeInsets.only(left: 10),
            child: Text((todayTarot.justReverse == 'just') ? '正位置' : '逆位置'),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              todayTarot.word,
              style: const TextStyle(color: Colors.yellowAccent),
            ),
          ),
          Container(padding: const EdgeInsets.all(10), alignment: Alignment.topLeft, child: Text(todayTarot.msg)),
          Container(padding: const EdgeInsets.all(10), child: Text(todayTarot.msg2)),
          Container(padding: const EdgeInsets.all(10), child: Text(todayTarot.msg3)),
        ],
      ),
    );
  }

  ///
  Widget getFeelingIcon({required int feeling}) {
    switch (feeling) {
      case 9:
        return Icon(
          Icons.circle_outlined,
          color: Colors.greenAccent.withOpacity(0.4),
          size: 100,
        );
      case 1:
        return Icon(
          Icons.close,
          color: Colors.redAccent.withOpacity(0.4),
          size: 100,
        );
      default:
        return Container();
    }
  }

  ///
  Widget dispDrawer(BuildContext context) {
    final AllTarotState allTarotState = ref.watch(allTarotProvider);

    final List<Widget> list = <Widget>[];

    for (final TarotModel element in allTarotState.tarotList) {
      list.add(TarotCard(tarotModel: element));
    }

    return Drawer(
      backgroundColor: Colors.black.withOpacity(0.2),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: Colors.yellowAccent.withOpacity(0.5), width: 5)),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 100),
              Column(children: list),
            ],
          ),
        ),
      ),
    );
  }
}
