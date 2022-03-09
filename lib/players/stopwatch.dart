import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class StopWatchTimerPage extends StatefulWidget {
  final Function NotifyParent;
  final bool isPlaying;
  StopWatchTimerPage(this.NotifyParent, this.isPlaying);

  @override
  _StopWatchTimerPageState createState() => _StopWatchTimerPageState();
}

class _StopWatchTimerPageState extends State<StopWatchTimerPage> {
  bool isTimerRunning = false;
  Duration countDownDuration = Duration();
  Duration duration = Duration();
  Duration selectedDuration = Duration();
  Timer? timer;
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void initState() {
    super.initState();
    resetTimer();
  }

  void resetTimer() {
    if (isTimerRunning) {
      setState(() {
        duration = countDownDuration;
      });
    } else {
      setState(() {
        countDownDuration = duration;
      });
    }
  }

  void startTimer() {
    if (duration.inSeconds <= 0) return;
    isTimerRunning = true;
    resetTimer();
    timer = Timer.periodic(Duration(seconds: 1), (_) => timerHandle());
  }

  void timerHandle() {
    final addSeconds = isTimerRunning ? -1 : 1;
    setState(() {
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        cancelTimer();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void cancelTimer() {
    widget.NotifyParent("STOP");
    stopTimer();
  }

  void stopTimer() {
    isTimerRunning = false;
    resetTimer();
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isTimerRunning ? buildTime() : Container(),
        buildButtons(),
      ],
    );
  }

  Widget buildTime() {
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      buildTimeCard(time: hours, header: 'Hours'),
      SizedBox(width: 8),
      buildTimeCard(time: minutes, header: 'Minutes'),
      SizedBox(width: 8),
      buildTimeCard(time: seconds, header: 'Seconds'),
    ]);
  }

  Widget buildTimeCard({required String time, required String header}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Text(
            time,
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ),
        ),
        SizedBox(height: 3),
        Text(header, style: TextStyle(color: Colors.black45)),
      ],
    );
  }

  Widget buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.all(20),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          onPressed: () {
            widget.NotifyParent("TOGGLEPLAY");
          },
          child: Icon(widget.isPlaying
              ? Icons.pause_rounded
              : Icons.play_arrow_rounded),
        ),
        SizedBox(width: 5),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            padding: EdgeInsets.all(20),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(50.0),
            ),
          ),
          onPressed: () {
            isTimerRunning ? stopTimer() : getTime();
          },
          child: Icon(
            isTimerRunning ? Icons.timer_off_rounded : Icons.timer_rounded,
          ),
        ),
      ],
    );
  }

  getTime() {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoButton(
                    child: Text('Start Timer'),
                    onPressed: () {
                      duration = selectedDuration;
                      resetTimer();
                      startTimer();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              Expanded(
                child: CupertinoTimerPicker(
                  minuteInterval: 1,
                  secondInterval: 1,
                  initialTimerDuration: duration,
                  mode: CupertinoTimerPickerMode.hms,
                  onTimerDurationChanged: (Duration _duration) {
                    selectedDuration = _duration;
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
