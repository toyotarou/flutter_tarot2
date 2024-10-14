// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../extensions/extensions.dart';
import 'page/tarot_recently_page.dart';

class TabInfo {
  TabInfo(this.label, this.widget);

  String label;
  Widget widget;
}

class TarotRecentlyAlert extends ConsumerWidget {
  TarotRecentlyAlert({super.key});

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

    for (int i = 0; i < 7; i++) {
      final DateTime day = DateTime.now().add(Duration(days: i * -1));

      final String youbi = day.youbiStr.substring(0, 3);

      tabs.add(
        TabInfo(
          '${day.yyyymmdd} ($youbi)',
          TarotRecentlyPage(date: day),
        ),
      );
    }
  }
}
