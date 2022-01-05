import 'package:salon/pages/screens.dart';

class Filter extends StatefulWidget {
  const Filter({Key key}) : super(key: key);

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String isTap = 'Hairstyle';
  String gender = 'women';
  String short = 'lowToHigh';
  RangeValues _distanceRangeValues = const RangeValues(0, 5);
  RangeValues _priceRangeValues = const RangeValues(0, 550);

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
          'Filter',
          style: black18SemiBoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          services(),
          rating(),
          selectGender(),
          shortBy(),
          distance(),
          price(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 2.0,
              vertical: fixPadding * 3.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                applyButton(),
                cancelButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  services() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Wrap(
            children: [
              service(
                service: 'Facial makeup',
                ontap: () {
                  setState(() {
                    isTap = 'Facial makeup';
                  });
                },
              ),
              service(
                service: 'Trim & Saving',
                ontap: () {
                  setState(() {
                    isTap = 'Trim & Saving';
                  });
                },
              ),
              service(
                service: 'Body care',
                ontap: () {
                  setState(() {
                    isTap = 'Body care';
                  });
                },
              ),
              service(
                service: 'Spa',
                ontap: () {
                  setState(() {
                    isTap = 'Spa';
                  });
                },
              ),
              service(
                service: 'Hair cuting',
                ontap: () {
                  setState(() {
                    isTap = 'Hair cuting';
                  });
                },
              ),
              service(
                service: 'Hairstyle',
                ontap: () {
                  setState(() {
                    isTap = 'Hairstyle';
                  });
                },
              ),
              service(
                service: 'Hair color',
                ontap: () {
                  setState(() {
                    isTap = 'Hair color';
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  service({String service, Function ontap}) {
    return Padding(
      padding: const EdgeInsets.only(
        right: fixPadding,
        bottom: fixPadding,
      ),
      child: InkWell(
        onTap: ontap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 9.1,
            vertical: fixPadding / 3,
          ),
          decoration: BoxDecoration(
            color: isTap == service ? primaryColor : Colors.transparent,
            border:
                Border.all(color: isTap == service ? primaryColor : greyColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            service,
            style: TextStyle(
              color: isTap == service ? whiteColor : greyColor,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  rating() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Rating',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            children: [
              const Icon(
                Icons.star_rounded,
                color: yellowColor,
                size: 18,
              ),
              const SizedBox(width: 1),
              const Icon(
                Icons.star_rounded,
                color: yellowColor,
                size: 18,
              ),
              const SizedBox(width: 1),
              const Icon(
                Icons.star_rounded,
                color: yellowColor,
                size: 18,
              ),
              const SizedBox(width: 1),
              Icon(
                Icons.star_rounded,
                color: greyColor.withOpacity(0.3),
                size: 18,
              ),
              const SizedBox(width: 1),
              Icon(
                Icons.star_rounded,
                color: greyColor.withOpacity(0.3),
                size: 18,
              ),
              widthSpace,
              Text(
                '3.0 star',
                style: grey13MediumTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }

  selectGender() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Gender',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    gender = 'men';
                  });
                },
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: gender == 'men'
                            ? whiteColor
                            : greyColor.withOpacity(0.3),
                        border: Border.all(
                          color: gender == 'men'
                              ? primaryColor
                              : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: gender == 'men'
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
                    widthSpace,
                    widthSpace,
                    Text(
                      'Men',
                      style: TextStyle(
                        color: gender == 'men' ? primaryColor : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              InkWell(
                onTap: () {
                  setState(() {
                    gender = 'women';
                  });
                },
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: gender == 'women'
                            ? whiteColor
                            : greyColor.withOpacity(0.3),
                        border: Border.all(
                          color: gender == 'women'
                              ? primaryColor
                              : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: gender == 'women'
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
                    widthSpace,
                    widthSpace,
                    Text(
                      'Women',
                      style: TextStyle(
                        color: gender == 'women' ? primaryColor : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              widthSpace,
              InkWell(
                onTap: () {
                  setState(() {
                    gender = 'other';
                  });
                },
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: gender == 'other'
                            ? whiteColor
                            : greyColor.withOpacity(0.3),
                        border: Border.all(
                          color: gender == 'other'
                              ? primaryColor
                              : Colors.transparent,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: gender == 'other'
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
                    widthSpace,
                    widthSpace,
                    Text(
                      'Other',
                      style: TextStyle(
                        color: gender == 'other' ? primaryColor : greyColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  shortBy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Short by',
            style: black16SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                short = 'popular';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: short == 'popular'
                        ? whiteColor
                        : greyColor.withOpacity(0.3),
                    border: Border.all(
                      color: short == 'popular'
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: short == 'popular'
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
                widthSpace,
                widthSpace,
                Text(
                  'Most popular',
                  style: TextStyle(
                    color: short == 'popular' ? primaryColor : greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                short = 'lowToHigh';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: short == 'lowToHigh'
                        ? whiteColor
                        : greyColor.withOpacity(0.3),
                    border: Border.all(
                      color: short == 'lowToHigh'
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: short == 'lowToHigh'
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
                widthSpace,
                widthSpace,
                Text(
                  'Cost low to high',
                  style: TextStyle(
                    color: short == 'lowToHigh' ? primaryColor : greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                short = 'highToLow';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: short == 'highToLow'
                        ? whiteColor
                        : greyColor.withOpacity(0.3),
                    border: Border.all(
                      color: short == 'highToLow'
                          ? primaryColor
                          : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: short == 'highToLow'
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
                widthSpace,
                widthSpace,
                Text(
                  'Cost high to low',
                  style: TextStyle(
                    color: short == 'highToLow' ? primaryColor : greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          InkWell(
            onTap: () {
              setState(() {
                short = 'nearby';
              });
            },
            child: Row(
              children: [
                Container(
                  height: 15,
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: short == 'nearby'
                        ? whiteColor
                        : greyColor.withOpacity(0.3),
                    border: Border.all(
                      color:
                          short == 'nearby' ? primaryColor : Colors.transparent,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: short == 'nearby'
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
                widthSpace,
                widthSpace,
                Text(
                  'Near by',
                  style: TextStyle(
                    color: short == 'nearby' ? primaryColor : greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  distance() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Distance',
            style: black16SemiBoldTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: fixPadding * 2.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${_distanceRangeValues.end.toString()}km',
                style: grey13MediumTextStyle,
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 5, disabledThumbRadius: 5),
              rangeValueIndicatorShape:
                  const PaddleRangeSliderValueIndicatorShape(),
              trackHeight: 2,
              valueIndicatorTextStyle: white13MediumTextStyle,
              valueIndicatorColor: primaryColor,
            ),
            child: RangeSlider(
              min: 0,
              max: 8,
              divisions: 8,
              activeColor: primaryColor,
              inactiveColor: greyColor.withOpacity(0.3),
              values: _distanceRangeValues,
              labels: RangeLabels(
                _distanceRangeValues.start.round().toString(),
                _distanceRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _distanceRangeValues = values;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  price() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          Text(
            'Price',
            style: black16SemiBoldTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(right: fixPadding * 2.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '\$${_priceRangeValues.end.round().toString()}',
                style: grey13MediumTextStyle,
              ),
            ),
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
              rangeThumbShape: const RoundRangeSliderThumbShape(
                  enabledThumbRadius: 5, disabledThumbRadius: 5),
              rangeValueIndicatorShape:
                  const PaddleRangeSliderValueIndicatorShape(),
              trackHeight: 2,
              valueIndicatorTextStyle: white13MediumTextStyle,
              valueIndicatorColor: primaryColor,
            ),
            child: RangeSlider(
              min: 0,
              max: 1000,
              divisions: 20,
              activeColor: primaryColor,
              inactiveColor: greyColor.withOpacity(0.3),
              values: _priceRangeValues,
              labels: RangeLabels(
                _priceRangeValues.start.round().toString(),
                _priceRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRangeValues = values;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  applyButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Text(
        'Apply',
        style: primaryColor15BoldTextStyle,
      ),
    );
  }

  cancelButton() {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Text(
        'Cancel',
        style: grey15BoldTextStyle,
      ),
    );
  }
}
