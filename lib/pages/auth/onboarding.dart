import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:salon/pages/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageViewController = PageController(initialPage: 0);
  int currentPage = 0;
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(seconds: 5),
      (Timer time) {
        if (currentPage < 2) {
          currentPage++;
        } else {
          currentPage = 0;
        }
        pageViewController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  onChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2 - 20,
                    child: PageView(
                      controller: pageViewController,
                      scrollDirection: Axis.horizontal,
                      onPageChanged: onChanged,
                      children: [
                        page1(),
                        page2(),
                        page3(),
                      ],
                    ),
                  ),
                  pageIndicator(),
                ],
              ),
            ),
            Positioned(
              top: 450,
              child: Container(
                height: 510,
                width: 485,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image${currentPage + 1}.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: blackColor,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }

  pageIndicator() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 3.0,
        fixPadding * 2.0,
        fixPadding * 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => currentPage != 2
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  )
                : () {},
            child: Text(
              'SKIP',
              style: (currentPage != 2)
                  ? black13SemiBoldTextStyle
                  : const TextStyle(color: Colors.transparent),
            ),
          ),
          SmoothPageIndicator(
            controller: pageViewController,
            count: 3,
            effect: ExpandingDotsEffect(
              dotHeight: 6,
              dotWidth: 6,
              dotColor: greyColor.withOpacity(0.3),
              activeDotColor: primaryColor,
            ),
          ),
          currentPage != 2
              ? InkWell(
                  onTap: () {
                    setState(() {
                      currentPage++;
                    });
                    pageViewController.animateToPage(
                      currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    'NEXT',
                    style: black13SemiBoldTextStyle,
                  ),
                )
              : InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signin()),
                  ),
                  child: Text(
                    'SING IN',
                    style: black13SemiBoldTextStyle,
                  ),
                ),
        ],
      ),
    );
  }

  page1() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Find and Book Services',
          style: primaryColor15BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore\net dolore magna aliqua.',
          textAlign: TextAlign.center,
          style: black13RegularTextStyle,
        ),
      ],
    );
  }

  page2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Style that fit your Lifestyle',
          style: primaryColor15BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore\net dolore magna aliqua.',
          textAlign: TextAlign.center,
          style: black13RegularTextStyle,
        ),
      ],
    );
  }

  page3() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'The Professional Specialists',
          style: primaryColor15BoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore\net dolore magna aliqua.',
          textAlign: TextAlign.center,
          style: black13RegularTextStyle,
        ),
      ],
    );
  }
}
