import 'package:call_screen/controllers/call_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallScreen extends StatefulWidget {
  CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  final CallController controller = Get.put(CallController());
  double dragOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1a2332),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 90),
            Center(
              child: CircleAvatar(
                radius: 75,
                backgroundImage: AssetImage('assets/images/Mask group.png'),
              ),
            ),
            SizedBox(height: 20),
            Obx(
              () => Text(
                "${controller.callerName.value} is Calling You...",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ringing',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            // """""""""""""""""""Caller Accept""""""""""""""""""
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 50, left: 35, right: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.acceptCall();
                      print('Accept Call');
                    },
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.call, color: Colors.white, size: 35),
                    ),
                  ),
                  // """""""""""""""""""Caller Reject""""""""""""""""""
                  Transform.translate(
                    offset: Offset(0, dragOffset),
                    child: GestureDetector(
                      onVerticalDragUpdate: (details) {
                        setState(() {
                          dragOffset += details.delta.dy;

                          if (dragOffset < -150) {
                            controller.rejectCall();
                          }

                          if (dragOffset > 0) {
                            dragOffset = 0;
                          }
                        });
                      },

                      onVerticalDragEnd: (details) {
                        setState(() {
                          dragOffset = 0;
                        });
                      },
                      child: Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.call_end,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
