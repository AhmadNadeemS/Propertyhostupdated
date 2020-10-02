import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart';
import 'package:signup/comments.dart';
import 'package:signup/states/currentUser.dart';

//finalusersRef =Firestore.instance.collection('users');
class MyProfileFinal extends StatefulWidget {
  //final OurUser userData;
  //final String data;
  static const routeName = '/myProfileFinal';
  String uid;
  MyProfileFinal({this.uid});
  // String title;
  // String age;
  // String location;
  // String description;

  String image;

  //const MyProfileFinal({Key key, this.userData}) : super(key: key);

  //const MyProfileFinal({Key key, this.ourUser}) : super(key: key);

  //const MyProfileFinal({Key key, this.ourUser}) : super(key: key);
  //const MyProfileFinal({Key key, this.data}) : super(key: key);
  @override
  _MyProfileStateFinal createState() => _MyProfileStateFinal(uid: this.uid,);
=======

import 'package:signup/comments.dart';




// ignore: must_be_immutable
class MyProfileFinal extends StatefulWidget {
  static const routeName = '/myProfileFinal';
  String uid;

  MyProfileFinal({this.uid});

  String image;

  @override
  _MyProfileStateFinal createState() => _MyProfileStateFinal(
        uid: this.uid,
      );
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
}

class _MyProfileStateFinal extends State<MyProfileFinal> {
  final reviewKey = GlobalKey<ScaffoldState>();

<<<<<<< HEAD
  //final String _fullName = "Ali Qureshi";
  //final String data;
  //final String _status = "Property Dealer";
  String uid;
  //String image;
  final String _listings = "Listings";

  //final String _bio ="\"Hi, I am a Property Dealer.If you need property suitbale for your needs. You can contact me.\"";

  //int _rating = 0;
=======
  String uid;


  final String _listings = "Listings";
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isAdmin = true;

  _MyProfileStateFinal({this.uid});
<<<<<<< HEAD



  //bool isAdmin = false;

=======
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  FirebaseUser user;

  @override
  void initState() {
<<<<<<< HEAD

    super.initState();
    CurrentUser _current = Provider.of<CurrentUser>(context,listen: false);
    //OurUser _currents = Provider.of<OurUser>(context,listen: false);
    //  _current.updateStateFromDatabase(_current.getCurrentUser.uid,_current.getCurrentUser.displayName);
    //print('Value1${_current.getCurrentUser.uid}');
    //print('Value2$user.');
    //print('${data}');
=======
    super.initState();
   // CurrentUser _current = Provider.of<CurrentUser>(context, listen: false);

>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }
<<<<<<< HEAD
=======

>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
//  void rate(int rating) {
//    //Other actions based on rating such as api calls.
//    setState(() {
//      _rating = rating;
//    });
//  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _showContact(context));

    // Size screenSize = MediaQuery.of(context.size;
    final data = ModalRoute.of(context).settings.arguments as String;
    //  CurrentUser _current = Provider.of<CurrentUser>(context,listen: false);
    //_current.updateStateFromDatabase(data,_current.getCurrentUser.uid);

<<<<<<< HEAD

    return Scaffold(
        key: reviewKey,
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('My Profile'),
          centerTitle: true,
=======
    return SafeArea(
      child: Scaffold(
          key: reviewKey,
          backgroundColor: Colors.white,
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('My Profile'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Color(0xff2470c7)],
                  stops: [0.5, 1.0],
                ),
              ),
            ),
            centerTitle: true,
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
//        actions: <Widget>[
//          IconButton(
//            icon: Icon(Icons.notifications),
//            onPressed: () {
//              Navigator.pushNamed(context, "/activityFeed");
//            },
//          )
//        ],
<<<<<<< HEAD
          backgroundColor: Colors.grey[800],
          elevation: 0.0,
        ),
        body: user !=null ? Container(
          child: StreamBuilder(
            stream: Firestore.instance.collection('users').where("uid", isEqualTo:data).snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        SafeArea(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                //              _buildProfileImage(),
                                Center(
                                  child: Container(
                                    width: 140.0,
                                    height: 140.0,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(snapshot.data.documents.elementAt(index)['image']),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(70.0),
                                      border: Border.all(
                                        color: Colors.black26,
                                        width: 6.0,
                                      ),
                                    ),
                                  ),
                                ),
                                //_buildFullName(),
                                Text(snapshot.data.documents.elementAt(index)['displayName'], style: TextStyle(fontFamily: 'Roboto',
                                  color: Colors.black,
                                  fontSize: 28.0,
                                  fontWeight: FontWeight.w700,),),
                                //    _buildStatus(context),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 6.0),
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Text(
                                    snapshot.data.documents.elementAt(index)['title'],
                                    style: TextStyle(
                                      fontFamily: 'Spectral',
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                //       _buildBio(context),
                                Container(
                                  width: 270,
                                  color: Colors.white,
                                  child: Text(
                                    snapshot.data.documents.elementAt(index)['description'],
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Spectral',
                                      fontWeight: FontWeight.w400,
                                      //try changing weight to w500 if not thin
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                      fontSize: 16.0,),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                //       _buildpropertyStatus(context),
                                Container(
                                  color: Colors.grey[500],
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 4.0, horizontal: 6.0),
                                        child: Text(
                                          _listings,
                                          style: TextStyle(
                                            fontFamily: 'Spectral',
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // _buildPropertyList(),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  height: 200,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, '/PostDetail');
                                        },
                                        child: Container(
                                          width: 160.0,
                                          child: Card(
                                            child: Wrap(
                                              children: <Widget>[
                                                Container(
                                                  height: 120,
//                                                child: Image.asset(
//                                                  'assets/1.jpg',
//                                                  fit: BoxFit.cover,
//                                                ),
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  child: ListTile(
                                                    title: Text(
                                                      'heading',
                                                      style: TextStyle(
                                                          fontSize: 16, color: Colors.black),
                                                    ),
                                                    subtitle: Text(
                                                      'subHeading',
                                                      style: TextStyle(
                                                          fontSize: 14, color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, '/AdDetail');
                                        },
                                        child: Container(
                                          width: 160.0,
                                          child: Card(
                                            child: Wrap(
                                              children: <Widget>[
                                                Container(
                                                  height: 120,
//                                                child: Image.asset(
//                                                  'assets/1.jpg',
//                                                  fit: BoxFit.cover,
//                                                ),
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  child: ListTile(
                                                    title: Text(
                                                      'heading',
                                                      style: TextStyle(
                                                          fontSize: 16, color: Colors.black),
                                                    ),
                                                    subtitle: Text(
                                                      'subHeading',
                                                      style: TextStyle(
                                                          fontSize: 14, color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context, '/AdDetail');
                                        },
                                        child: Container(
                                          width: 160.0,
                                          child: Card(
                                            child: Wrap(
                                              children: <Widget>[
                                                Container(
                                                  height: 120,
//                                                child: Image.asset(
//                                                  'assets/1.jpg',
//                                                  fit: BoxFit.cover,
//                                                ),
                                                ),
                                                Container(
                                                  color: Colors.grey,
                                                  child: ListTile(
                                                    title: Text(
                                                      'heading',
                                                      style: TextStyle(
                                                          fontSize: 16, color: Colors.black),
                                                    ),
                                                    subtitle: Text(
                                                      'subHeading',
                                                      style: TextStyle(
                                                          fontSize: 14, color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //   _showReviewForm(),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.grey[500],
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            'User Reviews',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),

                                    ],

                                  ),

                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text('Click Icon for Reviews',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                                      GestureDetector(
                                        onTap: () => showComments(
                                          context,
                                          postId: snapshot.data.documents.elementAt(index)['uid'],
                                          //ownerId: ownerId,
                                          //     mediaUrl: snapshot.data.documents.elementAt(index)['image'],
                                        ),
                                        child: Icon(
                                          Icons.chat,
                                          size: 28.0,
                                          color: Colors.blue[900],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //  _showInformationForm(),
//                              Padding(
//                                padding: const EdgeInsets.all(20.0),
//                                child: ShadowContainer(
//                                  child: Column(
//                                    children: <Widget>[
//                                      Row(
//                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                        children: <Widget>[
//                                          Text("Rate book 1-10:"),
//                                          DropdownButton<int>(
//                                            value: _dropdownValue,
//                                            icon: Icon(Icons.arrow_downward),
//                                            iconSize: 24,
//                                            elevation: 16,
//                                            style: TextStyle(
//                                                color: Theme.of(context).secondaryHeaderColor),
//                                            underline: Container(
//                                              height: 2,
//                                              color: Theme.of(context).canvasColor,
//                                            ),
//                                            onChanged: (int newValue) {
//                                              setState(() {
//                                                _dropdownValue = newValue;
//                                              });
//                                            },
//                                            items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//                                                .map<DropdownMenuItem<int>>((int value) {
//                                              return DropdownMenuItem<int>(
//                                                value: value,
//                                                child: Text(value.toString()),
//                                              );
//                                            }).toList(),
//                                          ),
//                                        ],
//                                      ),
//                                      TextFormField(
//                                        controller: _reviewController,
//                                        maxLines: 6,
//                                        decoration: InputDecoration(
//                                          hintText: "Add A Review",
//                                        ),
//                                      ),
//                                      SizedBox(
//                                        height: 20.0,
//                                      ),
////                                      RaisedButton(
////                                        child: Padding(
////                                          padding: EdgeInsets.symmetric(horizontal: 80),
////                                          child: Text(
////                                            "Add Review",
////                                            style: TextStyle(
////                                              color: Colors.white,
////                                              fontWeight: FontWeight.bold,
////                                              fontSize: 20.0,
////                                            ),
////                                          ),
////                                        ),
//                                        onPressed: () {
//                                          if (_dropdownValue != null) {
//                                            String dataBack= snapshot.data.documents.elementAt(index)['uid'];
//                                            Navigator.of(context).pushNamed('/myProfileFinal',arguments: dataBack);
//                                         //   CurrentUser user = Provider.of<CurrentUser>(context,listen: false);
//                                          //  user.finishedBook(data, _dropdownValue, _reviewController.text);
//                                          //  print('Value6${user.getCurrentUser.uid}');
//                                            //cu.finishedBook(user.uid, _dropdownValue, _reviewController.text);
//                                            Navigator.pop(context);
////                                            DBFuture().finishedBook(
////                                                widget.groupModel.id,
////                                                widget.groupModel.currentBookId,
////                                                _authModel.uid,
////                                                _dropdownValue,
////                                                _reviewController.text);
////                                            Navigator.pushAndRemoveUntil(
////                                              context,
////                                              MaterialPageRoute(
////                                                builder: (context) => OurRoot(),
////                                              ),
////                                                  (route) => false,
////                                            );
//                                          } else {
//                                            reviewKey.currentState.showSnackBar(SnackBar(
//                                              content: Text("Need to add rating!"),
//                                            ));
//                                          }
//                                        },
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
                                Container(
                                  margin: EdgeInsets.only(top: 30),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        color: Colors.grey[500],
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        height: 25,
                                        child: Center(
                                          child: Text(
                                            'Personal Information',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                //    _showPersonalInformation(context),

                                Container(
                                  margin: EdgeInsets.only(left: 14, right: 14, bottom: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.only(
                                      bottomLeft: const Radius.circular(10.0),
                                      bottomRight: const Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 50,
                                        color: Colors.grey[400],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  width: 70,
                                                  child: Text(
                                                    'Name: ',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(snapshot.data.documents.elementAt(index)['displayName'],),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.grey[200],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  width: 70,
                                                  child: Text(
                                                    'Age: ',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(snapshot.data.documents.elementAt(index)['age'],),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 70,
                                        color: Colors.grey[400],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  width: 70,
                                                  child: Text(
                                                    'Address: ',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Flexible(child: Text(snapshot.data.documents.elementAt(index)['address'],)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        color: Colors.grey[200],
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                  width: 70,
                                                  child: Text(
                                                    'Cell No: ',
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(
                                                width: 50,
                                              ),
                                              Text(snapshot.data.documents.elementAt(index)['phoneNumber'],),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //   _editProfileButton(),
                                user.uid== snapshot.data.documents.elementAt(index)['uid']? Container(
                                  child: Center(
                                    child: FlatButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/AgentSignup');
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[800],
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "Edit Profile",
                                            style:
                                            TextStyle(color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ):Container(),
                                SizedBox(height: 8.0),
//                              Container(
//                                child: Center(
//                                  child: FlatButton(
//                                    onPressed: () {
//                                      Navigator.pushNamed(context, '/AgentSignup');
//                                    },
//                                    child: Container(
//                                      height: 50,
//                                      width: 100,
//                                      decoration: BoxDecoration(
//                                          color: Colors.grey[800],
//                                          borderRadius: BorderRadius.circular(10)),
//                                      child: Center(
//                                        child: Text(
//                                          "Edit Profile",
//                                          style:
//                                          TextStyle(color: Colors.white,
//                                              fontWeight: FontWeight.bold),
//                                        ),
//                                      ),
//                                    ),
//                                  ),
//                                ),
//                              ),
                                SizedBox(height: 8.0),
                              ],
                            ),
                          ),
                        ),
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
        )   : Center(child: Text("Error")));

  }

//  Widget _buildCoverImage(Size screenSize) {
//    return Container(
//      color: Colors.black38,
//      height: screenSize.height / 7.5,
//    );
//  }
//
//  Widget _editProfileButton() {
//    return Container(
//      child: Center(
//        child: FlatButton(
//          onPressed: () {
//            Navigator.pushNamed(context, '/AgentSignup');
//          },
//          child: Container(
//            height: 50,
//            width: 100,
//            decoration: BoxDecoration(
//                color: Colors.grey[800],
//                borderRadius: BorderRadius.circular(10)),
//            child: Center(
//              child: Text(
//                "Edit Profile",
//                style:
//                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildBio(BuildContext context) {
//    TextStyle bioTextStyle = TextStyle(
//      fontFamily: 'Spectral',
//      fontWeight: FontWeight.w400,
//      //try changing weight to w500 if not thin
//      fontStyle: FontStyle.italic,
//      color: Colors.black,
//      fontSize: 16.0,
//    );
//    return Container(
//      width: 270,
//      color: Colors.white,
//      child: Text(
//        _bio,
//        textAlign: TextAlign.center,
//        style: bioTextStyle,
//      ),
//    );
//  }
//
////  Widget _buildProfileImage() {
////    return Center(
////      child: Container(
////        width: 140.0,
////        height: 140.0,
////        decoration: BoxDecoration(
////          image: DecorationImage(
////            image: AssetImage('assets/1.jpg'),
////            fit: BoxFit.cover,
////          ),
////          borderRadius: BorderRadius.circular(70.0),
////          border: Border.all(
////            color: Colors.black26,
////            width: 6.0,
////          ),
////        ),
////      ),
////    );
////  }
//
////  Widget _buildFullName() {
////    TextStyle _nameTextStyle = TextStyle(
////      fontFamily: 'Roboto',
////      color: Colors.black,
////      fontSize: 28.0,
////      fontWeight: FontWeight.w700,
////    );
////
////    return Text(
////      _fullName,
////      style: _nameTextStyle,
////    );
////  }
//
////  Widget _buildStatus(BuildContext context) {
////    return Container(
////      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
////      decoration: BoxDecoration(
////        color: Theme.of(context).scaffoldBackgroundColor,
////        borderRadius: BorderRadius.circular(4.0),
////      ),
////      child: Text(
////        _status,
////        style: TextStyle(
////          fontFamily: 'Spectral',
////          color: Colors.black,
////          fontSize: 20.0,
////          fontWeight: FontWeight.w300,
////        ),
////      ),
////    );
////  }
//
//  Widget _buildpropertyStatus(BuildContext context) {
//    return Container(
//      color: Colors.grey[500],
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
//            child: Text(
//              _listings,
//              style: TextStyle(
//                fontFamily: 'Spectral',
//                color: Colors.black,
//                fontSize: 18.0,
//                fontWeight: FontWeight.bold,
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _buildReviews(BuildContext context) {
//    return Container(
//      color: Colors.red,
//      child: Padding(
//        padding: const EdgeInsets.all(8.0),
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                Text(
//                  _status,
//                  style: TextStyle(
//                    fontFamily: 'Spectral',
//                    color: Colors.black,
//                    fontSize: 13.0,
//                    fontWeight: FontWeight.bold,
//                  ),
//                ),
//              ],
//            ),
//            Row(
//              children: <Widget>[],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _buildPropertyList() {
//    return Container(
//      margin: EdgeInsets.only(top: 15),
//      height: 200,
//      child: ListView(
//        scrollDirection: Axis.horizontal,
//        children: <Widget>[
//          GestureDetector(
//            onTap: () {
//              Navigator.pushNamed(context, '/AdDetail');
//            },
//            child: Container(
//              width: 160.0,
//              child: Card(
//                child: Wrap(
//                  children: <Widget>[
//                    Container(
//                      height: 120,
//                      child: Image.asset(
//                        'assets/1.jpg',
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                    Container(
//                      color: Colors.grey,
//                      child: ListTile(
//                        title: Text(
//                          'heading',
//                          style: TextStyle(fontSize: 16, color: Colors.black),
//                        ),
//                        subtitle: Text(
//                          'subHeading',
//                          style: TextStyle(fontSize: 14, color: Colors.white),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          GestureDetector(
//            onTap: () {
//              Navigator.pushNamed(context, '/AdDetail');
//            },
//            child: Container(
//              width: 160.0,
//              child: Card(
//                child: Wrap(
//                  children: <Widget>[
//                    Container(
//                      height: 120,
//                      child: Image.asset(
//                        'assets/1.jpg',
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                    Container(
//                      color: Colors.grey,
//                      child: ListTile(
//                        title: Text(
//                          'heading',
//                          style: TextStyle(fontSize: 16, color: Colors.black),
//                        ),
//                        subtitle: Text(
//                          'subHeading',
//                          style: TextStyle(fontSize: 14, color: Colors.white),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//          GestureDetector(
//            onTap: () {
//              Navigator.pushNamed(context, '/AdDetail');
//            },
//            child: Container(
//              width: 160.0,
//              child: Card(
//                child: Wrap(
//                  children: <Widget>[
//                    Container(
//                      height: 120,
//                      child: Image.asset(
//                        'assets/1.jpg',
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                    Container(
//                      color: Colors.grey,
//                      child: ListTile(
//                        title: Text(
//                          'heading',
//                          style: TextStyle(fontSize: 16, color: Colors.black),
//                        ),
//                        subtitle: Text(
//                          'subHeading',
//                          style: TextStyle(fontSize: 14, color: Colors.white),
//                        ),
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
//  Widget _showInformationForm() {
//    return Container(
//      margin: EdgeInsets.only(top: 30),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            color: Colors.grey[500],
//            width: MediaQuery.of(context).size.width,
//            height: 25,
//            child: Center(
//              child: Text(
//                'Personal Information',
//                style: TextStyle(
//                    fontSize: 18,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//
//  Widget _showPersonalInformation(BuildContext context) {
//    return Container(
//      margin: EdgeInsets.only(left: 14, right: 14, bottom: 10),
//      padding: EdgeInsets.all(10),
//      decoration: BoxDecoration(
//        borderRadius: new BorderRadius.only(
//          bottomLeft: const Radius.circular(10.0),
//          bottomRight: const Radius.circular(10.0),
//        ),
//      ),
//      child: Column(
//        children: <Widget>[
//          Container(
//            height: 50,
//            color: Colors.grey[400],
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                      width: 70,
//                      child: Text(
//                        'Name: ',
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      )),
//                  SizedBox(
//                    width: 50,
//                  ),
//                  Text('Ali Qureshi'),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            height: 50,
//            color: Colors.grey[200],
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                      width: 70,
//                      child: Text(
//                        'Age: ',
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      )),
//                  SizedBox(
//                    width: 50,
//                  ),
//                  Text('35'),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            height: 70,
//            color: Colors.grey[400],
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                      width: 70,
//                      child: Text(
//                        'Address: ',
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      )),
//                  SizedBox(
//                    width: 50,
//                  ),
//                  Flexible(child: Text('DHA Defence, Islamabad')),
//                ],
//              ),
//            ),
//          ),
//          Container(
//            height: 50,
//            color: Colors.grey[200],
//            child: Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: <Widget>[
//                  Container(
//                      width: 70,
//                      child: Text(
//                        'Cell No: ',
//                        style: TextStyle(fontWeight: FontWeight.bold),
//                      )),
//                  SizedBox(
//                    width: 50,
//                  ),
//                  Text('+92 333 3424242'),
//                ],
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//
  Widget _showContact(BuildContext context) {
    return Container();
  }
//
//  Widget _showReviewForm() {
//    return Container(
//      margin: EdgeInsets.only(top: 30),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Container(
//            color: Colors.grey[500],
//            width: MediaQuery.of(context).size.width,
//            height: 25,
//            child: Center(
//              child: Text(
//                'User Reviews',
//                style: TextStyle(
//                    fontSize: 18,
//                    fontWeight: FontWeight.bold,
//                    color: Colors.black),
//              ),
//            ),
//          )
//        ],
//      ),
//    );
//  }
//}
}
showComments(BuildContext context,
    {String postId}) {
=======
            //backgroundColor: Colors.blueAccent,
            elevation: 0.0,
          ),
          body: user != null
              ? Container(
                  child: StreamBuilder(
                    stream: Firestore.instance
                        .collection('users')
                        .where("uid", isEqualTo: data)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: <Widget>[
                                SafeArea(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 20.0),
                                        //              _buildProfileImage(),
                                        Center(
                                          child: Container(
                                            width: 100.0,
                                            height: 100.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                    .data.documents
                                                    .elementAt(index)['image']),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                              border: Border.all(
                                                color: Colors.black26,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //_buildFullName(),
                                        Text(
                                          snapshot.data.documents
                                              .elementAt(index)['displayName'],
                                          style: TextStyle(
                                            fontFamily: 'Roboto',
                                            color: Colors.black,
                                            fontSize: 28.0,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        //    _buildStatus(context),
//                                  Container(
//                                    padding: EdgeInsets.symmetric(
//                                        vertical: 4.0, horizontal: 6.0),
//                                    decoration: BoxDecoration(
//                                      color: Theme
//                                          .of(context)
//                                          .scaffoldBackgroundColor,
//                                      borderRadius: BorderRadius.circular(4.0),
//                                    ),
//                                    child: Text(
//                                      snapshot.data.documents.elementAt(index)['title'],
//                                      style: TextStyle(
//                                        fontFamily: 'Spectral',
//                                        color: Colors.black,
//                                        fontSize: 20.0,
//                                        fontWeight: FontWeight.w300,
//                                      ),
//                                    ),
//                                  ),
                                        SizedBox(height: 10.0),
                                        //       _buildBio(context),
                                        Container(
                                          width: 270,
                                          //color: Colors.white,
                                          child: Text(
                                            snapshot.data.documents.elementAt(
                                                index)['description'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Spectral',
                                              fontWeight: FontWeight.w400,
                                              //try changing weight to w500 if not thin
                                              fontStyle: FontStyle.italic,
                                              color: Colors.grey[600],
                                              fontSize: 16.0,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8.0),
                                        //       _buildpropertyStatus(context),
                                        Container(
                                          //color: Colors.grey[500],
                                          color: Colors.teal[700],
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 6.0),
                                                child: Text(
                                                  _listings,
                                                  style: TextStyle(
                                                    fontFamily: 'Spectral',
                                                    color: Colors.white,
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // _buildPropertyList(),
                                        Container(
                                          margin: EdgeInsets.only(top: 15),
                                          height: 200,
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/AdDetail');
                                                },
                                                child: Container(
                                                  width: 160.0,
                                                  child: Card(
                                                    child: Wrap(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 140,
                                                width: double.infinity,
                                                child: Image.asset(
                                                  'assets/index.jpg',

                                                  fit: BoxFit.cover,
                                                ),
                                                        ),
                                                        Container(
                                                          color: Colors.grey,
                                                          child: ListTile(
                                                            title: Text(
                                                              'heading',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
//                                                      subtitle: Text(
//                                                        'subHeading',
//                                                        style: TextStyle(
//                                                            fontSize: 14, color: Colors.white),
//                                                      ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/AdDetail');
                                                },
                                                child: Container(
                                                  width: 160.0,
                                                  child: Card(
                                                    child: Wrap(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 140,
                                                          width: double.infinity,
                                                          child: Image.asset(
                                                            'assets/index.jpg',

                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          color: Colors.grey,
                                                          child: ListTile(
                                                            title: Text(
                                                              'heading',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
//                                                      subtitle: Text(
//                                                        'subHeading',
//                                                        style: TextStyle(
//                                                            fontSize: 14, color: Colors.white),
//                                                      ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),       GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, '/AdDetail');
                                                },
                                                child: Container(
                                                  width: 160.0,
                                                  child: Card(
                                                    child: Wrap(
                                                      children: <Widget>[
                                                        Container(
                                                          height: 140,
                                                          width: double.infinity,
                                                          child: Image.asset(
                                                            'assets/index.jpg',

                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Container(
                                                          color: Colors.grey,
                                                          child: ListTile(
                                                            title: Text(
                                                              'heading',
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black),
                                                            ),
//                                                      subtitle: Text(
//                                                        'subHeading',
//                                                        style: TextStyle(
//                                                            fontSize: 14, color: Colors.white),
//                                                      ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //   _showReviewForm(),
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                //                    color: Colors.blue,
                                                color: Colors.teal[700],
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 25,
                                                child: Center(
                                                  child: Text(
                                                    'User Reviews',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            //crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                'Click Icon for Reviews',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              GestureDetector(
                                                onTap: () => showComments(
                                                  context,
                                                  postId: snapshot
                                                      .data.documents
                                                      .elementAt(index)['uid'],
                                                  //ownerId: ownerId,
                                                  //     mediaUrl: snapshot.data.documents.elementAt(index)['image'],
                                                ),
                                                child: Icon(
                                                  Icons.chat,
                                                  size: 28.0,
                                                  color: Colors.blue[900],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 30),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                //color: Colors.grey[500],
                                                color: Colors.teal[700],
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 25,
                                                child: Center(
                                                  child: Text(
                                                    'Personal Information',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        //    _showPersonalInformation(context),
                                        SizedBox(
                                          height: 17,
                                        ),
                                        Container(
//                                    decoration: BoxDecoration(
//                                      borderRadius: BorderRadius.circular(40.0),
//                                      color: Colors.black54,
//
//                                    ),
                                          margin: EdgeInsets.only(
                                              left: 14, right: 14, bottom: 10),
                                          padding: EdgeInsets.all(10),

                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: 50,
                                                //color: Colors.grey[400],
                                                //color: Colors.grey[200],
                                                //color: Colors.black38,
                                                //color: Colors.blue[200],
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft: Radius
                                                                .circular(20),
                                                            topRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Colors.blue[200],
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.blue[300],
                                                        style:
                                                            BorderStyle.solid)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                          width: 70,
                                                          child: Text(
                                                            'Name: ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          )),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        snapshot.data.documents
                                                                .elementAt(
                                                                    index)[
                                                            'displayName'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                //color: Colors.grey[200],
                                                //color: Colors.blue[200],
                                                decoration: BoxDecoration(
                                                    //  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40)),color: Colors.blue[200],
                                                    color: Colors.blue[200],
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.blue[300],
                                                        style:
                                                            BorderStyle.solid)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                          width: 70,
                                                          child: Text(
                                                            'Age: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,color: Colors.black54,),
                                                          )),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        snapshot.data.documents
                                                            .elementAt(
                                                                index)['age'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 70,
                                                //color: Colors.grey[400],
                                                color: Colors.blue[200],
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                          width: 70,
                                                          child: Text(
                                                            'Address: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,color: Colors.black54,),
                                                          )),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Flexible(
                                                          child: Text(
                                                        snapshot.data.documents
                                                                .elementAt(
                                                                    index)[
                                                            'address'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 50,
                                                //color: Colors.grey[200],
                                                // color: Colors.blue[200],
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(20),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    20)),
                                                    color: Colors.blue[200],
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.blue[300],
                                                        style:
                                                            BorderStyle.solid)),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                          width: 70,
                                                          child: Text(
                                                            'Cell No: ',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,color: Colors.black54,),
                                                          )),
                                                      SizedBox(
                                                        width: 50,
                                                      ),
                                                      Text(
                                                        snapshot.data.documents
                                                                .elementAt(
                                                                    index)[
                                                            'phoneNumber'],
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black87),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //   _editProfileButton(),
                                        user.uid ==
                                                snapshot.data.documents
                                                    .elementAt(index)['uid']
                                            ? Container(
                                                child: Center(
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          '/AgentSignup');
                                                    },
                                                    child: Container(
                                                      height: 50,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Colors.grey[800],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                        child: Text(
                                                          "Edit Profile",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        SizedBox(height: 8.0),
                                        SizedBox(height: 8.0),
                                      ],
                                    ),
                                  ),
                                ),
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
                )
              : Center(child: Text("Error"))),
    );
  }

  Widget _showContact(BuildContext context) {
    return Container();
  }
}

showComments(BuildContext context, {String postId}) {
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Comments(
      postId: postId,
      //postOwnerId: ownerId,
      //   image: mediaUrl,
    );
  }));
}
