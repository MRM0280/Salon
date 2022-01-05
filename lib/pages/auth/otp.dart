import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:salon/pages/screens.dart';

class Otp extends StatefulWidget {
  const Otp({Key key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController controller1;
  TextEditingController controller2;
  TextEditingController controller3;
  TextEditingController controller4;

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    controller4 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height - 119,
              child: Column(
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Verify your mobile number',
                    style: black18SemiBoldTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  Text(
                    'We have send an SMS with a code to\nnumber +91 8562312365',
                    textAlign: TextAlign.center,
                    style: black13RegularTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Enter OTP code here',
                    style: black14SemiBoldTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  codeTextField(),
                  startButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  codeTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 38,
          width: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            onChanged: (v) {
              String value = controller1.text ?? '';
              if (value.isEmpty) {
                return;
              }
              FocusScope.of(context).requestFocus(focusNode2);
            },
            focusNode: focusNode1,
            controller: controller1,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            style: black14SemiBoldTextStyle,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            onChanged: (v) {
              String value = controller2.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode1);
                return;
              }
              FocusScope.of(context).requestFocus(focusNode3);
            },
            focusNode: focusNode2,
            controller: controller2,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            style: black14SemiBoldTextStyle,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            onChanged: (v) {
              String value = controller3.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode2);
                return;
              }
              FocusScope.of(context).requestFocus(focusNode4);
            },
            focusNode: focusNode3,
            controller: controller3,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            style: black14SemiBoldTextStyle,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        widthSpace,
        Container(
          height: 38,
          width: 38,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor, width: 1.3),
            borderRadius: BorderRadius.circular(6),
          ),
          child: TextField(
            onChanged: (v) {
              String value = controller2.text ?? '';
              if (value.isEmpty) {
                FocusScope.of(context).requestFocus(focusNode3);
                return;
              }
              waitDialog();
            },
            focusNode: focusNode4,
            controller: controller4,
            keyboardType: TextInputType.number,
            cursorColor: primaryColor,
            style: black14SemiBoldTextStyle,
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 11),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }

  startButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: fixPadding * 2.0,
        vertical: fixPadding * 3.0,
      ),
      child: InkWell(
        onTap: () => waitDialog(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(fixPadding * 1.5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: primaryColor.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 2,
              ),
            ],
          ),
          child: Text(
            'Get Started',
            style: white18SemiBoldTextStyle,
          ),
        ),
      ),
    );
  }

  waitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (contxet) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  const SpinKitRing(
                    color: primaryColor,
                    lineWidth: 5,
                    size: 50.0,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  Text(
                    'Please Wait...',
                    style: grey15MediumTextStyle,
                  ),
                  heightSpace,
                  heightSpace,
                  heightSpace,
                  heightSpace,
                ],
              ),
            ],
          ),
        );
      },
    );
    Timer(
      const Duration(seconds: 3),
      () {
        currentIndex = 0;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BottomBar()),
        );
      },
    );
  }
}
