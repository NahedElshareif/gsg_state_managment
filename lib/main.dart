import 'package:flutter/material.dart';
import 'package:gsg_state_management/providers/app_provider.dart';
import 'package:gsg_state_management/providers/auth_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return AmeerProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (context) {
            return AuthProvider();
          },
        )
      ],
      child: MaterialApp(
        home: Screen1(),
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('State Managment'),
      ),
      body: Container(
          child: Column(
        children: [
          Selector2<AmeerProvider, AuthProvider, String>(
            selector: (_, p1, p2) {
              return p1.name + p2.userName;
            },
            builder: (context, value, child) {
              return Text(value);
            },
          ),
          RaisedButton(onPressed: () {
            context.read<AmeerProvider>().changeData('saeed', 'jabalia');
          })
        ],
      )

          // Consumer2<AmeerProvider, AuthProvider>(
          //   builder: (context, value, value2, child) {
          //     return Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       crossAxisAlignment: CrossAxisAlignment.stretch,
          //       children: [
          //         Text(
          //           value2.userName,
          //           textAlign: TextAlign.center,
          //         ),
          //         Text(
          //           value.name,
          //           textAlign: TextAlign.center,
          //         ),
          //         Text(
          //           value.address,
          //           textAlign: TextAlign.center,
          //         ),
          //         RaisedButton(onPressed: () {
          //           value.changeData('saeed', 'jabalia');
          //           value2.setUserName('saeed');
          //         })
          //       ],
          //     );
          //   },
          // )
          ),
      // body: Consumer<AmeerProvider>(
      //   builder: (context, value, child) {
      //     return Container(
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.stretch,
      //         children: [
      //           Text(
      //             value.name,
      //             textAlign: TextAlign.center,
      //           ),
      //           Text(
      //             value.address,
      //             textAlign: TextAlign.center,
      //           ),
      //           RaisedButton(onPressed: () {
      //             value.changeData('saeed', 'jabalia');
      //           })
      //         ],
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Selector<AmeerProvider, String>(
        builder: (context, value, child) {
          return Center(child: Text(value));
        },
        selector: (c, v) {
          return v.name;
        },
      ),
    );
  }
}
