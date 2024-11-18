import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/http/client.dart';
import '../../data/http/path.dart';
import '../../enum/category.dart';
import '../../extensions/extensions.dart';
import '../../models/tarot_model.dart';
import '../../utility/utility.dart';

part 'all_tarot.freezed.dart';

part 'all_tarot.g.dart';

@freezed
class AllTarotState with _$AllTarotState {
  const factory AllTarotState({
    @Default(<TarotModel>[]) List<TarotModel> tarotList,
    @Default(<int, TarotModel>{}) Map<int, TarotModel> tarotMap,
    @Default(<String, List<TarotModel>>{}) Map<String, List<TarotModel>> tarotCategoryMap,
  }) = _AllTarotState;
}

@Riverpod(keepAlive: true)
class AllTarot extends _$AllTarot {
  final Utility utility = Utility();

  ///
  @override
  AllTarotState build() => const AllTarotState();

  ///
  Future<void> getAllTarot() async {
    final HttpClient client = ref.read(httpClientProvider);

    // ignore: always_specify_types
    await client.post(path: APIPath.getAllTarot).then((value) {
      final List<TarotModel> list = <TarotModel>[];
      final Map<int, TarotModel> map = <int, TarotModel>{};
      final Map<String, List<TarotModel>> map2 = <String, List<TarotModel>>{};

      // ignore: avoid_dynamic_calls
      for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
        final TarotModel val =
            // ignore: avoid_dynamic_calls
            TarotModel.fromJson(value['data'][i] as Map<String, dynamic>);

        list.add(val);
        map[val.id] = val;

        for (final TarotCategory element in TarotCategory.values) {
          map2[element.name] = <TarotModel>[];
        }
      }

      for (final TarotCategory element in TarotCategory.values) {
        final RegExp reg = RegExp(element.name);

        // ignore: avoid_dynamic_calls
        for (int i = 0; i < value['data'].length.toString().toInt(); i++) {
          final TarotModel val =
              // ignore: avoid_dynamic_calls
              TarotModel.fromJson(value['data'][i] as Map<String, dynamic>);

          if (reg.firstMatch(val.image) != null) {
            map2[element.name]?.add(val);
          }
        }
      }

      state = state.copyWith(tarotList: list, tarotMap: map, tarotCategoryMap: map2);

      // ignore: always_specify_types
    }).catchError((error, _) {
      utility.showError('予期せぬエラーが発生しました');
    });
  }
}
