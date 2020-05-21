import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logintest/launch_provider.dart';
import 'package:logintest/model/launch.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LaunchProvider(),
      child: MaterialApp(
        title: 'Launch Rocket',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int nRocket = 0;

  Widget build(BuildContext context) {
    final bloc = Provider.of<LaunchProvider>(context).bloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SpaceX Launch Tracker',
          style: GoogleFonts.ubuntu(),
        ),
        centerTitle: true,
      ),
      body: (bloc != null)
          ? Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Lancio del prossimo razzo il:',
                          style: GoogleFonts.ubuntu(
                              fontSize: 14, color: Colors.yellow)),
                      StreamBuilder<Launch>(
                          stream: bloc.launch,
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) return Container();
                            return Column(
                              children: <Widget>[
                                Text('${snapshot.data.launchTime}',
                                    style: GoogleFonts.sourceCodePro(
                                        fontSize: 20)),
                                Text('${snapshot.data.rocket.rocketName}',
                                    style: GoogleFonts.ubuntu(fontSize: 20))
                              ],
                            );
                          }),
                    ],
                  )),
                  Flexible(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Image.asset('assets/rocket.png'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Razzo precedente'),
                          onPressed: () async {
                            if (nRocket > 0) {
                              nRocket--;
                              bloc.nLaunch(nRocket);
                            }
                          },
                        ),
                        RaisedButton(
                          child: Text('Prossimo razzo'),
                          onPressed: () async {
                            nRocket++;
                            bloc.nLaunch(nRocket);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
