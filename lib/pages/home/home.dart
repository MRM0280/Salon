import 'package:salon/pages/screens.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double height;
  double width;

  final categoryList = [
    {
      'image': 'assets/icons/all.png',
      'category': 'All',
      'color': const Color(0xffef9a9a),
    },
    {
      'image': 'assets/icons/nails.png',
      'category': 'Nails',
      'color': const Color(0xfff48fb1),
    },
    {
      'image': 'assets/icons/hair.png',
      'category': 'Hair',
      'color': const Color(0xffce93d8),
    },
    {
      'image': 'assets/icons/face.png',
      'category': 'Face',
      'color': const Color(0xff90caf9),
    },
    {
      'image': 'assets/icons/massage.png',
      'category': 'Massage',
      'color': const Color(0xff80cbc4),
    },
  ];

  final salonList = [
    {
      'image': 'assets/salon/salon2.png',
      'name': 'Crown salon',
      'address': 'A 9/a Sector 16,Gautam Budh Nagar',
      'rating': '4.6',
      'review': '100',
      'isFavorite': false,
    },
    {
      'image': 'assets/salon/salon3.png',
      'name': 'RedBox salon',
      'address': 'A 9/a Sector 16,Gautam Budh Nagar',
      'rating': '4.6',
      'review': '100',
      'isFavorite': false,
    },
  ];

  final offerList = [
    {
      'image': 'assets/offer/offer1.png',
      'salonName': 'Joseph drake hair salon',
      'title': 'Look awesome &  save some',
      'off': '25%',
    },
    {
      'image': 'assets/offer/offer1.png',
      'salonName': 'Joseph drake hair salon',
      'title': 'Look awesome &  save some',
      'off': '25%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: nestedScrollView(),
      ),
    );
  }

  nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, b) {
        return [
          SliverAppBar(
            expandedHeight: height * 0.27,
            automaticallyImplyLeading: false,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage('assets/salon/salon1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    color: blackColor.withOpacity(0.1),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/nearby.png',
                                color: whiteColor,
                                height: 15,
                                width: 15,
                              ),
                              widthSpace,
                              widthSpace,
                              Text(
                                'Samantha Shah',
                                style: white18SemiBoldTextStyle,
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Filter()),
                            ),
                            child: const Icon(
                              Icons.filter_alt,
                              color: whiteColor,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '6/36, Sohrab Bldg, H G Rd, Gamdevi\nMumbai Maharashtra',
                        style: white13RegularTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      heightSpace,
                      Text(
                        'Find and book best services',
                        style: white18SemiBoldTextStyle,
                      ),
                      heightSpace,
                      heightSpace,
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          cursorColor: whiteColor,
                          style: white14MediumTextStyle,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(top: 6),
                            hintText: 'Search salon services...',
                            hintStyle: white13MediumTextStyle,
                            prefixIcon: const Icon(
                              Icons.search,
                              color: whiteColor,
                              size: 15,
                            ),
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          category(),
          salon(),
          offers(),
        ],
      ),
    );
  }

  category() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Popular Category',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.072,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              final item = categoryList[index];
              Color color = item['color'];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding * 2.0,
                ),
                child: InkWell(
                  onTap: item['category'] == 'All'
                      ? () {}
                      : () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CategoryDetail(
                                category: item['category'],
                              ),
                            ),
                          ),
                  child: Container(
                    width: width * 0.149,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: item['color'],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          item['image'],
                          color: whiteColor,
                          height: 18,
                          width: 18,
                        ),
                        heightSpace,
                        Text(
                          item['category'],
                          style: white12SemiBoldTextStyle,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  salon() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Best Salon',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.218,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: salonList.length,
            itemBuilder: (context, index) {
              final item = salonList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding / 2,
                  fixPadding * 2.0,
                  fixPadding / 2,
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalonDetail(
                        tag: salonList[index],
                        image: item['image'],
                        name: item['name'],
                      ),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Hero(
                        tag: salonList[index],
                        child: Container(
                          height: height * 0.15,
                          width: width * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: blackColor.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 85,
                        left: 10,
                        right: 10,
                        child: Container(
                          padding: const EdgeInsets.all(fixPadding / 2),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: primaryColor.withOpacity(0.2),
                                blurRadius: 2.5,
                                spreadRadius: 2.5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item['name'],
                                    style: white13SemiBoldTextStyle,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        item['isFavorite'] =
                                            !item['isFavorite'];
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: item['isFavorite']
                                              ? const Text(
                                                  'Item add to favorite')
                                              : const Text(
                                                  'Item remove from favorite'),
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      item['isFavorite']
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: whiteColor,
                                      size: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                item['address'],
                                style: white12RegularTextStyle,
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: yellowColor,
                                    size: 15,
                                  ),
                                  widthSpace,
                                  Text(
                                    '${item['rating']} (${item['review']} reviews)',
                                    style: white12RegularTextStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  offers() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: fixPadding * 2.0,
            vertical: fixPadding * 1.5,
          ),
          child: Text(
            'Offers',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.179,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: offerList.length,
            itemBuilder: (context, index) {
              final item = offerList[index];
              return Padding(
                padding: EdgeInsets.fromLTRB(
                  index == 0 ? fixPadding * 2.0 : 0,
                  fixPadding / 2,
                  fixPadding * 2.0,
                  fixPadding / 2,
                ),
                child: Container(
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(item['image']),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: blackColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          fixPadding,
                          fixPadding,
                          fixPadding * 6.5,
                          fixPadding,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['salonName'],
                              style: black15MediumTextStyle,
                            ),
                            Text(
                              item['title'],
                              style: black18BoldTextStyle,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: fixPadding * 1.9),
                              padding: const EdgeInsets.symmetric(
                                horizontal: fixPadding,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '${item['off']} off',
                                style: white14MediumTextStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
