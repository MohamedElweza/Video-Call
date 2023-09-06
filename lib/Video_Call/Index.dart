import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'call.dart';


class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final _channelController = TextEditingController();
  bool _validatorError = false;
  ClientRole? _role = ClientRole.Broadcaster;


  @override
  void dispose() {
    _channelController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40,),
              Image.asset('assets/person.png'),
          const SizedBox(height: 20,),
              TextField(
                controller: _channelController,
                decoration: InputDecoration(
                  errorText: _validatorError? "Channel name is mandatory" : null,
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(width: 1)
                  )
                ),
              ),
             RadioListTile(
                 title: Text('Broadcaster'),
                 value: ClientRole.Broadcaster,
                 groupValue: _role,
                 onChanged: (ClientRole? value){
                   setState(() {
                     _role = value;
                   });
             }),
              RadioListTile(
                  title: Text('Audience'),
                  value: ClientRole.Audience,
                  groupValue: _role,
                  onChanged: (ClientRole? value){
                    setState(() {
                      _role = value;
                    });
                  }),
              ElevatedButton(
                onPressed: onJoin,
                  child: const Text('Join'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Future<void> onJoin() async{
    setState(() {
      _channelController.text.isEmpty? _validatorError = true : _validatorError = true;
    });
    if(_channelController.text.isNotEmpty) {
      await handleCameraAndMic(Permission.camera);
      await handleCameraAndMic(Permission.microphone);
    }
    await Navigator.push(context, MaterialPageRoute(builder: (context) => CallPage(
      channelName: _channelController.text,
      role: _role,
    )));
  }

  Future<void> handleCameraAndMic(Permission permission) async{
    final status = await permission.request();
    log(status.toString());
  }

}


