import 'package:clone_messenger/contants/global.dart';
import 'package:clone_messenger/features/pages/callLogs/widgets/ListCardCall.dart';
import 'package:flutter/material.dart';

class CallLogs extends StatelessWidget {
  const CallLogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 15.0, 0.0),
            height: 60,
            // color: Colors.white30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbpbjUU1mnP1ymtnMIgzXk0Q2ESozCUX1q2Q&usqp=CAU',
                  ),
                ),
                Text(
                  'Cuộc gọi',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Wrap(
                  spacing: 15.0,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black12,
                        ),
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.all(0),
                        width: 30,
                        height: 30,
                        child: const Center(
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.call),
                            iconSize: 18,
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                          ),
                        )),
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.black12,
                        ),
                        width: 30,
                        height: 30,
                        child: const Center(
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(Icons.video_call_sharp),
                            iconSize: 18,
                            padding: EdgeInsets.all(0),
                            color: Colors.black,
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: dataTest
                  .map((e) => ListCardCall(
                        image: e['image'],
                        title: e['title'],
                        subtitle: e['subtitle'],
                        timeDate: e['timeDate'],
                        // icon1: null,
                        iconSub: e['iconSub'],
                        icon2: e['icon2'],
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
