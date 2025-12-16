import 'package:floating/floating.dart';
import 'package:flutter/material.dart';


class PipExample extends StatefulWidget {
  const PipExample({super.key});

  @override
  State<PipExample> createState() => _PipExampleState();
}

class _PipExampleState extends State<PipExample> with WidgetsBindingObserver{
  late Floating floating;
  bool isPipAvailable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    floating = Floating();
    requestPipAvailable();
    WidgetsBinding.instance.addObserver(this);
  }

  void requestPipAvailable()async{
    isPipAvailable = await floating.isPipAvailable;
    setState(() {

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    floating.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState lifecycleState) {
    if (lifecycleState == AppLifecycleState.inactive) {
      floating.enable(aspectRatio: const Rational.square());
    }
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
        childWhenEnabled: Scaffold(
          appBar: AppBar(title: const Text("Pip Mode"),),
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: double.infinity,),
              Text("Pip is Activated")
            ],
          ),
        ),
        childWhenDisabled: WillPopScope(
          onWillPop: () async {
            if(isPipAvailable){
              floating.enable(aspectRatio: Rational.square());
            }
            return false;
          },
          child: Scaffold(
            appBar: AppBar(title: const Text("Flutter Pip View"),),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: double.infinity,),
                Text("Pip is ${isPipAvailable ? '' : 'not '}Available"),
              ],
            ),
          ),
        ));
  }
}
