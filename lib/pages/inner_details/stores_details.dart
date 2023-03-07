import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalil_app/constant/styles.dart';
import 'package:dalil_app/services/auth_service.dart';
import 'package:dalil_app/widgets/positioned_icon.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class StoreDetails extends StatefulWidget {
  DocumentSnapshot documentSnapshot;
  StoreDetails({super.key, required this.documentSnapshot});

  @override
  State<StoreDetails> createState() => _StoreDetailsState();
}

class _StoreDetailsState extends State<StoreDetails> {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 3,
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
                          Text('data'),
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
                    const Positioned(
                      top: 20,
                      left: 0,
                      right: 0,
                      child: PositionedIcon(),
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
          Text(widget.documentSnapshot['name']),
          const Text('وصف:'),
          Text(widget.documentSnapshot['address']),
          Text(widget.documentSnapshot['desc']),
          const Text(
            'الخدمات',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Chip(label: Text('d')),
                );
              },
            ),
          ),
          const Text('الموقع على الخريطة'),
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
  Widget storeGallery() {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FancyShimmerImage(
              imageUrl: widget.documentSnapshot['header-image'],
            ),
          ),
        );
      },
    );
  }

  //
  Widget storeReviews() {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: 2,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            contentPadding: const EdgeInsets.all(8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            tileColor: Colors.deepPurple[200],
            leading: CircleAvatar(
              radius: 40,
              child: FancyShimmerImage(
                imageUrl: 'https://picsum.photos/250?image=9',
              ),
            ),
            title: Text('${AuthService.firebaseUser!.email}'),
            subtitle: const Text('content............'),
            trailing: const Icon(Icons.more_vert),
          ),
        );
      },
    );
  }
}
