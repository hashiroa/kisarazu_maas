import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/spot/spot_detail.dart';


///
/// 地図検索画面クラス
///
class SpotSearchMap extends StatefulWidget {
  const SpotSearchMap({Key? key}) : super(key: key);

  @override
  State<SpotSearchMap> createState() => _SpotSearchMapState();
}

class _SpotSearchMapState extends State<SpotSearchMap>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// スポット詳細に遷移します。
  void _toSpotDetail() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SpotDetail()
    ));
  }


  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(local.title_spot_search_map,
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
              TextButton(
                onPressed: _toSpotDetail,
                child: Text("スポット詳細",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(local.button_back,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
            ],
          ),
        )
      )
    );
  }
}
