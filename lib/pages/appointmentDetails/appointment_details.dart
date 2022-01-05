import 'package:salon/pages/screens.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({Key key}) : super(key: key);

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
          'Appointment Details',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          details(),
        ],
      ),
      bottomNavigationBar: bookNowButton(context),
    );
  }

  details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: AssetImage('assets/salon/salon2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Crown salon',
                  style: black14MediumTextStyle,
                ),
                const SizedBox(height: 3),
                Text(
                  'A 9/a Sector 16,Gautam Budh Nagar',
                  style: grey12RegularTextStyle,
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: yellowColor,
                          size: 18,
                        ),
                        widthSpace,
                        Text(
                          '4.6 (100 Reviews)',
                          style: grey12RegularTextStyle,
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: fixPadding,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: whiteColor),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        'Open',
                        style: white10BoldTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Services',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Hair wash herbal • Hair color • Simple hair cutting - hair wash',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Selected Specialist',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Joya Patel • Hair stylist',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Text(
          'Appointment Date Time',
          style: black14MediumTextStyle,
        ),
        heightSpace,
        Text(
          'Thursday • 14 August, 2021 • 2:00 pm',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total Amount',
              style: black15SemiBoldTextStyle,
            ),
            Text(
              '\$209.00',
              style: black15SemiBoldTextStyle,
            ),
          ],
        ),
      ],
    );
  }

  bookNowButton(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 2.0,
          ),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PaymentMethod()),
            ),
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
                'Book Now',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
