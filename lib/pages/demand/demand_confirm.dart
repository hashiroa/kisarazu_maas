import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/demand/demand_complete.dart';


///
/// デマンド配車予約確認画面クラス
///
class DemandConfirm extends StatefulWidget {
  const DemandConfirm({Key? key}) : super(key: key);

  @override
  State<DemandConfirm> createState() => _DemandConfirmState();
}

class _DemandConfirmState extends State<DemandConfirm>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// デマンド配車予約完了画面に遷移します。
  void _toDemandComplete() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const DemandComplete()
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
        title: Text(local.title_demand_confirm,
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                child: const Text("概要：デマンド配車予約画面で入力された乗降ポイント、日時を表示する予約前確認画面"),
              ),
              TextButton(
                onPressed: _toDemandComplete,
                child: Text("遷移先：${AppLocalizations.of(context)!.button_to_demand_complete}",
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
