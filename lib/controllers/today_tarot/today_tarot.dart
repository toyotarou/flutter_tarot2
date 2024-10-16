import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../models/today_tarot_model.dart';
import '../../utility/utility.dart';

part 'today_tarot.freezed.dart';

part 'today_tarot.g.dart';

@freezed
class TodayTarotState with _$TodayTarotState {
  const factory TodayTarotState({TodayTarotModel? todayTarot}) =
      _TodayTarotState;
}

@Riverpod(keepAlive: true)
class TodayTarot extends _$TodayTarot {
  final Utility utility = Utility();

  ///
  @override
  Future<TodayTarotState> build() async => getTodayTarot();

  ///
  Future<TodayTarotState> getTodayTarot() async {
    final HttpClient client = ref.read(httpClientProvider);

    TodayTarotModel model = TodayTarotModel(
      id: 0,
      name: '',
      prof1: '',
      prof2: '',
      justReverse: '',
      image: '',
      word: '',
      msg: '',
      msg2: '',
      msg3: '',
    );

    // ignore: always_specify_types
    await client.post(path: APIPath.tarotcard).then((value) {
      final TodayTarotModel val =
          // ignore: avoid_dynamic_calls
          TodayTarotModel.fromJson(value['data'] as Map<String, dynamic>);

      model = val;

      // ignore: always_specify_types
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });

    return TodayTarotState(todayTarot: model);
  }
}
