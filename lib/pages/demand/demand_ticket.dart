import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';
import 'package:kisarazu_maas/pages/payment/payment_form.dart';



///
/// 乗車券購入画面クラス
///
class DemandTicket extends StatefulWidget {
  const DemandTicket({Key? key}) : super(key: key);

  @override
  State<DemandTicket> createState() => _DemandTicketState();
}

class _DemandTicketState extends State<DemandTicket>
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
        title: Text(local.title_demand_ticket,
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
                child: const Text("概要：デマンド乗車券を購入するための画面"),
              ),
              TextButton(
                onPressed: _toPaymentForm,
                child: Text("遷移先：${AppLocalizations.of(context)!.button_to_payment_form}",
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
