import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/history_model.dart';
import '../../utility/utility.dart';

part 'history.freezed.dart';

part 'history.g.dart';

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default(<HistoryModel>[]) List<HistoryModel> historyList,
    @Default(<String, int>{}) Map<String, int> historyDateMap,
    @Default(<int, List<String>>{}) Map<int, List<String>> historyIdMap,
  }) = _HistoryState;
}

@Riverpod(keepAlive: true)
class History extends _$History {
  final Utility utility = Utility();

  ///
  @override
  Future<HistoryState> build() async => getHistory();

  ///
  Future<HistoryState> getHistory() async {
    final HttpClient client = ref.read(httpClientProvider);

    final List<HistoryModel> list = <HistoryModel>[];
    final Map<String, int> map = <String, int>{};
    final Map<int, List<String>> map2 = <int, List<String>>{};

    // ignore: always_specify_types
    await client.post(path: APIPath.tarothistory).then((value) {
      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        final HistoryModel val =
            // ignore: avoid_dynamic_calls
            HistoryModel.fromJson(value['data'][i] as Map<String, dynamic>);

        list.add(val);

        map['${val.year}-${val.month}-${val.day}'] = val.id;

        map2[val.id] = <String>[];
      }

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        final HistoryModel val =
            // ignore: avoid_dynamic_calls
            HistoryModel.fromJson(value['data'][i] as Map<String, dynamic>);

        map2[val.id]?.add('${val.year}-${val.month}-${val.day}');
      }
      // ignore: always_specify_types
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });

    return HistoryState(
        historyList: list, historyDateMap: map, historyIdMap: map2);
  }
}
