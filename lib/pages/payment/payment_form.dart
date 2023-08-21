import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kisarazu_maas/pages/payment/payment_confirm.dart';
import 'package:kisarazu_maas/pages/profile/my_page.dart';


///
/// 決済方法入力画面クラス
///
class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  State<PaymentForm> createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm>
    with TickerProviderStateMixin, RouteAware {

  /// マイページに遷移します。
  void _toMyPage() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const MyPage()
    ));
  }

  /// 決済確認画面に遷移します。
  void _toPaymentConfirm() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => const PaymentConfirm()
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
        title: Text(local.title_payment_form,
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
                child: const Text("概要：決済方法を選択する画面。"),
              ),
              TextButton(
                onPressed: _toPaymentConfirm,
                child: Text("遷移先${AppLocalizations.of(context)!.button_to_payment_confirm}",
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
