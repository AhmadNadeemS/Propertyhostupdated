import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:signup/ImageCarousel.dart';
import 'package:signup/states/currentUser.dart';

class ViewAdds extends StatefulWidget {
  final bool isAdmin;

  const ViewAdds({Key key, this.isAdmin}) : super(key: key);
  @override
  _ViewAddsState createState() => _ViewAddsState(this.isAdmin);
}

class _ViewAddsState extends State<ViewAdds> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isAdmin = true;

  String data;
  _ViewAddsState(this.isAdmin);

  //bool isAdmin = false;

  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  FirebaseUser user;

  @override
  void initState() {
    super.initState();

    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    print(user.email);
    setState(() {

    });
  }

//  Stream<DocumentSnapshot> provideDocumentFieldStream() {
//    return Firestore.instance
//        .collection('users').document("6ztvDsMZl4TiYeTjXcYLlNy0YhX2")
//        .snapshots();
//  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff453658),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  begin: Alignment.bottomRight,
//                  colors: [
//                    Colors.black.withOpacity(.4),
//                    Colors.black.withOpacity(.2),
//                  ]
//              ),
//
              gradient: LinearGradient(
                //     colors: [Colors.deepPurple, Colors.purple], stops: [0.5, 1.0],
                colors: [Colors.deepPurple, Color(0xff2470c7)], stops: [0.5, 1.0],
              ),
            ),
          ),
          title: Text("Your Ads"),
        ),
        body: user!= null ? Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
//          decoration: BoxDecoration(
//              gradient: LinearGradient(
//                  colors: [
//                    const Color(0xff213A50),
//                    const Color(0xff071930)
//                  ],
//                  begin: FractionalOffset.topRight,
//                  end: FractionalOffset.bottomLeft)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent,width: 2.0,)

                  ),
          child: StreamBuilder(
            stream: Firestore.instance.collection('PostAdd').snapshots(),

            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {

                return Container(
//                  decoration: BoxDecoration(
//                      border: Border.all(color: Colors.blueAccent,width: 5.0,)
//
//                  ),
                  padding: EdgeInsets.all(12),
                  child: GridView.builder(
                    shrinkWrap: true,

                    //physics: NeverScrollableScrollPhysics(),
                    gridDelegate:
                    new SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.0,
                      //Padding: EdgeInsets.only(left: 16, right: 16),
                      crossAxisCount: 2,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 18,
                    ),
                    itemCount: snapshot.data.documents.length,

                    // ignore: missing_return
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.transparent,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: GridTile(
                            child: GestureDetector(
                              onTap: () {

                            Navigator.of(context).pushNamed(
                              ImageCarousel.routeName,
                              arguments: snapshot.data.documents[index].documentID.toString(),
                                );
                              },
                              child: Image.network(

                                snapshot.data.documents[index].data['Image Urls'][0],
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
//                              Image.network(
//                                snapshot.data.documents[index].data['Image Urls'][0],
//                                fit: BoxFit.cover,
//                              ),
                            ),
                            footer: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.white30, Colors.white],
                                      begin: FractionalOffset.centerRight,
                                      end: FractionalOffset.centerLeft)),
                              child: GridTileBar(
                               // backgroundColor: Colors.black87,

//                          leading: IconButton(
//                            icon: Icon(Icons.favorite),
//                            color: Theme.of(context).accentColor,
//                            onPressed: () {},
//                          ),
                                title: Text(
                                       snapshot.data.documents[index].data['Title'].toString().toUpperCase(),
                                  textAlign: TextAlign.center,style: TextStyle(  fontSize: 13,
                                  color: Colors.black54,),
                                  //style: TextStyle(fontStyle: F),
                                ),
//                          trailing: IconButton(
//                            icon: Icon(
//                              Icons.shopping_cart,
//                            ),
//                            onPressed: () {},
//                            color: Theme.of(context).accentColor,
//                          ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return CircularProgressIndicator();
//              return Center(
//                child: Text('Loading...'),
//              );
              }
            },
          ),
        )   : Center(child: Text("Error")),),
    );
  }
}
