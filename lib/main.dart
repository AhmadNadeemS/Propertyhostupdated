import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:signup/ImageCarousel.dart';
import 'package:signup/MainScreenUsers.dart';
import 'package:signup/MyProfileFinal.dart';
import 'package:signup/PostDetail.dart';
import 'package:signup/activity_feed.dart';
import 'package:signup/agentSignup.dart';
import 'package:signup/choseOnMap.dart';
=======
import 'package:signup/MainScreenUsers.dart';
import 'package:signup/MyProfileFinal.dart';
import 'package:signup/activity_feed.dart';
import 'package:signup/agentSignup.dart';
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
//import 'package:signup/create_post_view.dart';
import 'package:signup/forgetPassword.dart';
import 'package:signup/home.dart';
import 'package:signup/main_screen.dart';
import 'package:signup/myProfile.dart';
<<<<<<< HEAD
import 'package:signup/postAdd.dart';
import 'package:signup/random.dart';
import 'package:signup/screens/postscreen1.dart';
import 'package:signup/screens/postscreen2.dart';
import 'package:signup/states/currentUser.dart';
import 'package:signup/userProfile.dart';
import 'package:signup/viewPostAdds.dart';
=======
import 'package:signup/random.dart';
import 'package:signup/states/currentUser.dart';
import 'package:signup/userProfile.dart';
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
import './login.dart';
import './signup.dart';
import 'package:provider/provider.dart';


void main() => runApp(HomePage());
//home: ChangeNotifierProvider(
//create: (context) => DisplayReview(),
//child: LoginPage()),


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(isAdmin: false,),
        routes: {
          '/main': (context) => HomePage(),
          '/home': (context) => RoleCheck(),
          ActivityFeed.routeName: (context) => ActivityFeed(),
          //'/myProfileFinal': (context) => MyProfileFinal(),
          MyProfileFinal.routeName: (ctx) => MyProfileFinal(),
         // Random.routeName: (ctx) => Random(),
          '/UserProfile': (context) => UserProfile(),
          '/mainScreen': (context) => MainScreen(),
          '/mainScreenUser': (context) => MainScreenUsers(),
          '/LoginScreen': (context) => LoginPage(),
          '/MyProfile': (context) => MyProfile(),
          //'/CurrentUser': (context) => CurrentUser(),
          '/Signup': (context) => SignUpPage(),
<<<<<<< HEAD

          '/ViewAdds': (context) => ViewAdds(),

            '/PostDetail': (context) =>PostDetail(),
          '/postscreen1': (context) => PostFirstScreen(),
          '/choseOnMap':(context) => ChoseOnMap(),
          '/AgentSignup': (context) => AgentSignUp(),
          '/ForgetPassword': (context) => ForgetPassword(),
          '/ImageCarousel': (context) => ImageCarousel(),

=======
          '/AgentSignup': (context) => AgentSignUp(),
          '/ForgetPassword': (context) => ForgetPassword(),
>>>>>>> ae8cc1e0c7adad47f23f1cda33f2ae3b5c1c3d9b
        },
      ),
    );
  }
}
//  return MaterialApp(
//    routes: {
//      '/main': (context) => HomePage(),
//      '/mainScreen': (context) => MainScreen(),
//      '/LoginScreen': (context) => LoginPage(),
//      '/Signup': (context) => SignUpPage(),
//      '/ForgetPassword': (context) => ForgetPassword(),
//    },
//    home: ChangeNotifierProvider(
//        create: (context) => CurrentUser(),
//        child: LoginPage())
//  );
//  );

//class HomeController extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final AuthService auth = Provider.of(context).auth;
//    return StreamBuilder<String>(
//      stream: auth.onAuthStateChanged,
//      builder: (context, AsyncSnapshot<String> snapshot) {
//        if (snapshot.connectionState == ConnectionState.active) {
//          final bool signedIn = snapshot.hasData;
//          return signedIn ? HomePage() : LoginPage();
//        }
//        return CircularProgressIndicator();
//      },
//    );
//  }
//}
