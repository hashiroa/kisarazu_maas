import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_coupon_detaill.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';


///
/// 取得済みクーポン一覧画面クラス
///
class MyCouponList extends StatefulWidget {
  const MyCouponList({Key? key}) : super(key: key);

  @override
  State<MyCouponList> createState() => _MyCouponListState();
}

class _MyCouponListState extends State<MyCouponList>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// 取得済みクーポン詳細に遷移します。
  void _toCouponDetail() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyCouponDetail()
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
        title: Text(local.title_my_coupon_list,
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
                onPressed: _toCouponDetail,
                child: Text(AppLocalizations.of(context)!.button_to_my_coupon_detail,
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
