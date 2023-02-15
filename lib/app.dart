import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:drag_and_drop_lists/drag_and_drop_item.dart';
import 'package:drag_and_drop_lists/drag_and_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:nostr_client/nostr_client.dart'
    show Event, KeyPair, RandomKeyPairGenerator;
import 'input.dart';
import 'line.dart';
import 'models/app.dart';
import 'relay.dart';
import 'widgets/clock.dart';

class Oo8App extends StatefulWidget {
  Oo8Fractal app;

  Oo8App(this.app, {super.key});

  @override
  State<Oo8App> createState() => _Oo8AppState();
}

class _Oo8AppState extends State<Oo8App> {
  Oo8Fractal get app => widget.app;

  final list = <TextEditingController>[];

  final ctrl = TextEditingController();

  List<Event> get events => app.events;

  @override
  void initState() {
    super.initState();

    _listener = app.listen((event) {
      setState(() {});
    });
  }

  StreamSubscription<List<Event>>? _listener;
  var search = '';

  final focus = FocusNode();

  late final _ctrlPrvKey =
      TextEditingController(text: app.user.keyPair.privateKey);

  late final _ctrlPubKey =
      TextEditingController(text: app.user.keyPair.publicKey);

  // gravity is our present moment, everything else is electromagnetic potential synchronizing into

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 8,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                ClockField(),
                Expanded(
                  child: Container(
                    padding: padding,
                    alignment: Alignment.centerLeft,
                    child: Row(children: [
                      Expanded(
                        child: Input8(
                          ctrl,
                          onSubmit: (value) {
                            /*
                      if (value.startsWith('.') && search != value) {
                        filter(
                          value.substring(1),
                        );
                      } else if (search.isNotEmpty) {
                        filter();
                      }
                      */

                            if (!value.startsWith('.')) {
                              ctrl.clear();
                              app.post(value);
                            }
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            ...events.map(
              (event) => Container(
                padding: padding,
                child: Row(children: [
                  Container(
                    padding: EdgeInsets.only(
                      bottom: 1,
                      right: 5,
                    ),
                    alignment: Alignment.centerRight,
                    child: Text(
                      (event.createdAt.millisecondsSinceEpoch ~/ 1000)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 175, 175, 175),
                      ),
                    ),
                  ),
                  FLine(
                    event.content,
                    onSelect: (opt) {
                      app.post(opt);
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

/*
  ListView.builder(
  itemBuilder: (context, index) => buildRow(index),
  itemCount: trackList.length,
),
*/

/*
  Widget buildRow(int index) {
    final track = trackList[index];
    ListTile tile = ListTile(
      title: Text('${track.getName()}'),
    );
    Draggable draggable = LongPressDraggable<Track>(
      data: track,
      axis: Axis.vertical,
      maxSimultaneousDrags: 1,
      child: tile,
      childWhenDragging: Opacity(
        opacity: 0.5,
        child: tile,
      ),
      feedback: Material(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
          child: tile,
        ),
        elevation: 4.0,
      ),
    );

    return DragTarget<Track>(
      onWillAccept: (track) {
        return trackList.indexOf(track) != index;
      },
      onAccept: (track) {
        setState(() {
          int currentIndex = trackList.indexOf(track);
          trackList.remove(track);
          trackList.insert(currentIndex > index ? index : index - 1, track);
        });
      },
      builder: (BuildContext context, List<Track> candidateData,
          List<dynamic> rejectedData) {
        return Column(
          children: <Widget>[
            AnimatedSize(
              duration: Duration(milliseconds: 100),
              vsync: this,
              child: candidateData.isEmpty
                  ? Container()
                  : Opacity(
                      opacity: 0.0,
                      child: tile,
                    ),
            ),
            Card(
              child: candidateData.isEmpty ? draggable : tile,
            )
          ],
        );
      },
    );
  }
  */
}
