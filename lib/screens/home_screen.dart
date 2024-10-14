import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controllers/today_tarot/today_tarot.dart';
import '../utility/utility.dart';
import 'components/tarot_alert.dart';
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
            onPressed: () {
              // TarotDialog(
              //   context: context,
              //   widget: TarotRecentlyAlert(),
              // );
            },
            icon: const Icon(Icons.pages_outlined),
          ),
          // IconButton(
          //   onPressed: () {
          //     // TarotDialog(
          //     //   context: context,
          //     //   widget: TarotListAlert(),
          //     // );
          //   },
          //   icon: const Icon(Icons.list),
          // ),
          //
          //
          //

          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TarotHistoryScreen()),
              // );
            },
            icon: const Icon(Icons.calendar_today),
          ),
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => TarotRankingScreen()),
              // );
            },
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
    );
  }

  ///
  Widget displayTodayTarot() {
    return ref.watch(todayTarotProvider).when(
          data: (TodayTarotState value) {
            int qt = 0;
            String image = '';

            if (value.todayTarot != null) {
              qt = (value.todayTarot!.justReverse == 'just') ? 0 : 2;

              image = (value.todayTarot!.image == '')
                  ? ''
                  : 'http://toyohide.work/BrainLog/tarotcards/${value.todayTarot!.image}.jpg';
            }

            return (value.todayTarot != null)
                ? SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 10, right: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 30),
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent.withOpacity(0.3),
                              ),
                              child:
                                  Text(DateTime.now().toString().split(' ')[0]),
                            ),
                            IconButton(
                              onPressed: () {
                                tarotDialog(
                                  context: context,
                                  widget: TarotAlert(id: value.todayTarot!.id),
                                );
                              },
                              icon: const Icon(Icons.info_outline),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          value.todayTarot!.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                        if (image != '')
                          RotatedBox(
                            quarterTurns: qt,
                            child: Image.network(image),
                          ),
                        const SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(value.todayTarot!.prof2),
                        ),
                        const Divider(color: Colors.indigo),
                        Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.3)),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (value.todayTarot!.justReverse == 'just')
                                ? '正位置'
                                : '逆位置',
                          ),
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          child: Text(
                            value.todayTarot!.word,
                            style: const TextStyle(color: Colors.yellowAccent),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          alignment: Alignment.topLeft,
                          child: Text(value.todayTarot!.msg),
                        ),
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(value.todayTarot!.msg2)),
                        Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(value.todayTarot!.msg3)),
                      ],
                    ),
                  )
                : Container();
          },
          error: (Object error, StackTrace stackTrace) =>
              const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
