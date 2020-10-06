import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './widgets/TextIcon.dart';

class ImageCarousel extends StatefulWidget {
  static const routeName = '/ImageCarousel';

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel>{
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;
//  List<NetworkImage> _listOfImages = <NetworkImage>[];
  List<Image> _listOfImages = <Image>[];
  bool isLoading = false;

  @override
  void initState() {


    super.initState();
    // CurrentUser _current = Provider.of<CurrentUser>(context, listen: false);

    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    final String PostId = ModalRoute.of(context).settings.arguments;
//
//    Widget imageSliderCarousel = Container(
//      height: 200,
//      child: Carousel(
//        boxFit: BoxFit.fill,
//        images: [
//          AssetImage('assets/1.jpg'),
//          AssetImage('assets/2.jpg'),
//          AssetImage('assets/3.jpg'),
//        ],
//        autoplay: false,
//        indicatorBgPadding: 1.0,
//        dotSize: 4.0,
//        dotColor: Colors.blue,
//        dotBgColor: Colors.transparent,
//      ),
//    );
    createAlertDialog(BuildContext context) {
      TextEditingController controller = TextEditingController();
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Enter Your Offer Price'),
              content: TextField(
                  keyboardType: TextInputType.number, controller: controller),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('Make Offer'),
                  onPressed: () {},
                )
              ],
            );
          });
    }

    createContactDialog(BuildContext context) {
      TextEditingController controller = TextEditingController();
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Contact information\n\n'
                  '03365543873\n\n'
                  'faraz@gmail.com\n\n'
                  'or send a message hear'),
              content: TextField(
                controller: controller,
              ),
              actions: <Widget>[
                MaterialButton(
                  elevation: 5.0,
                  child: Text('send'),
                  onPressed: () {},
                )
              ],
            );
          });
    }

    return SafeArea(
      child: Scaffold(
      //  backgroundColor: Colors.blue[800],
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.2),
                    ]
                ),
//                gradient: LinearGradient(
//                  //     colors: [Colors.deepPurple, Colors.purple], stops: [0.5, 1.0],
//                  colors: [Colors.deepPurple, Color(0xff2470c7)],
//                  stops: [0.5, 1.0],
//                ),
//              gradient: LinearGradient(
//                  begin: Alignment.bottomRight,
//                  colors: [
//                    Colors.black.withOpacity(.4),
//                    Colors.black.withOpacity(.2),
//                  ]
//              ),
              ),
            ),
            //backgroundColor: Colors.grey[800],
            title: Text("Ad Details"),
            centerTitle: true,
          ),
        body: user != null ? Container(
          child:
            //stream: Firestore.instance.collection('PostAdd').document(Pos)
            StreamBuilder(
              stream: Firestore.instance.collection('PostAdd').where("PostID",isEqualTo: PostId).snapshots(),            //stream: Firestore.instance.collection('PostAdd').document(PostId).snapshots(),
            //stream: Firestore.instance.collection('PostAdd').where("uid", isEqualTo: Firestore.instance.collection("PostAdd").document('uid').collection(PostId)).snapshots;
            //stream: Firestore.instance.collection('PostAdd').document("uid").collection(PostId).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {

                return ListView.builder(

                  itemCount: snapshot.data.documents.length,

                  itemBuilder: (BuildContext context, int index) {
                    _listOfImages = [];
                    for (int i = 0;
                    i < snapshot.data.documents[index].data['Image Urls'].length;
                    i++
                    )
                    {
                      _listOfImages.add(Image.network(snapshot
                          .data.documents[index].data['Image Urls'][i],
                       // snapshot.data.documents[index].data['Image Urls'][0],
                        //'https://previews.123rf.com/images/blueringmedia/blueringmedia1701/blueringmedia170100692/69125003-colorful-kite-flying-in-blue-sky-illustration.jpg',
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                      ),
                      );
                    }
                    //final List<Image> children = snapshot.data.documents.map<Image>((e) => Image.network(e["Image Urls"].toString())).toList();
                    //List<NetworkImage> _listOfImages = <NetworkImage>[snapshot.data.documents[index].data["Image Urls"][index]];
                    return Column(

                      children: <Widget>[

                      Center(
                        child: Container(
                        height: 200,
                        child: Center(
                          child: Carousel(
                            boxFit: BoxFit.fill,
                            images:
                            _listOfImages,
                            autoplay: false,
                            indicatorBgPadding: 1.0,
                            dotSize: 4.0,
                            dotColor: Colors.blue,
                            dotBgColor: Colors.transparent,
                          ),
                        ),
                    ),
                      ),
                        Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                snapshot
                                    .data.documents
                                    .elementAt(index)['Title'],
                                style: Theme
                                    .of(context)
                                    .textTheme
                                // ignore: deprecated_member_use
                                    .title
                                    .copyWith(fontSize: 24.0),
                              ),
                              Container(
                                margin: const EdgeInsets.symmetric(vertical: 16.0),
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(color: Colors.grey, width: 0.4),
                                    bottom: BorderSide(color: Colors.grey, width: 0.4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Rooms'] !=null? TextIcon(
                                      icon: FontAwesomeIcons.bed,
                                      //text: "Bedroom",
                                      text: ('${snapshot
                                          .data.documents.elementAt(index)['Main Features']['Rooms'].toString()} Bedroom'),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)["Unit Area"] !=null? TextIcon(
                                      icon: FontAwesomeIcons.home,
                                      text: ('${snapshot
                                          .data.documents
                                          .elementAt(index)['Property Size']}' " " '${snapshot
                                          .data.documents
                                          .elementAt(index)['Unit Area']}'),
                                    ): SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Bathrooms']!=null? TextIcon(
                                      icon: FontAwesomeIcons.shower,
                                      text: ('${snapshot.data.documents.elementAt(index)['Main Features']['Bathrooms'].toString()} Bathroom'),
                                    ): SizedBox.shrink(),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Description",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                // ignore: deprecated_member_use
                                    .title
                                    .copyWith(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                    snapshot
                                        .data.documents
                                        .elementAt(index)['Description'],style: TextStyle(color: Colors.grey),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    "Details",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                    // ignore: deprecated_member_use
                                        .title
                                        .copyWith(fontSize: 20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Type: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 23,
                                            ),

                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Property Type']),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 70,
                                                child: Text(
                                                  'Price: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents
                                                .elementAt(index)['Price'].toString()),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 70,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 70,
                                                child: Text(
                                                  'Location: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Flexible(
                                                child: Text(   snapshot
                                                    .data.documents
                                                    .elementAt(index)['Address']["location"])),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.white,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 70,
                                                child: Text(
                                                  'Area: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),
                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Property Size']),
                                            SizedBox(width:5),
                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Unit Area']),

                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 70,
                                                child: Text(
                                                  'Purpose: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Property Size']),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Center(
                                  child: Text(
                                    "Main Features",
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                    // ignore: deprecated_member_use
                                        .title
                                        .copyWith(fontSize: 20.0),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Sewarege'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Sewarege: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                        Text(   snapshot
                                            .data.documents.elementAt(index)['Main Features']['Sewarege'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),

                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Balloted'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Balloted: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['Balloted'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),  snapshot
                                        .data.documents.elementAt(index)['Main Features']['Corner'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Corner: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['Corner'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),  snapshot
                                        .data.documents.elementAt(index)['Main Features']['Disputed'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Disputed: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['Disputed'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),  snapshot
                                        .data.documents.elementAt(index)['Main Features']['Park facing'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Park facing: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['Park facing'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),  snapshot
                                        .data.documents.elementAt(index)['Main Features']['Possession'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Possession: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['Possession'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),  snapshot
                                        .data.documents.elementAt(index)['Main Features']['sui gas'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Sui Gas: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['sui gas'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['water supply'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),

                                            Row(
                                              children: [
                                                Container(
                                                    width: 100,
                                                    child: Text(
                                                      'Water Supply: ',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold),
                                                    )),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents.elementAt(index)['Main Features']['water supply'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Build year']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Built in Year: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Build year']),
                                          ],
                                        ),
                                      ),
                                    ): SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Parking space']!=null? Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Parking Spaces: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Parking space']),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Rooms']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Beds: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Flexible(child: Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Rooms'])),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Bathrooms']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Bathrooms: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Bathrooms']),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['kitchens'].toString()==null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Kitchens: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['kitchens'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Floors']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Floors: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Floors'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
//                                  Container(
//                                    height: 50,
//                                    color: Colors.grey[100],
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        //crossAxisAlignment: CrossAxisAlignment.center,
//                                        children: <Widget>[
//                                          //                             Icon(Icons.schedule,),
//                                          Container(
//                                              width: 100,
//                                              child: Text(
//                                                'Drawing Room: ',
//                                                style: TextStyle(
//                                                    fontWeight: FontWeight.bold),
//                                              )),
//                                          SizedBox(
//                                            width: 50,
//                                          ),
//
//                                          Text('Yes'),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                  Container(
//                                    height: 50,
//                                    color: Colors.grey[100],
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        //crossAxisAlignment: CrossAxisAlignment.center,
//                                        children: <Widget>[
//                                          //                             Icon(Icons.schedule,),
//                                          Container(
//                                              width: 100,
//                                              child: Text(
//                                                'Dining Room: ',
//                                                style: TextStyle(
//                                                    fontWeight: FontWeight.bold),
//                                              )),
//                                          SizedBox(
//                                            width: 50,
//                                          ),
//
//                                          Text('2'),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
//                                  Container(
//                                    height: 50,
//                                    color: Colors.grey[100],
//                                    child: Padding(
//                                      padding: const EdgeInsets.all(8.0),
//                                      child: Row(
//                                        mainAxisAlignment: MainAxisAlignment.start,
//                                        //crossAxisAlignment: CrossAxisAlignment.center,
//                                        children: <Widget>[
//                                          //                             Icon(Icons.schedule,),
//                                          Container(
//                                              width: 100,
//                                              child: Text(
//                                                'Furnished: ',
//                                                style: TextStyle(
//                                                    fontWeight: FontWeight.bold),
//                                              )),
//                                          SizedBox(
//                                            width: 50,
//                                          ),
//
//                                          Text('No'),
//                                        ],
//                                      ),
//                                    ),
//                                  ),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Flooring']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Flooring: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Flooring']),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Waste disposal'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Waste disposal: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Waste disposal'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Elevators'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Elevators: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Elevators'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Floors']!=null?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Floors: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Floors']),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Maintenance Staff'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Maintenance Staff: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Maintenance Staff'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    snapshot
                                        .data.documents.elementAt(index)['Main Features']['Security Staff'].toString()=="true"?Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,

                                                child: Text(
                                                  'Security Staff: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(snapshot
                                                .data.documents.elementAt(index)['Main Features']['Waste disposal'].toString()),
                                          ],
                                        ),
                                      ),
                                    ):SizedBox.shrink(),
                                    Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Available Days: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Available Days']),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      color: Colors.grey[100],
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          //crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            //                             Icon(Icons.schedule,),
                                            Container(
                                                width: 100,
                                                child: Text(
                                                  'Meeting Time: ',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold),
                                                )),
                                            SizedBox(
                                              width: 50,
                                            ),

                                            Text(   snapshot
                                                .data.documents
                                                .elementAt(index)['Meeting Time']),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                onPressed: () {
                                  createAlertDialog(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 40),
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(color: Colors.grey[800],border: Border.all(
                                      width: 1.0
                                  ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    ),),
                                  child: Center(
                                    child: Text(
                                      "Make Offer",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: FlatButton(
                                onPressed: () {
                                  createContactDialog(context);
                                },
                                child: Container(
                                  height: 50,
                                  width: 80,
                                  margin: EdgeInsets.only(left: 0),
                                  decoration: BoxDecoration(color: Colors.grey[800],border: Border.all(
                                      width: 1.0
                                  ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5.0)
                                    ),),
                                  child: Center(
                                    child: Text(
                                      "Contact",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,fontSize: 12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
//                        Padding(
//                          padding: const EdgeInsets.only(top: 15, left: 5),
//                          child: Text(
//                          snapshot.data['displayName'],
//                            style: TextStyle(
//                              color: Colors.black,
//                              fontSize: 16,
//                              fontWeight: FontWeight.bold,
//                            ),
//                          ),
//                        ),
                        //Text(snapshot.data['displayName'],),
                        //Text(snapshot.data['email'],),
//Image.network(snapshot.data['url'],),
                      ],
                    );
                  },
                );
              } else {
                debugPrint('Loading...');
                return Center(
                  child: Text('Loading...'),
                );
              }
            },
          ),
        )   : Center(child: Text("Error")),),
    );
  }
}
