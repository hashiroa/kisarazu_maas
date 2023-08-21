import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/demand/demand_confirm.dart';


///
/// デマンド配車予約入力画面クラス
///
class DemandForm extends StatefulWidget {
  const DemandForm({Key? key}) : super(key: key);

  @override
  State<DemandForm> createState() => _DemandFormState();
}

class _DemandFormState extends State<DemandForm>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// デマンド配車予約確認画面に遷移します。
  void _toDemandConfirm() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const DemandConfirm()
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
        title: Text(local.title_demand_form,
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
                child: const Text("概要：デマンド配車予約について、乗降スポットの選択、日時を入力する"),
              ),
              TextButton(
                onPressed: _toDemandConfirm,
                child: Text("遷移先：${AppLocalizations.of(context)!.button_to_demand_confirm}",
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
