import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../models/tarot_model.dart';
import '../../parts/_tarot_dialog.dart';
import '../tarot_alert.dart';

class TarotCard extends StatefulWidget {
  const TarotCard({super.key, required this.tarotModel});

  final TarotModel tarotModel;

  @override
  State<TarotCard> createState() => _TarotCardState();
}

class _TarotCardState extends State<TarotCard> {
  ///
  @override
  Widget build(BuildContext context) {
    final String image = 'http://toyohide.work/BrainLog/tarotcards/${widget.tarotModel.image}.jpg';

    return Card(
      color: Colors.black.withOpacity(0.1),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.screenSize.height / 6,
        ),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 60,
                  child: Image.network(image),
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FittedBox(child: Text(widget.tarotModel.name, style: const TextStyle(fontSize: 18))),
                          GestureDetector(
                            onTap: () => tarotDialog(context: context, widget: TarotAlert(id: widget.tarotModel.id)),
                            child: const Icon(Icons.info_outline, color: Colors.yellowAccent, size: 30),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(widget.tarotModel.msgJ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.tarotModel.drawNumJ.length.toString(),
                          style: TextStyle(
                            color: (widget.tarotModel.drawNumJ.isEmpty) ? Colors.yellowAccent : Colors.white,
                          ),
                        ),
                      ),
                      Text(widget.tarotModel.msgR),
                      Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          widget.tarotModel.drawNumR.length.toString(),
                          style: TextStyle(
                            color: (widget.tarotModel.drawNumR.isEmpty) ? Colors.yellowAccent : Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
//                      getTarotRate(id: data.id, state: tarotRateState),
                    ],
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.yellowAccent.withOpacity(0.3),
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }
}
