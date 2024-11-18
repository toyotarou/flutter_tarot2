import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controllers/all_tarot/all_tarot.dart';
import '../../controllers/rate/rate.dart';
import '../../models/tarot_model.dart';

class TarotAlert extends ConsumerStatefulWidget {
  const TarotAlert({super.key, required this.id});

  final int id;

  @override
  ConsumerState<TarotAlert> createState() => _TarotAlertState();
}

class _TarotAlertState extends ConsumerState<TarotAlert> {
  ///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: displayTarot(),
    );
  }

  ///
  Widget displayTarot() {
    final Map<int, TarotModel> tarotMap = ref.watch(allTarotProvider.select((AllTarotState value) => value.tarotMap));

    final TarotModel? tarot = tarotMap[widget.id];
    String image = '';

    if (tarot != null) {
      image = (tarot.image == '') ? '' : 'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';
    }

    return SingleChildScrollView(
        child: (tarot != null)
            ? Column(
                children: <Widget>[
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.3)),
                        child: Text(tarot.id.toString()),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, right: 10),
                        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                        decoration: BoxDecoration(color: Colors.yellowAccent.withOpacity(0.3)),
                        child: getTarotRate(),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(tarot.name, style: const TextStyle(fontSize: 30)),
                  const SizedBox(height: 10),
                  Image.network(image),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(tarot.prof1),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(tarot.prof2),
                  ),
                  const Divider(color: Colors.indigo),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('正位置'),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(tarot.wordJ, style: const TextStyle(color: Colors.yellowAccent)),
                  ),
                  Container(padding: const EdgeInsets.all(10), alignment: Alignment.topLeft, child: Text(tarot.msgJ)),
                  Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg2J)),
                  Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg3J)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: tarot.drawNumJ.map((DateTime val) => Text(val.toString().split(' ')[0])).toList(),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text('逆位置'),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(tarot.wordR, style: const TextStyle(color: Colors.yellowAccent)),
                  ),
                  Container(padding: const EdgeInsets.all(10), alignment: Alignment.topLeft, child: Text(tarot.msgR)),
                  Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg2R)),
                  Container(padding: const EdgeInsets.all(10), child: Text(tarot.msg3R)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: tarot.drawNumR.map((DateTime val) {
                          return Text(val.toString().split(' ')[0]);
                        }).toList(),
                      ),
                    ],
                  ),
                ],
              )
            : Container());
  }

  ///
  Widget getTarotRate() {
    return ref.watch(rateProvider).when(
          data: (RateState value) => Text(value.rateMap[widget.id] ?? ''),
          error: (Object error, StackTrace stackTrace) => const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}
