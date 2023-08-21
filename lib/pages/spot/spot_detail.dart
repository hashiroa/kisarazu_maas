import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/spot/spot_coupon_list.dart';
import 'package:kisarazu_maas/pages/spot/spot_ticket_list.dart';


///
/// スポット詳細画面クラス
///
class SpotDetail extends StatefulWidget {
  const SpotDetail({Key? key}) : super(key: key);

  @override
  State<SpotDetail> createState() => _SpotDetailState();
}

class _SpotDetailState extends State<SpotDetail>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// チケット一覧に遷移します。
  void _toSpotTicketList() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SpotTicketList()
    ));
  }

  /// クーポン一覧に遷移します。
  void _toSpotCouponList() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const SpotCouponList()
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
        title: Text(local.title_spot_detail,
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
                onPressed: _toSpotTicketList,
                child: Text(AppLocalizations.of(context)!.button_to_spot_ticket_list,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              TextButton(
                onPressed: _toSpotCouponList,
                child: Text(AppLocalizations.of(context)!.button_to_spot_coupon_list,
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
