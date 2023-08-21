import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/demand/demand_form.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/spot/spot_detail.dart';


///
/// おすすめプラン詳細画面クラス
///
class PlanDetail extends StatefulWidget {
  final String planName;
  const PlanDetail({Key? key, required this.planName}) : super(key: key);

  @override
  State<PlanDetail> createState() => _PlanDetailState();
}

class _PlanDetailState extends State<PlanDetail>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// デマンド配車予約入力画面に遷移します。
  void _toDemandForm() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const DemandForm()
    ));
  }

  /// スポット詳細画面に遷移します。
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
        title: Text(local.title_suggestion_plan_detail,
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
                margin: const EdgeInsets.symmetric(vertical: 32),
                child: const Text("概要：おすすめプランの詳細を表示する。"),
              ),
              Text("プラン詳細：${widget.planName}",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold
                  )
              ),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                onPressed: _toDemandForm,
                child: Text("遷移先：${AppLocalizations.of(context)!.button_to_demand_form}",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              TextButton(
                onPressed: _toSpotDetail,
                child: Text("遷移先：スポット詳細",
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
