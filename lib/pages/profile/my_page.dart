import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_coupon_list.dart';
import 'package:kisarazu_maas/pages/profile/my_demand_list.dart';
import 'package:kisarazu_maas/pages/profile/my_demand_user_edit.dart';
import 'package:kisarazu_maas/pages/profile/my_ticket_list.dart';


///
/// マイページ画面クラス
///
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// デマンド配車予約一覧に遷移します。
  void _toDemandList() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyDemandList()
    ));
  }

  /// 購入チケット一覧に遷移します。
  void _toTicketList() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyTicketList()
    ));
  }

  /// 取得クーポン一覧に遷移します。
  void _toCouponList() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyCouponList()
    ));
  }

  /// デマンド利用者編集に遷移します。
  void _toDemanUserEdit() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyDemandUserEdit()
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
        title: Text(local.title_mypage,
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
                onPressed: _toDemanUserEdit,
                child: Text(AppLocalizations.of(context)!.button_to_my_demand_user_edit,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              TextButton(
                onPressed: _toDemandList,
                child: Text(AppLocalizations.of(context)!.button_to_my_demand_list,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              TextButton(
                onPressed: _toTicketList,
                child: Text(AppLocalizations.of(context)!.button_to_my_ticket_list,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    )),
              ),
              TextButton(
                onPressed: _toCouponList,
                child: Text(AppLocalizations.of(context)!.button_to_my_coupon_list,
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
