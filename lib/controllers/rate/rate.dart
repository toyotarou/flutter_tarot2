import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../extensions/extensions.dart';
import '../../models/rate_model.dart';
import '../../utility/utility.dart';

part 'rate.freezed.dart';

part 'rate.g.dart';

@freezed
class RateState with _$RateState {
  const factory RateState({
    @Default(<RateModel>[]) List<RateModel> rateList,
    @Default(<int, String>{}) Map<int, String> rateMap,
  }) = _RateState;
}

@Riverpod(keepAlive: true)
class Rate extends _$Rate {
  final Utility utility = Utility();

  ///
  @override
  Future<RateState> build() async => getRate();

  ///
  Future<RateState> getRate() async {
    final HttpClient client = ref.read(httpClientProvider);

    final List<RateModel> list = <RateModel>[];
    final Map<int, String> map = <int, String>{};

    // ignore: always_specify_types
    await client.post(path: APIPath.getCategoryRate).then((value) {
      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        final RateModel val =
            // ignore: avoid_dynamic_calls
            RateModel.fromJson(value['data'][i] as Map<String, dynamic>);

        list.add(val);
        map[val.id] = val.rate;
      }
      // ignore: always_specify_types
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });

    return RateState(rateList: list, rateMap: map);
  }
}
