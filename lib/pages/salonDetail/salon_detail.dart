import 'package:expandable_text/expandable_text.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:salon/pages/screens.dart';
import 'package:salon/widget/column_builder.dart';

class SalonDetail extends StatefulWidget {
  final Object tag;
  final String image;
  final String name;
  const SalonDetail({Key key, this.tag, this.image, this.name})
      : super(key: key);

  @override
  _SalonDetailState createState() => _SalonDetailState();
}

class _SalonDetailState extends State<SalonDetail> {
  double height;
  bool isFavorite = false;
  String isSelected = 'about';
  GoogleMapController mapController;
  final Set<Marker> marker = {};

  final specialistsList = [
    {
      'image': 'assets/specialists/specialist1.png',
      'name': 'Sora',
      'work': 'Manager',
    },
    {
      'image': 'assets/specialists/specialist2.png',
      'name': 'Joya',
      'work': 'Hair stylist',
    },
    {
      'image': 'assets/salon/salon4.png',
      'name': 'Doe',
      'work': 'St.Barber',
    },
    {
      'image': 'assets/specialists/specialist3.png',
      'name': 'Helina',
      'work': 'M.Artist',
    },
    {
      'image': 'assets/specialists/specialist4.png',
      'name': 'Robat',
      'work': 'Hair Stylist',
    },
    {
      'image': 'assets/specialists/specialist4.png',
      'name': 'Robat',
      'work': 'Hair Stylist',
    },
  ];

  final offerList = [
    {
      'image': 'assets/offer/offer2.png',
      'title': 'Haircut and Hairstyle',
      'off': '25%',
      'price': '\$160.50',
      'completedDate': 'Nov 26, 2021',
    },
    {
      'image': 'assets/offer/offer3.png',
      'title': 'Bridal Beauty Makeup',
      'off': '25%',
      'price': '\$850.50',
      'completedDate': 'Nov 26, 2021',
    },
  ];

  final servicesList = [
    {
      'image': 'assets/icons/hairstyle.png',
      'service': 'Hairstyle',
      'type': '10',
      'color': const Color(0xffef9a9a),
    },
    {
      'image': 'assets/icons/hairdryer.png',
      'service': 'Hairdryer',
      'type': '5',
      'color': const Color(0xfff48fb1),
    },
    {
      'image': 'assets/icons/shaving.png',
      'service': 'Shaving',
      'type': '6',
      'color': const Color(0xffce93d8),
    },
    {
      'image': 'assets/icons/makeup.png',
      'service': 'Makeup',
      'type': '10',
      'color': const Color(0xff90caf9),
    },
    {
      'image': 'assets/icons/nails.png',
      'service': 'Nails',
      'type': '5',
      'color': const Color(0xff80cbc4),
    },
    {
      'image': 'assets/icons/coloring.png',
      'service': 'Coloring',
      'type': '6',
      'color': const Color(0xffef9a9a),
    },
    {
      'image': 'assets/icons/massage.png',
      'service': 'Massage',
      'type': '6',
      'color': const Color(0xfff48fb1),
    },
  ];

  final reviewList = [
    {
      'image': 'assets/users/user1.png',
      'name': 'Mitali John',
      'rating': 4,
      'time': '2 min',
      'review':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
    },
    {
      'image': 'assets/users/user2.png',
      'name': 'Raj Mehta',
      'rating': 3,
      'time': '2 days',
      'review':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
    },
  ];

  final galleryList = [
    {'image': 'assets/gallery/img1.png'},
    {'image': 'assets/gallery/img2.png'},
    {'image': 'assets/gallery/img3.png'},
    {'image': 'assets/gallery/img4.png'},
    {'image': 'assets/gallery/img5.png'},
    {'image': 'assets/gallery/img6.png'},
    {'image': 'assets/gallery/img7.png'},
    {'image': 'assets/gallery/img8.png'},
    {'image': 'assets/gallery/img9.png'},
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: nestedScrollView(),
      ),
      bottomNavigationBar: bookAppointmentButton(),
    );
  }

  nestedScrollView() {
    return NestedScrollView(
      headerSliverBuilder: (context, b) {
        return [
          SliverAppBar(
            pinned: true,
            expandedHeight: height * 0.25,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: whiteColor,
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: isFavorite
                          ? const Text('Item add to favorite')
                          : const Text('Item remove from favorite'),
                    ),
                  );
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: whiteColor,
                ),
              ),
            ],
            flexibleSpace: Hero(
              tag: widget.tag,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: blackColor.withOpacity(0.2),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.name,
                          style: white16BoldTextStyle,
                        ),
                        widthSpace,
                        Text(
                          'Women only'.toUpperCase(),
                          style: primaryColor9BoldTextStyle,
                        ),
                      ],
                    ),
                    Text(
                      'A 9/a Sector 16,Gautam Budh Nagar',
                      style: white13RegularTextStyle,
                    ),
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
                            widthSpace,
                            Text(
                              '(100 Reviews)',
                              style: white12RegularTextStyle,
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
                    heightSpace,
                    heightSpace,
                  ],
                ),
              ),
            ),
          ),
        ];
      },
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          options(),
          specialists(),
          tabBar(),
          isSelected == 'about'
              ? about()
              : isSelected == 'services'
                  ? services()
                  : isSelected == 'gallery'
                      ? gallery()
                      : review(),
        ],
      ),
    );
  }

  options() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        fixPadding * 2.0,
        fixPadding * 2.0,
        fixPadding * 2.0,
        0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              option('assets/icons/website.png', 'Website'),
              option('assets/icons/call.png', 'Call'),
              option('assets/icons/map_view.png', 'Direction'),
              option('assets/icons/share.png', 'Share'),
            ],
          ),
          divider(),
        ],
      ),
    );
  }

  option(String image, String title) {
    return Column(
      children: [
        Image.asset(
          image,
          height: 16,
          width: 16,
          color: primaryColor,
        ),
        const SizedBox(height: 3),
        Text(
          title,
          style: primaryColor13SemiBoldTextStyle,
        ),
      ],
    );
  }

  specialists() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            fixPadding * 2.0,
            0,
            fixPadding * 2.0,
            fixPadding * 1.5,
          ),
          child: Text(
            'Our Salon Specialists',
            style: black16SemiBoldTextStyle,
          ),
        ),
        SizedBox(
          height: height * 0.11,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: specialistsList.length,
            itemBuilder: (context, index) {
              final item = specialistsList[index];
              return Padding(
                padding: EdgeInsets.only(
                  left: index == 0 ? fixPadding * 2.0 : 0,
                  right: fixPadding * 1.5,
                ),
                child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SalonStaffProfile(
                        tag: specialistsList[index],
                        salonImage: widget.image,
                        salonName: widget.name,
                        image: item['image'],
                        name: item['name'],
                        work: item['work'],
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: specialistsList[index],
                        child: Container(
                          height: 47,
                          width: 47,
                          decoration: BoxDecoration(
                            border: Border.all(color: whiteColor, width: 1.3),
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: AssetImage(item['image']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: blackColor.withOpacity(0.1),
                                spreadRadius: 1.5,
                                blurRadius: 1.5,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item['name'],
                        style: black13MediumTextStyle,
                      ),
                      Text(
                        item['work'],
                        style: grey11RegularTextStyle,
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

  tabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
      padding: const EdgeInsets.symmetric(horizontal: fixPadding),
      decoration: BoxDecoration(
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 2),
            color: blackColor.withOpacity(0.1),
            spreadRadius: 1.5,
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'about';
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding,
              ),
              child: Text(
                'About',
                style: TextStyle(
                  color: isSelected == 'about' ? primaryColor : greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'services';
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding,
              ),
              child: Text(
                'Services',
                style: TextStyle(
                  color: isSelected == 'services' ? primaryColor : greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'gallery';
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding,
              ),
              child: Text(
                'Gallery',
                style: TextStyle(
                  color: isSelected == 'gallery' ? primaryColor : greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                isSelected = 'review';
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: fixPadding,
                vertical: fixPadding,
              ),
              child: Text(
                'Review',
                style: TextStyle(
                  color: isSelected == 'review' ? primaryColor : greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  about() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          aboutDetail(),
          divider(),
          openingHours(),
          divider(),
          location(),
          divider(),
          packageAndOffer(),
          heightSpace,
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }

  aboutDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        ExpandableText(
          '          Lorem ipsum dolor sit amet, consectetur adipisc ing lii elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n          Ut enim ad minim veniam, qui quis nostrud comi exercitation ullamco laboris nisi ut aliqui aliquip ex ea commodo consequat lorem ipsum dolor\n\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.\n\n          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua. Ut enim ad minim veniam, quis nostrud con exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
          expandText: 'Read More',
          collapseText: 'Show Less',
          maxLines: 7,
          linkColor: primaryColor,
          linkStyle: primaryColor13BoldTextStyle,
          style: grey13RegularTextStyle,
        ),
      ],
    );
  }

  moreDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace,
        heightSpace,
        Text(
          '          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua.',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
        Text(
          '          Lorem ipsum dolor sit amet, consectetur adipiscing elit, se sed do eiusmod tempor incididunt ut labore et dolore man magna aliqua. Ut enim ad minim veniam, quis nostrud con exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
          style: grey13RegularTextStyle,
        ),
        heightSpace,
        heightSpace,
      ],
    );
  }

  openingHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Opening Hours',
          style: black15SemiBoldTextStyle,
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Monday-Friday',
                  style: grey13MediumTextStyle,
                ),
                Text(
                  '9:00 am - 9:00 pm',
                  style: primaryColor14MediumTextStyle,
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'Monday-Friday',
                  style: grey13MediumTextStyle,
                ),
                Text(
                  '9:00 am - 9:00 pm',
                  style: primaryColor14MediumTextStyle,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  location() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Location',
              style: black15SemiBoldTextStyle,
            ),
            heightSpace,
            heightSpace,
            heightSpace,
            Text(
              'A 9/a Sector 16,Gautam Budh Nagar',
              style: grey13RegularTextStyle,
            ),
            heightSpace,
            Row(
              children: [
                const Icon(
                  Icons.near_me,
                  color: primaryColor,
                  size: 15,
                ),
                widthSpace,
                Text(
                  'Get directions - 5.2km',
                  style: primaryColor11SemiBoldTextStyle,
                ),
              ],
            ),
          ],
        ),
        widthSpace,
        widthSpace,
        widthSpace,
        Expanded(
          child: Container(
            height: 90,
            decoration: BoxDecoration(
              color: greyColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipPath(
              clipper: ShapeBorderClipper(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: GoogleMap(
                markers: marker,
                initialCameraPosition: const CameraPosition(
                  target: LatLng(40.729515, -73.985927),
                  zoom: 10,
                ),
                onMapCreated: (controller) {
                  mapController = controller;
                  marker.add(
                    Marker(
                      markerId: const MarkerId('location'),
                      infoWindow: InfoWindow(title: widget.name),
                      position: const LatLng(40.729515, -73.985927),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  packageAndOffer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current Package & Offers',
          style: black15SemiBoldTextStyle,
        ),
        ColumnBuilder(
          itemCount: offerList.length,
          itemBuilder: (context, index) {
            final item = offerList[index];
            return Padding(
              padding: const EdgeInsets.only(
                top: fixPadding * 1.5,
                bottom: fixPadding / 2,
              ),
              child: Container(
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
                            item['title'],
                            style: black18BoldTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          heightSpace,
                          Row(
                            children: [
                              Container(
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
                              widthSpace,
                              widthSpace,
                              Text(
                                item['price'],
                                style: primaryColor12BoldTextStyle,
                              ),
                            ],
                          ),
                          heightSpace,
                          Text(
                            'Completed package offer till ${item['completedDate']}',
                            style: black12RegularTextStyle,
                          ),
                          heightSpace,
                          heightSpace,
                          Text(
                            'Book Now',
                            style: primaryColor13BoldTextStyle,
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
      ],
    );
  }

  bookAppointmentButton() {
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
              MaterialPageRoute(
                  builder: (context) => const ScheduleAppointment()),
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
                'Book Appointment',
                style: white18SemiBoldTextStyle,
              ),
            ),
          ),
        ),
      ],
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
            style: black15SemiBoldTextStyle,
          ),
          ColumnBuilder(
            itemCount: servicesList.length,
            itemBuilder: (context, index) {
              final item = servicesList[index];
              Color color = item['color'];
              return Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? fixPadding * 2.0 : 0,
                  bottom: fixPadding * 2.0,
                ),
                child: Container(
                  padding: const EdgeInsets.only(right: fixPadding),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: blackColor.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(fixPadding * 1.2),
                        decoration: BoxDecoration(
                          color: item['color'],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.2),
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Image.asset(
                          item['image'],
                          color: whiteColor,
                          height: 24,
                          width: 24,
                        ),
                      ),
                      widthSpace,
                      widthSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['service'],
                              style: black14MediumTextStyle,
                            ),
                            Text(
                              '${item['type']} types',
                              style: grey12RegularTextStyle,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ViewService()),
                        ),
                        child: Text(
                          'View',
                          style: primaryColor13BoldTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  gallery() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Gallery',
            style: black15SemiBoldTextStyle,
          ),
          heightSpace,
          heightSpace,
          heightSpace,
          StaggeredGridView.countBuilder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            staggeredTileBuilder: (index) => StaggeredTile.count(
              index == 0 || index == 9 || index == 8
                  ? 2
                  : index == 4
                      ? 3
                      : 1,
              index == 1 || index == 5 ? 2 : 1,
            ),
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            itemCount: galleryList.length,
            itemBuilder: (context, index) {
              final item = galleryList[index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  review() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          reviewTextField(),
          allReview(),
        ],
      ),
    );
  }

  reviewTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Write your review', style: black15SemiBoldTextStyle),
            ratingStars(4),
          ],
        ),
        heightSpace,
        heightSpace,
        heightSpace,
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/users/user3.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            widthSpace,
            widthSpace,
            widthSpace,
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  cursorColor: primaryColor,
                  style: black14SemiBoldTextStyle,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: fixPadding,
                      vertical: 8,
                    ),
                    hintText: 'Write review here',
                    hintStyle: grey13RegularTextStyle,
                    border:
                        const UnderlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 7),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: fixPadding * 1.2,
              vertical: 3,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'Post',
              style: white10BoldTextStyle,
            ),
          ),
        ),
        divider(),
      ],
    );
  }

  allReview() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'All Review (110)',
          style: black14MediumTextStyle,
        ),
        ColumnBuilder(
          itemCount: reviewList.length,
          itemBuilder: (context, index) {
            final item = reviewList[index];
            return Padding(
              padding: const EdgeInsets.only(top: fixPadding * 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(item['image']),
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
                            item['name'],
                            style: black15MediumTextStyle,
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              ratingStars(item['rating']),
                              widthSpace,
                              Text(
                                '${item['time']} ago',
                                style: grey13RegularTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  heightSpace,
                  Text(
                    item['review'],
                    style: grey13RegularTextStyle,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  ratingStars(int rating) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        (rating == 5 ||
                rating == 4 ||
                rating == 3 ||
                rating == 2 ||
                rating == 1)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4 || rating == 3 || rating == 2)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4 || rating == 3)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5 || rating == 4)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
        (rating == 5)
            ? const Icon(Icons.star_rounded, color: yellowColor, size: 16)
            : Icon(Icons.star_rounded,
                color: greyColor.withOpacity(0.3), size: 16),
      ],
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 1.5),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
