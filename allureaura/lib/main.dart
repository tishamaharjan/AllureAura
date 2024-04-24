import 'package:allureaura/home.dart';
import 'package:allureaura/login.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:khalti/khalti.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  //Initializing shared preferences and checking if there is any data or token in it
  WidgetsFlutterBinding.ensureInitialized();

  Khalti.init(
    publicKey: 'test_public_key_cf3797bf05ce4cd48e26ee75a62a1186',
  );

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    runApp(
      KhaltiScope(
        publicKey: 'test_public_key_cf3797bf05ce4cd48e26ee75a62a1186',
        builder: (context, navigatorKey) {
          return MyApp(
            token: token,
            navigatorKey: navigatorKey,
          );
        },
      ),
    );
  } catch (e) {
    print("Error initializing app: $e");
  }
}

class MyApp extends StatelessWidget {
  final String? token;
  final GlobalKey<NavigatorState> navigatorKey;

  const MyApp({
    this.token,
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ne', 'NP'),
      ],
      localizationsDelegates: [
        KhaltiLocalizations.delegate,
      ],
      home: (JwtDecoder.isExpired(token ?? ''))
          ? Login()
          : Home(
              token: token!,
              username: getUsernameFromToken(token!),
            ),
    );
  }

  // Extracting the username from the JWT token
  String getUsernameFromToken(String? token) {
    if (token == null || token.isEmpty) {
      return '';
    }
    // Decoding the JWT token and get the payload
    Map<String, dynamic> payload = JwtDecoder.decode(token);
    // Assuming that payload contains a 'username' field
    return payload['username'] ?? '';
  }
}
