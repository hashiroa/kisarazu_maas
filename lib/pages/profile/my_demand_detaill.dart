import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

///
/// デマンド配車予約詳細画面クラス
///
class MyDemandDetail extends StatefulWidget {
  const MyDemandDetail({Key? key}) : super(key: key);

  @override
  State<MyDemandDetail> createState() => _MyDemandDetailState();
}

class _MyDemandDetailState extends State<MyDemandDetail>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
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
        title: Text(local.title_my_demand_detail,
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

