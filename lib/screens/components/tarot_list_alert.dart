// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import 'page/tarot_list_page.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

class TarotListAlert extends ConsumerWidget {
  TarotListAlert({super.key});

  List<TabInfo> tabs = <TabInfo>[];

  ///
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    makeTab();

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            //-------------------------//これを消すと「←」が出てくる（消さない）
            leading: const Icon(
              Icons.check_box_outline_blank,
              color: Colors.transparent,
            ),
            //-------------------------//これを消すと「←」が出てくる（消さない）

            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.blueAccent,
              tabs: tabs.map((TabInfo tab) => Tab(text: tab.label)).toList(),
            ),
          ),
        ),
        body: TabBarView(
          children: tabs.map((TabInfo tab) => tab.widget).toList(),
        ),
      ),
    );
  }

  ///
  void makeTab() {
    tabs = <TabInfo>[];

    final List<String> list = <String>[];

    final DateTime firstDate = DateTime(2021);

    final int diff = DateTime.now().difference(firstDate).inDays;

    for (int i = 0; i <= diff; i++) {
      final DateTime genDate = firstDate.add(Duration(days: i));

      if (genDate.day == 1) {
        list.add(genDate.yyyymm);
      }
    }

    list
      ..sort((String a, String b) => -1 * a.compareTo(b))
      ..forEach((String element) {
        tabs.add(
          TabInfo(
            element,
            TarotListPage(
              date: DateTime(element.split('-')[0].toInt(), element.split('-')[1].toInt()),
            ),
          ),
        );
      });
  }
}
