# flutter_tarot2

タロットカード占いアプリです。78枚のタロットカードの正位置・逆位置の意味やメッセージを確認し、今日のカードを引いて占いを楽しめます。占い履歴・ランキング・スコアグラフなどの統計機能も備えています。

---

## 主な機能

- **今日のタロット**: 毎日のタロットカードを引いて正位置・逆位置のメッセージを表示
- **カード一覧**: 78枚全カードの一覧表示・詳細確認
- **カード詳細**: 各カードのキーワード・メッセージ（msg1〜msg3）・感触スコアを表示
- **占い履歴**: 過去に引いたカードの日付・正逆位置を一覧で確認
- **ランキング**: 引いた回数が多いカードのランキング表示
- **最近の占い**: 直近の占い結果をまとめて確認
- **スコアグラフ**: 感触スコア（feelJ/feelR）の推移をグラフで可視化
- **HTTP API 連携**: サーバーからタロットデータ・履歴データをリアルタイム取得

---

## 使用技術

| カテゴリ | ライブラリ |
|---|---|
| UI フレームワーク | Flutter (Material 3 off / ダークテーマ) |
| 状態管理 | hooks_riverpod / flutter_riverpod / riverpod_annotation |
| HTTP 通信 | http |
| 国際化 | intl |
| コード生成 | freezed / freezed_annotation / json_serializable / json_annotation |
| アイコン | font_awesome_flutter |
| スプラッシュ | flutter_native_splash |
| ランチャーアイコン | flutter_launcher_icons |
| Linter | flutter_lints |

---

## データモデル

### `TarotModel`
タロットカード1枚の全情報を保持します。

| フィールド | 型 | 説明 |
|---|---|---|
| id | int | カード ID |
| name | String | カード名 |
| image | String | カード画像パス |
| prof1 / prof2 | String | カードの基本説明 |
| wordJ / wordR | String | 正位置 / 逆位置キーワード |
| msgJ / msgR | String | 正位置 / 逆位置メッセージ1 |
| msg2J / msg2R | String | 正位置 / 逆位置メッセージ2 |
| msg3J / msg3R | String | 正位置 / 逆位置メッセージ3 |
| drawNum | String | 総引き回数 |
| drawNumJ | List\<DateTime\> | 正位置で引いた日付一覧 |
| drawNumR | List\<DateTime\> | 逆位置で引いた日付一覧 |
| feelJ / feelR | int | 正位置 / 逆位置の感触スコア |

### `HistoryModel`
占い履歴の1レコードを表します。

| フィールド | 型 | 説明 |
|---|---|---|
| year / month / day | String | 占いを行った年月日 |
| id | int | 引いたカード ID |
| reverse | String | 逆位置フラグ |

### `TodayTarotModel`
今日のタロット情報を保持します。

### `RateModel`
カードのレート（評価）情報を保持します。

---

## 画面構成

```
HomeScreen（ホーム画面）
├── components/
│   ├── tarot_alert.dart              カード詳細ダイアログ
│   ├── tarot_list_alert.dart         全カード一覧
│   ├── tarot_ranking_alert.dart      引いた回数ランキング
│   ├── tarot_recently_alert.dart     最近の占い履歴
│   ├── tarot_score_graph_alert.dart  感触スコアグラフ
│   ├── page/                         ページコンポーネント
│   └── parts/                        共通パーツ
└── parts/                            ホーム共通パーツ
```

---

## コントローラー（Riverpod）

| ディレクトリ | 役割 |
|---|---|
| controllers/all_tarot/ | 全タロットカードデータ取得 |
| controllers/history/ | 占い履歴の取得・管理 |
| controllers/rate/ | カードレート（評価）管理 |
| controllers/today_tarot/ | 今日のタロットカード取得 |

---

## ディレクトリ構成

```
lib/
├── controllers/        Riverpod コントローラー（API通信含む）
├── data/               データ定数・初期値
├── enum/               列挙型定義
├── extensions/         拡張メソッド
├── models/             データモデル（TarotModel, HistoryModel 等）
├── screens/            UI 画面・コンポーネント
├── utility/            ユーティリティ関数
└── main.dart           エントリーポイント

assets/
└── image/
    ├── bg.jpg           背景画像
    ├── appBarBack.png   アプリバー背景
    ├── tarotcard.png    タロットカード画像（スプラッシュ用）
    └── no_image.png     画像なし代替
```

---

## セットアップ

```bash
# 依存パッケージのインストール
flutter pub get

# コード生成（Freezed / Riverpod）
dart run build_runner build --delete-conflicting-outputs

# アプリ起動
flutter run
```

---

## 動作環境

- Flutter: 3.x 以上
- Dart SDK: ^3.5.0
- iOS / Android 対応
