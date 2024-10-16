import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../controllers/all_tarot/all_tarot.dart';
import '../../../controllers/history/history.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(child: displayRecentryTarot()),
    );
  }

  ///
  Widget displayRecentryTarot() {
    return ref.watch(historyProvider).when(
          data: (HistoryState value) {
            if (value.historyDateMap[widget.date.yyyymmdd] != null) {
              final AsyncValue<AllTarotState> allTarotState =
                  ref.watch(allTarotProvider);
              final Map<int, TarotModel>? tarotMap =
                  allTarotState.value?.tarotMap;

              if (tarotMap?[value.historyDateMap[widget.date.yyyymmdd]] !=
                  null) {
                final TarotModel? tarot =
                    tarotMap?[value.historyDateMap[widget.date.yyyymmdd]];

                final HistoryModel? history =
                    value.historyDateModelMap[widget.date.yyyymmdd];

                int qt = 0;
                String image = '';

                if (tarot != null) {
                  if (history != null) {
                    qt = (history.reverse == '0') ? 0 : 2;
                  }

                  image = (tarot.image == '')
                      ? ''
                      : 'http://toyohide.work/BrainLog/tarotcards/${tarot.image}.jpg';
                }

                return SingleChildScrollView(
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
                            child: Text(widget.date.yyyymmdd),
                          ),
                          IconButton(
                            onPressed: () {
                              tarotDialog(
                                context: context,
                                widget: TarotAlert(id: tarot!.id),
                              );
                            },
                            icon: const Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        tarot!.name,
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
                        child: Text(tarot.prof2),
                      ),
                      const Divider(color: Colors.indigo),
                      if (history != null) ...<Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                              color: Colors.greenAccent.withOpacity(0.3)),
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            (history.reverse == '0') ? '正位置' : '逆位置',
                          ),
                        ),
                        if (history.reverse == '0') ...<Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              tarot.wordJ,
                              style:
                                  const TextStyle(color: Colors.yellowAccent),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Text(tarot.msgJ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(tarot.msg2J)),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(tarot.msg3J)),
                        ],
                        if (history.reverse == '1') ...<Widget>[
                          Container(
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              tarot.wordR,
                              style:
                                  const TextStyle(color: Colors.yellowAccent),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.topLeft,
                            child: Text(tarot.msgR),
                          ),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(tarot.msg2R)),
                          Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(tarot.msg3R)),
                        ],
                      ],
                    ],
                  ),
                );
              }
            }

            return Container();
          },
          error: (Object error, StackTrace stackTrace) =>
              const Center(child: CircularProgressIndicator()),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }
}

// // ignore_for_file: must_be_immutable
//
// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
//
// import '../../../extensions/extensions.dart';
// import '../../../model/tarot_all.dart';
// import '../../../model/tarot_history.dart';
// import '../../../state/tarot_all/tarot_all_viewmodel.dart';
// import '../../../state/tarot_history/tarot_history_notifier.dart';
// import '../../../utility/utility.dart';
//
// class TarotRecentlyPage extends ConsumerWidget {
//   TarotRecentlyPage(
//       {super.key, required this.date, required this.tarotAllList});
//
//   final DateTime date;
//   final List<TarotAll> tarotAllList;
//
//   final Utility _utility = Utility();
//
//   late BuildContext _context;
//   late WidgetRef _ref;
//
//   ///
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     _context = context;
//     _ref = ref;
//
//     return AlertDialog(
//       titlePadding: EdgeInsets.zero,
//       contentPadding: EdgeInsets.zero,
//       backgroundColor: Colors.transparent,
//       insetPadding: EdgeInsets.zero,
//       content: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         width: double.infinity,
//         height: double.infinity,
//         child: DefaultTextStyle(
//           style: const TextStyle(fontSize: 12),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Container(width: context.screenSize.width),
//               Expanded(child: tarotDisplay()),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   ///
//   Widget tarotDisplay() {
//     final list = <Widget>[];
//
//     _ref.watch(tarotHistoryProvider).when(
//           data: (value) {
//             var tarotHistoryOne = TarotHistory(
//                 year: '',
//                 month: '',
//                 day: '',
//                 id: 0,
//                 name: '',
//                 image: '',
//                 reverse: '',
//                 word: '');
//
//             value.record.forEach((element) {
//               if (date.yyyymmdd ==
//                   '${element.year}-${element.month}-${element.day}') {
//                 tarotHistoryOne = element;
//               }
//             });
//
//             var tarotAllOne = TarotAll(
//               id: 0,
//               name: '',
//               image: '',
//               prof1: '',
//               prof2: '',
//               wordJ: '',
//               wordR: '',
//               msgJ: '',
//               msgR: '',
//               msg2J: '',
//               msg2R: '',
//               msg3J: '',
//               msg3R: '',
//               drawNum: '',
//               drawNumJ: [],
//               drawNumR: [],
//             );
//
//             var qt = 0;
//             var image = '';
//             if (tarotHistoryOne.name != '') {
//               qt = (tarotHistoryOne.reverse == '0') ? 0 : 2;
//
//               image = (tarotHistoryOne.image == '')
//                   ? ''
//                   : 'http://toyohide.work/BrainLog/tarotcards/${tarotHistoryOne.image}.jpg';
//
//               tarotAllOne = tarotAllList.firstWhere(
//                   (element) => element.name == tarotHistoryOne.name);
//             }
//
//             final tarotStraightAllState = _ref.watch(tarotStraightAllProvider);
//
//             list.add(
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Container(
//                         margin: const EdgeInsets.only(top: 10, right: 10),
//                         padding: const EdgeInsets.symmetric(
//                             vertical: 5, horizontal: 30),
//                         decoration: BoxDecoration(
//                           color: Colors.yellowAccent.withOpacity(0.3),
//                         ),
//                         child: Text(date.yyyymmdd),
//                       ),
//                       IconButton(
//                         onPressed: () => _utility.showTarotDialog(
//                           id: tarotAllOne.id,
//                           state: (tarotStraightAllState.value != null)
//                               ? tarotStraightAllState.value!.record
//                               : [],
//                           context: _context,
//                         ),
//                         icon: const Icon(Icons.info_outline),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Text(tarotHistoryOne.name,
//                       style: const TextStyle(fontSize: 30)),
//                 ],
//               ),
//             );
//
//             if (image != '') {
//               list.add(Column(
//                 children: [
//                   RotatedBox(quarterTurns: qt, child: Image.network(image)),
//                   const Divider(color: Colors.indigo),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     decoration: BoxDecoration(
//                         color: Colors.greenAccent.withOpacity(0.3)),
//                     padding: const EdgeInsets.only(left: 10),
//                     child:
//                         Text((tarotHistoryOne.reverse == '0') ? '正位置' : '逆位置'),
//                   ),
//                 ],
//               ));
//             }
//
//             if (tarotHistoryOne.reverse == '1') {
//               Column(
//                 children: [
//                   const SizedBox(height: 10),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     child: Text(
//                       tarotAllOne.wordR,
//                       style: const TextStyle(color: Colors.yellowAccent),
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     child: Text(tarotAllOne.msgR),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     child: Text(tarotAllOne.msg2R),
//                   ),
//                   const SizedBox(height: 10),
//                   Container(
//                     alignment: Alignment.topLeft,
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                     child: Text(tarotAllOne.msg3R),
//                   ),
//                 ],
//               );
//             }
//           },
//           error: (e, s) => Container(),
//           loading: Container.new,
//         );
//
//     /*
//
//
//     var tarotHistoryOne = TarotHistory(
//         year: '',
//         month: '',
//         day: '',
//         id: 0,
//         name: '',
//         image: '',
//         reverse: '',
//         word: '');
//
//     tarotHistoryState.record.forEach((element) {
//       if (date.yyyymmdd == '${element.year}-${element.month}-${element.day}') {
//         tarotHistoryOne = element;
//       }
//     });
//
//     var tarotAllOne = TarotAll(
//       id: 0,
//       name: '',
//       image: '',
//       prof1: '',
//       prof2: '',
//       wordJ: '',
//       wordR: '',
//       msgJ: '',
//       msgR: '',
//       msg2J: '',
//       msg2R: '',
//       msg3J: '',
//       msg3R: '',
//       drawNum: '',
//       drawNumJ: [],
//       drawNumR: [],
//     );
//
//     var qt = 0;
//     var image = '';
//     if (tarotHistoryOne.name != '') {
//       qt = (tarotHistoryOne.reverse == '0') ? 0 : 2;
//
//       image = (tarotHistoryOne.image == '')
//           ? ''
//           : 'http://toyohide.work/BrainLog/tarotcards/${tarotHistoryOne.image}.jpg';
//
//       tarotAllOne = tarotAllList
//           .firstWhere((element) => element.name == tarotHistoryOne.name);
//     }
//
//     final tarotStraightAllState = _ref.watch(tarotStraightAllProvider);
//
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 margin: const EdgeInsets.only(top: 10, right: 10),
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//                 decoration: BoxDecoration(
//                   color: Colors.yellowAccent.withOpacity(0.3),
//                 ),
//                 child: Text(date.yyyymmdd),
//               ),
//               IconButton(
//                 onPressed: () => _utility.showTarotDialog(
//                   id: tarotAllOne.id,
//                   state: (tarotStraightAllState.value != null)
//                       ? tarotStraightAllState.value!.record
//                       : [],
//                   context: _context,
//                 ),
//                 icon: const Icon(Icons.info_outline),
//               ),
//             ],
//           ),
//           const SizedBox(height: 10),
//           Text(tarotHistoryOne.name, style: const TextStyle(fontSize: 30)),
//           if (image != '')
//             RotatedBox(quarterTurns: qt, child: Image.network(image)),
//           const Divider(color: Colors.indigo),
//           Container(
//             alignment: Alignment.topLeft,
//             decoration:
//                 BoxDecoration(color: Colors.greenAccent.withOpacity(0.3)),
//             padding: const EdgeInsets.only(left: 10),
//             child: Text((tarotHistoryOne.reverse == '0') ? '正位置' : '逆位置'),
//           ),
//           if (tarotHistoryOne.reverse == '0') ...[
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(
//                 tarotAllOne.wordJ,
//                 style: const TextStyle(color: Colors.yellowAccent),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msgJ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msg2J),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msg3J),
//             ),
//           ],
//           if (tarotHistoryOne.reverse == '1') ...[
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(
//                 tarotAllOne.wordR,
//                 style: const TextStyle(color: Colors.yellowAccent),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msgR),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msg2R),
//             ),
//             const SizedBox(height: 10),
//             Container(
//               alignment: Alignment.topLeft,
//               padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//               child: Text(tarotAllOne.msg3R),
//             ),
//           ],
//         ],
//       ),
//     );
//
//     */
//
//     return SingleChildScrollView(
//       child: Column(children: list),
//     );
//   }
// }
