import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/services/firestore_services.dart';
import 'package:dalil_app/widgets/business_hours.dart';
import 'package:dalil_app/widgets/contact_row.dart';
import 'package:dalil_app/widgets/positioned_icon.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class StoreDetails extends StatefulWidget {
  DocumentSnapshot documentSnapshot;
  StoreDetails({super.key, required this.documentSnapshot});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  final List<String> popUpList = ['بلاغ', 'شكوى'];
  final List<Map<String, String>> hours = [
    {
      'day': 'الأحد',
      'open': '10:00',
      'close': '10:00',
    },
    {
      "day": "الإثنين",
      "open": "10:00",
      "close": "11:00",
    },
    {
      "day": "الثلاثاء",
      "open": "10:00",
      "close": "10:00",
    },
    {
      "day": "الأربعاء",
      "open": "10:00",
      "close": "10:00",
    },
    {
      "day": "الخميس",
      "open": "10:00",
      "close": "10:00",
    },
  ];
  final _reviewFormKey = GlobalKey<FormState>();
  final TextEditingController reviewController = TextEditingController();
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                // header image + title + buttons
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    FancyShimmerImage(
                      imageUrl: widget.documentSnapshot['header-image'],
                      boxFit: BoxFit.cover,
                      width: double.infinity,
                      errorWidget: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.clear),
                          Text('error'),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      width: double.infinity,
                      color: Colors.white24,
                      child: Text(
                        widget.documentSnapshot['name'],
                      ),
                    ),
                    Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: PositionedIcon(
                        function: () async {
                          await FireStoreServices.addToBookmarks(
                            id: widget.documentSnapshot.id,
                            user: AuthService.firebaseUser!.email.toString(),
                            image: widget.documentSnapshot['header-image'],
                            name: widget.documentSnapshot['name'],
                            type: widget.documentSnapshot['type'],
                            address: widget.documentSnapshot['address'],
                            location: widget.documentSnapshot['location'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                //
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.topRight,
                  width: double.infinity,
                  color: Colors.white24,
                  child: TabBar(
                    labelColor: Styles.red,
                    isScrollable: true,
                    indicator: DotIndicator(
                      color: Styles.red,
                      distanceFromCenter: 20,
                    ),
                    tabs: const [
                      Tab(text: 'معلومات'),
                      Tab(text: 'الخدمات'),
                      Tab(text: 'صور'),
                      Tab(text: 'مراجعات و تقييمات'),
                    ],
                  ),
                ),
                SizedBox(
                  height: size,
                  child: TabBarView(
                    children: [
                      storeInfo(),
                      storeServices(),
                      storeGallery(),
                      storeReviews(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget storeInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.documentSnapshot['name'],
            style: const TextStyle(fontSize: 24),
          ),
          Text(widget.documentSnapshot['address']),
          const Text(
            'وصف:',
            style: TextStyle(fontSize: 24),
          ),
          Text(widget.documentSnapshot['desc']),
          // contact
          const Text(
            'تواصل',
            style: TextStyle(fontSize: 24),
          ),
          ContactRow(
            contact: widget.documentSnapshot == null
                ? '-'
                : widget.documentSnapshot['phone'],
            icon: Icons.call,
            color: Colors.green,
          ),
          const Text(
            'ساعات العمل',
            style: TextStyle(fontSize: 24),
          ),
          Column(
            children: hours
                .map(
                  (item) => BusinessHours(
                    day: '${item['day']}',
                    opening: '${item['open']}',
                    closing: '${item['close']}',
                  ),
                )
                .toList(),
          ),
          const Text(
            'الموقع على الخريطة',
            style: TextStyle(fontSize: 24),
          ),
          Container(
            padding: const EdgeInsets.all(12.0),
            height: 150,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  widget.documentSnapshot['lat'],
                  widget.documentSnapshot['lang'],
                ),
                zoom: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //

  Widget storeServices() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 44,
        ),
        itemCount: widget.documentSnapshot.get('serv').length,
        itemBuilder: (context, index) {
          return Container(
            constraints: const BoxConstraints(
              maxHeight: 100,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blueGrey[200],
            ),
            child: Text(
              '${widget.documentSnapshot['serv'][index]}',
              style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.fade,
                color: Styles.white,
              ),
            ),
          );
        },
      ),
    );
  }
  //

  Widget storeGallery() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('أضف صورة'),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 200,
          ),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          itemCount: widget.documentSnapshot.get('gallery').length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  height: 190,
                  imageUrl: widget.documentSnapshot['gallery'][index],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  //
  Widget storeReviews() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('أضف رد'),
              IconButton(
                onPressed: () => showModalBottomSheet(
                  isDismissible: true,
                  context: context,
                  builder: (context) {
                    return Form(
                      key: _reviewFormKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text('أضف رد'),
                            TextFormField(
                              maxLength: 180,
                              maxLines: 5,
                              validator: (value) {
                                return value!.isEmpty ? 'empty' : null;
                              },
                              controller: reviewController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Styles.red,
                                    foregroundColor: Styles.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (_reviewFormKey.currentState!
                                        .validate()) {
                                      FireStoreServices.reviewsCollection
                                          .doc()
                                          .set({
                                        "store":
                                            widget.documentSnapshot['name'],
                                        "username":
                                            AuthService.firebaseUser!.email,
                                        "content": reviewController.text,
                                      });
                                      Get.back();
                                    }
                                  },
                                  child: const Text('إرسال')),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          //
          StreamBuilder(
              stream: FireStoreServices.reviewsCollection
                  .where('store', isEqualTo: widget.documentSnapshot['name'])
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 5.0,
                                color: Colors.grey.shade400,
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(8),
                            tileColor: Colors.white,
                            leading: const CircleAvatar(
                              radius: 40,
                            ),
                            title: Text(snapshot.data!.docs[index]['username']),
                            subtitle:
                                Text(snapshot.data!.docs[index]['content']),
                            trailing: PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              color: Colors.grey[300],
                              itemBuilder: (context) => popUpList
                                  .map(
                                    (item) => PopupMenuItem(
                                      child: Text(item),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text(
                      'no reviews yet',
                      style: TextStyle(fontSize: 26),
                    ),
                  );
                }
                return const Center(
                  child: Text(
                    'no reviews yet',
                    style: TextStyle(fontSize: 26),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
