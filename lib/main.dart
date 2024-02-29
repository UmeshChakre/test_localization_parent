import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:local_package/local_package.dart' as localPack;
import 'package:local_package/local_package.dart';
import 'package:localization_test/l10n/generated/app_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:rpp/rpp.dart' as rpp;
// import 'package:rpp/rpp.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: RppSdkBuilder().getProviders(),
    //   child:
    return MaterialApp(
      title: 'Flutter Demo',
      supportedLocales: const [Locale('en'), Locale('zh')],
      localizationsDelegates: const [
        AppLocalizationsClass.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        localPack.AppLocalization.delegate,
        // rpp.S.delegate,
      ],
      locale: const Locale('zh'),
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "HELLO"),
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              AppLocalizationsClass.of(context).helloText,
            ),
            Text(
              AppLocalizationsClass.of(context).helloText2,
            ),
            Text(
              AppLocalizationsClass.of(context).pleaseConfirm,
            ),
            Text(
              AppLocalizationsClass.of(context).newTransfer,
            ),
            Text(
              AppLocalizationsClass.of(context).termsConditions,
            ),
            Text(
              AppLocalizationsClass.of(context).parentOnly,
            ),
            Text(
              AppLocalizationsClass.of(context).getImageFromGallery,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            FloatingActionButton(
              onPressed: () => localSDK(),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => hello(),
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // hello() {
  //   RPPLaunchScreen.pushNamed(context,
  //       rppRequiredData: RPPRequiredParams(
  //           bearerToken:
  //               "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTaWQiOiIxOGY0ZTlkZS1lMWJjLTRkNDctOTQ0My0wZTAwMjQ4NDdlMDQiLCJTdWIiOiJOQU5BS08gSEFTQUJBIiwiSnRpIjoiNDMzOEI0MzAtOUFDNy00NDkxLUJGNEMtRDRGQzcxRkJGMDFGIiwiVWRpIjoiNjAxMDE1MDEwODMiLCJMb2MiOiI1MDAwMDAwODI1NzgiLCJTZWMiOiJGYWxzZSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkN1c3RvbWVyIiwiZXhwIjoxNzA5MjYyMDY1LCJpc3MiOiJNTVBBdXRoU2VydmljZSIsImF1ZCI6Ik1vYmlsZUFwcCJ9.MFF7iSCl96VbaaHz2Ac1qeKGKtVaMWSD4gLBzVE36Dk",
  //           baseUrl: "https://mmstaging.mtradeasia.com/api/rpp/",
  //           enableChucker: true,
  //           startingScreen: ScreenToDisplay.qrScreen.getValue,
  //           phoneNumber: "60101501083",
  //           fullName: "John Doe",
  //           isForFlutter: true,
  //           nonDuitNowQRCallBack: (value) {
  //             debugPrint(value);
  //           },
  //           ipaddress: "1.1.1.1",
  //           loc: "123456789",
  //           secondaryIdNumber: "870921495909",
  //           secondaryIdType: 2,
  //           language: "en",
  //           buildVersion: "1.23.4",
  //           deviceModel: "Pixel 6",
  //           deviceName: "Pixel+6",
  //           locationPermission: "0",
  //           service: "",
  //           sourceSystem: "MMP",
  //           sourceSystemHeader: "MMP",
  //           refreshToken: "",
  //           deviceType: "IOS",
  //           isDuitNowQRPayEnabled: true,
  //           duitNowServiceEnabledStatus: true,
  //           termsAndConditionsUrl:
  //               "https://www.merchantrademoney.com/wp-content/uploads/MTA-DuitNow-Terms-Conditions.pdf",
  //           isDuitNowTransferEnabled: true,
  //           loggedInMobileNumber: "37614141414",
  //           primaryColor: Colors.blue,

  //           //After Prod
  //           appBarColor: Colors.blue,
  //           appBarTextColor: Colors.white,
  //           parentRoute: "/dummyHomePage",
  //           duitNowAppExitCallBack: (appExit) {
  //             debugPrint("APP EXITED");
  //             debugPrint("APP EXITED");
  //           },
  //           onTokenExpired: (expiryResponse) {
  //             debugPrint("TOKEN EXPURE AND ");
  //             return Future.value(
  //                 "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJTaWQiOiI4MTNkMWE0OS0yNDA1LTQ0NzYtODE0ZC00Y2I1M2ExZWJkNTEiLCJTdWIiOiJSSUtBIE9SSU1PVE8iLCJKdGkiOiI1NTk1ODFBMS00MzFELTREREEtQjM1My05QkNCQzczMDM3RDQiLCJVZGkiOiI2MDEwMTUwMTA4MiIsIkxvYyI6IjUwMDAwMDA4MjU2NyIsIlNlYyI6IkZhbHNlIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiQ3VzdG9tZXIiLCJleHAiOjE3MDY4NTM0NTMsImlzcyI6Ik1NUEF1dGhTZXJ2aWNlIiwiYXVkIjoiTW9iaWxlQXBwIn0.UhJ9jh6MWGNYk2tKm1I824mKyv7PVrQ8s18FK6PUz3w");
  //           },
  //           navigatorKey: navigatorKey));
  // }

  localSDK() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => const SDKPage(
                title: "NEW SDK",
              )),
    );
  }
}
