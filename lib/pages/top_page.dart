import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/demand/demand_ticket.dart';
import 'package:kisarazu_maas/pages/plan_detail.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/spot/spot_search_map.dart';
import 'package:kisarazu_maas/pages/spot/spot_search_word.dart';
import 'package:kisarazu_maas/widgets/plan_menu.dart';
import 'package:url_launcher/url_launcher.dart';


///
/// TOP画面クラス
///
class TopPage extends StatefulWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// ワード検索画面に遷移します。
  void _toSpotSearchWord() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SpotSearchWord()
    ));
  }

  /// 地図検索画面に遷移します。
  void _toSpotSearchMap() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SpotSearchMap()
    ));
  }

  /// 乗車券購入画面に遷移します。
  void _toDemandTicket() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const DemandTicket()
    ));
  }

  /// おすすめプラン詳細画面に遷移します。
  Future<void> _toPlanDetail(String title) async {
    HapticFeedback.selectionClick();
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => PlanDetail(planName: title,)
    ));
  }

  /// Cookie利用同意画面の外部リンクを表示します。
  void _toCookie() {
    var url = "https://www.yahoo.co.jp/";
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
  }

  /// 利用規約同意画面の外部リンクを表示します。
  void _toPolicy() {
    var url = "https://www.yahoo.co.jp/";
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
  }

  /// FAQ画面の外部リンクを表示します。
  void _toFaq() {
    var url = "https://www.yahoo.co.jp/";
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
  }

  /// 個人情報保護についての外部リンクを表示します。
  void _toPersonalInfo() {
    var url = "https://www.yahoo.co.jp/";
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
  }

  /// 電子商取引についての外部リンクを表示します。
  void _toECommerce() {
    var url = "https://www.yahoo.co.jp/";
    launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(AppLocalizations.of(context)!.title_top,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: _toMyPage,
          ),
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // タイトル
              Container(
                height: 80,
                width: size.width / 2,
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Image.asset('images/kisarazu_title.png'),
              ),
              // 乗車券購入はこちら
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                width: size.width,
                height: 64,
                child: GestureDetector(
                  onTap: _toDemandTicket,
                  child: Card(
                    color: Colors.lightBlue,
                    child: Center(
                      child: Text(local.note_demand_ticket,
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              // おすすめプラン一覧 文言
              Container(
                width: size.width,
                height: 40,
                color: Colors.green,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(local.note_suggestion_plan,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),
              // おすすめプラン一覧
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ScrollConfiguration(
                    behavior: CustomScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PlanMenu(
                            title: local.note_suggestion_plan_1,
                            imagePath: "images/plan_menu_1.png",
                            tapHandler: _toPlanDetail,
                          ),
                          PlanMenu(
                            title: local.note_suggestion_plan_2,
                            imagePath: "images/plan_menu_2.png",
                            tapHandler: _toPlanDetail,
                          ),
                          PlanMenu(
                            title: local.note_suggestion_plan_3,
                            imagePath: "images/plan_menu_3.png",
                            tapHandler: _toPlanDetail,
                          ),
                        ],
                      ),
                    )
                ),
              ),
              // スポットを探す 文言
              Container(
                width: size.width,
                height: 40,
                color: Colors.green,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: Text(local.note_find_spot,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.bold
                      )
                  ),
                ),
              ),
              // スポットを探す
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ワード検索から探す
                    GestureDetector(
                      onTap: _toSpotSearchWord,
                      child: Card(
                        color: Colors.lightBlue,
                        elevation: 4,
                        child: Container(
                          width: 160,
                          height: 40,
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.search, color: Colors.white),
                                Text(local.note_search_word,
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: Colors.white
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 地図から探す
                    GestureDetector(
                      onTap: _toSpotSearchMap,
                      child: Card(
                        color: Colors.lightBlue,
                        elevation: 4,
                        child: Container(
                          width: 160,
                          height: 40,
                          alignment: Alignment.center,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.map, color: Colors.white),
                                Text(local.note_search_map,
                                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                        color: Colors.white
                                    )
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // セパレータ
              const Divider(
                color: Colors.grey,
                height: 1,
                indent: 8,
                endIndent: 8,
              ),
              // Cookieの利用について
              TextButton(
                onPressed: _toCookie,
                child: Text(AppLocalizations.of(context)!.button_to_cookie,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                )),
              ),
              // 利用規約
              TextButton(
                onPressed: _toPolicy,
                child: Text(AppLocalizations.of(context)!.button_to_policy,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              // FAQ
              TextButton(
                onPressed: _toFaq,
                child: Text(AppLocalizations.of(context)!.button_to_faq,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              // 個人情報の取り扱いについて
              TextButton(
                onPressed: _toPersonalInfo,
                child: Text(AppLocalizations.of(context)!.button_to_personal_info,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              // 電子商取引について
              TextButton(
                onPressed: _toECommerce,
                child: Text(AppLocalizations.of(context)!.button_to_ecommerce,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              // 余白
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        )
      )
    );
  }
}

// 以下のクラスを追加
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

