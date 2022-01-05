import 'package:salon/pages/screens.dart';
import 'package:salon/widget/column_builder.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key key}) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String isSelected = 'Credit card';

  final paymentMethodList = [
    {
      'image': 'assets/icons/payment.png',
      'name': 'Credit card',
      'detail': '**** **** **** 1234',
    },
    {
      'image': 'assets/icons/netbanking.png',
      'name': 'Bank account',
      'detail': '**** **** **** 1710',
    },
    {
      'image': 'assets/icons/paypal.png',
      'name': 'Paypal',
      'detail': 'yourname123@gmail.com',
    },
    {
      'image': 'assets/icons/cash.png',
      'name': 'Payment in cash',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'Payment Method',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AddNewCard()),
                ),
                child: Text(
                  'Add New Card',
                  style: primaryColor12BoldTextStyle,
                ),
              ),
            ],
          ),
          heightSpace,
          paymentMethod(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          continueButton(),
        ],
      ),
    );
  }

  paymentMethod() {
    return ColumnBuilder(
      itemCount: paymentMethodList.length,
      itemBuilder: (context, index) {
        final item = paymentMethodList[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: fixPadding * 2.0),
          child: InkWell(
            onTap: () {
              setState(() {
                isSelected = item['name'];
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding / 2,
              ),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected == item['name']
                      ? primaryColor
                      : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 2),
                    color: blackColor.withOpacity(0.1),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        item['image'],
                        height: 34,
                        width: 28,
                        color: isSelected == item['name']
                            ? primaryColor
                            : blackColor,
                      ),
                      widthSpace,
                      widthSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['name'],
                            style: isSelected == item['name']
                                ? primaryColor14RegularTextStyle
                                : black14RegularTextStyle,
                          ),
                          item['detail'] == null
                              ? Container()
                              : Text(
                                  item['detail'],
                                  style: grey12MediumTextStyle,
                                ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 15,
                    width: 15,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: isSelected == item['name']
                            ? primaryColor
                            : blackColor,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: isSelected == item['name']
                        ? Container(
                            height: 6,
                            width: 6,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                          )
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  continueButton() {
    return InkWell(
      onTap: () => bookingSuccessfulDialog(),
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
          'Continue with Credit Card',
          style: white18SemiBoldTextStyle,
        ),
      ),
    );
  }

  bookingSuccessfulDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding:
              const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: fixPadding * 2.0,
                  vertical: fixPadding * 3.0,
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/done.png',
                      color: primaryColor,
                      height: 50,
                      width: 50,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    Text(
                      'Your appointment booked\nsuccessfully',
                      textAlign: TextAlign.center,
                      style: black15SemiBoldTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    Text(
                      'Your appointment booking is successfully done.  Also we send invoice to your mail address.',
                      textAlign: TextAlign.center,
                      style: grey13RegularTextStyle,
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(fixPadding * 1.5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(color: primaryColor),
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
                          'Continue Booking',
                          style: white18SemiBoldTextStyle,
                        ),
                      ),
                    ),
                    heightSpace,
                    heightSpace,
                    heightSpace,
                    InkWell(
                      onTap: () {
                        currentIndex = 0;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomBar()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(fixPadding * 1.5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(color: primaryColor),
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
                          'Go to Appointment',
                          style: primaryColor18SemiBoldTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
