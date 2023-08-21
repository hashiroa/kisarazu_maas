import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/payment/payment_form.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';


///
/// スポットチケット詳細画面クラス
///
class SpotTicketDetail extends StatefulWidget {
  const SpotTicketDetail({Key? key}) : super(key: key);

  @override
  State<SpotTicketDetail> createState() => _SpotTicketDetailState();
}

class _SpotTicketDetailState extends State<SpotTicketDetail>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// 決済画面に遷移します。
  void _toPaymentForm() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const PaymentForm()
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
        title: Text(local.title_spot_ticket_detail,
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
                onPressed: _toPaymentForm,
                child: Text(AppLocalizations.of(context)!.button_to_payment_form,
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
