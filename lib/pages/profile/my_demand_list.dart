import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_demand_detaill.dart';


///
/// デマンド配車予約一覧画面クラス
///
class MyDemandList extends StatefulWidget {
  const MyDemandList({Key? key}) : super(key: key);

  @override
  State<MyDemandList> createState() => _MyDemandListState();
}

class _MyDemandListState extends State<MyDemandList>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyDemandDetail()
    ));
  }

  /// デマンド配車予約詳細に遷移します。
  void _toDemandDetail() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyDemandDetail()
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
        title: Text(local.title_my_demand_list,
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
                onPressed: _toDemandDetail,
                child: Text(AppLocalizations.of(context)!.button_to_my_demand_detail,
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
