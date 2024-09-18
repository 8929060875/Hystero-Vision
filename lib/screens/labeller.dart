import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hystero/models/dataset.dart';
import 'package:hystero/screens/landing_pg.dart';
import 'package:hystero/services/sheet.dart';
import 'package:hystero/utils/button.dart';
import 'package:hystero/utils/menu_drawer.dart';
import 'package:hystero/utils/size_configs.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class Labeller extends StatefulWidget {
  Labeller({super.key, required this.snapshot});
  static const routeName = 'scoring';

  AsyncSnapshot snapshot;

  @override
  State<Labeller> createState() => _LabellerState();
}

launchurl(url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "could not launch the url";
  }
}

// class _PinchZoomImageState extends State<PinchZoomImage> {
//   final double minScale = 1;
//   final double maxScale = 4;
// }

class _LabellerState extends State<Labeller> {
  // String opt1 = '0';
  // String opt2 = '0';
  String opt3 = '0';
  String opt4 = '0';
  String opt5 = '0';
  String opt6 = '0';
  String opt7 = '0';
  String opt8 = '0';
  String opt9 = '0';
  String opt10 = '0';
  String opt11 = '0';
  String opt12 = '0';
  String opt13 = '0';
  String opt14 = '0';
  String opt15 = '0';
  String opt16 = '0';
  String opt17 = '0';
  String opt18 = '0';
  String opt19 = '0';
  String opt20 = '0';
  String opt21 = '0';
  String opt22 = '0';
  String opt23 = '0';
  String opt24 = '0';
  String opt25 = '0';
  static var index = 0;
  // bool sel1 = false;
  // bool sel2 = false;
  bool sel3 = false;
  bool sel4 = false;
  bool sel5 = false;
  bool sel6 = false;
  bool sel7 = false;
  bool sel8 = false;
  bool sel9 = false;
  bool sel10 = false;
  bool sel11 = false;
  bool sel12 = false;
  bool sel13 = false;
  bool sel14 = false;
  bool sel15 = false;
  bool sel16 = false;
  bool sel17 = false;
  bool sel18 = false;
  bool sel19 = false;
  bool sel20 = false;
  bool sel21 = false;
  bool sel22 = false;
  bool sel23 = false;
  bool sel24 = false;
  bool sel25 = false;
  TextEditingController comments = TextEditingController();
  // Timer? timer;
  // Duration duration = const Duration();
  ScrollController scrollController = ScrollController();
  bool backToTop = false;
  bool choices = false;

  @override
  void initState() {
    // startTimer();
    super.initState();

    scrollController.addListener(() {
      setState(() {
        backToTop =
            scrollController.offset == MediaQuery.of(context).size.height
                ? true
                : false;
      });
    });

    isIndex();
  }

  void isIndex() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    index = sp.getInt('index') ?? 0;
    setState(() {});
  }

  // void reset() {
  //   setState(() {
  //     duration = const Duration();
  //   });
  // }

  // void addTimer() {
  //   const addsec = 1;

  //   setState(() {
  //     final sec = duration.inSeconds + addsec;

  //     duration = Duration(seconds: sec);
  //   });
  // }

  // void startTimer() {
  //   timer = Timer.periodic(const Duration(seconds: 1), (_) => addTimer());
  // }

  // void stopTimer({bool resetTime = true}) {
  //   if (resetTime) {
  //     reset();
  //   }
  //   setState(() => timer?.cancel());
  // }

  // @override
  // void dispose() {
  //   timer?.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var len = widget.snapshot.data.length;
    var viewImage = widget.snapshot.data[index];

    String nameImage = viewImage.toString();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: buildTimer(viewImage),
        backgroundColor: const Color.fromRGBO(255, 141, 199, 1),
        leading: Builder(
          builder: (context) => GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: const Icon(
              Icons.menu,
            ),
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(6)),
                  child: IconButton(
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        DataSet.imagePath: viewImage,
                        // DataSet.option1: opt1,
                        // DataSet.option2: opt2,
                        DataSet.option3: opt3,
                        DataSet.option4: opt4,
                        DataSet.option5: opt5,
                        DataSet.option6: opt6,
                        DataSet.option7: opt7,
                        DataSet.option8: opt8,
                        DataSet.option9: opt9,
                        DataSet.option10: opt10,
                        DataSet.option11: opt11,
                        DataSet.option12: opt12,
                        DataSet.option13: opt13,
                        DataSet.option14: opt14,
                        DataSet.option15: opt15,
                        DataSet.option16: opt16,
                        DataSet.option17: opt17,
                        DataSet.option18: opt18,
                        DataSet.option19: opt19,
                        DataSet.option20: opt20,
                        DataSet.option21: opt21,
                        DataSet.option22: opt22,
                        DataSet.option23: opt23,
                        DataSet.option24: opt24,
                        DataSet.option25: opt25,
                        DataSet.comment: comments.text.trim(),
                        // DataSet.dateTime: DateTime.now().toString(),
                        DataSet.user:
                            FirebaseAuth.instance.currentUser!.email.toString(),
                      };
                      await DataSheetApi.insert([data]);

                      //popup for no choice selected
                      if (choices == false && comments.text == '') {
                        Fluttertoast.showToast(
                          msg: 'No choice selected and no comment added',
                          gravity: ToastGravity.BOTTOM,
                        );
                      }

                      //saving the progress
                      SharedPreferences sp =
                          await SharedPreferences.getInstance();

                      sp.setInt('index', index + 1);
                      print(sp.getInt('index'));

                      Navigator.of(context)
                          .pushReplacementNamed(LandingPage.routeName);
                    },
                    icon: const Icon(Icons.cancel),
                  ),
                ),
                //number of images done
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'Frame number : ${(index + 1).toString()}',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            // Center(
            //   child: InteractiveViewer(
            //       clipBehavior: Clip.none,
            //       panEnabled: false,
            //       child: Container(
            //         height: getProportionateScreenHeight(230),
            //         width: getProportionateScreenWidth(230),
            //         decoration: BoxDecoration(
            //           border: Border.all(color: Colors.black),
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         child: Center(
            //           child: Image.network(
            //               'http://20.197.24.178/api${viewImage.toString()}'),
            //         ),
            //       )
            //       ),
            // ),
            

            Center(
                child: InteractiveViewer(
                  child: Container(
                    height: getProportionateScreenHeight(230),
                    width: getProportionateScreenWidth(230),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.network(
                          'http://20.197.24.178/api${viewImage.toString()}'
                    ),
                  ),
                ),
              ),

            SizedBox(
              height: getProportionateScreenHeight(15),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Frame name : ${nameImage.split('/')[3]}',
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(15),
            ),

            // const Text('Q1. Please choose whether the image appears'),
            // SizedBox(
            //   height: getProportionateScreenHeight(20),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           sel1 = !sel1;
            //           sel2 = false;
            //           if (sel1) {
            //             opt1 = '1';
            //             opt2 = '0';
            //           } else {
            //             opt1 = '0';
            //             opt2 = '0';
            //           }
            //           choices = true;
            //         });
            //       },
            //       child: Container(
            //         height: getProportionateScreenHeight(60),
            //         width: getProportionateScreenWidth(110),
            //         decoration: BoxDecoration(
            //           color: sel1 ? Colors.blue : Colors.transparent,
            //           border: Border.all(color: Colors.black),
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         child: Center(
            //           child: Text(
            //             'Healthy',
            //             style: TextStyle(
            //               color: sel1 ? Colors.white : Colors.black,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         setState(() {
            //           sel1 = false;
            //           sel2 = !sel2;
            //           if (sel2) {
            //             opt1 = '0';
            //             opt2 = '1';
            //           } else {
            //             opt1 = '0';
            //             opt2 = '0';
            //           }
            //           choices = true;
            //         });
            //       },
            //       child: Container(
            //         height: getProportionateScreenHeight(60),
            //         width: getProportionateScreenWidth(110),
            //         decoration: BoxDecoration(
            //           color: sel2 ? Colors.blue : Colors.transparent,
            //           border: Border.all(color: Colors.black),
            //           borderRadius: BorderRadius.circular(5),
            //         ),
            //         child: Center(
            //           child: Text(
            //             'Has abnormality',
            //             textAlign: TextAlign.center,
            //             style: TextStyle(
            //               color: sel2 ? Colors.white : Colors.black,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: getProportionateScreenHeight(40),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
              ),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Q1. Identify the part of organ in this image from the following',
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel3 = !sel3;
                        if (sel3) {
                          opt3 = '1';
                        } else {
                          opt3 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel3
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel3
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        const Flexible(
                          child: Text(
                            'Vagina',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel4 = !sel4;
                        if (sel4) {
                          opt4 = '1';
                        } else {
                          opt4 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel4
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel4
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Cervical canal',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel5 = !sel5;
                        if (sel5) {
                          opt5 = '1';
                        } else {
                          opt5 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel5
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel5
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Endometrium cavity',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel6 = !sel6;
                        if (sel6) {
                          opt6 = '1';
                        } else {
                          opt6 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel6
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel6
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Ectocervix',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  const Text(
                    'Q2. Please assign an appropriate label to the image from the following:',
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel7 = !sel7;
                        if (sel7) {
                          opt7 = '1';
                        } else {
                          opt7 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel7
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel7
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          'Fibroid Base / Myometrium',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel8 = !sel8;
                        if (sel8) {
                          opt8 = '1';
                        } else {
                          opt8 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel8
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel8
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Submucus fibroid',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel9 = !sel9;
                        if (sel9) {
                          opt9 = '1';
                        } else {
                          opt9 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel9
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel9
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Ostium',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel10 = !sel10;
                        if (sel10) {
                          opt10 = '1';
                        } else {
                          opt10 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel10
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel10
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Septum',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel11 = !sel11;
                        if (sel8) {
                          opt11 = '1';
                        } else {
                          opt11 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel11
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel11
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Polyp ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel12 = !sel12;
                        if (sel12) {
                          opt12 = '1';
                        } else {
                          opt12 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel12
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel12
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Normal endometrium cavity',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel13 = !sel13;
                        if (sel13) {
                          opt13 = '1';
                        } else {
                          opt13 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel13
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel13
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Normal endocervical cavity ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel14 = !sel14;
                        if (sel14) {
                          opt14 = '1';
                        } else {
                          opt14 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel14
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel14
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Endocervical canal',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel15 = !sel15;
                        if (sel15) {
                          opt15 = '1';
                        } else {
                          opt15 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel15
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel15
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Thicken endometrium',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel16 = !sel16;
                        if (sel16) {
                          opt16 = '1';
                        } else {
                          opt16 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel16
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel16
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Fundus',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel17 = !sel17;
                        if (sel17) {
                          opt17 = '1';
                        } else {
                          opt17 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel17
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel17
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Normal Ectocervix',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel18 = !sel18;
                        if (sel18) {
                          opt18 = '1';
                        } else {
                          opt18 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel18
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel18
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Abnormal Ectocervix',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel19 = !sel19;
                        if (sel19) {
                          opt19 = '1';
                        } else {
                          opt19 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel19
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel19
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Air bubble',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel20 = !sel20;
                        if (sel20) {
                          opt20 = '1';
                        } else {
                          opt20 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel20
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel20
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Fluid with debris ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel21 = !sel21;
                        if (sel21) {
                          opt21 = '1';
                        } else {
                          opt21 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel21
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel21
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Sheath',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel22 = !sel22;
                        if (sel22) {
                          opt22 = '1';
                        } else {
                          opt22 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel22
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel22
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Loop ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel23 = !sel23;
                        if (sel23) {
                          opt23 = '1';
                        } else {
                          opt23 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel23
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel23
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Scissors ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel24 = !sel24;
                        if (sel24) {
                          opt24 = '1';
                        } else {
                          opt24 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel24
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel24
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' IUCD',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sel25 = !sel25;
                        if (sel25) {
                          opt25 = '1';
                        } else {
                          opt25 = '0';
                        }
                        choices = true;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          sel25
                              ? Icons.check_box
                              : Icons.check_box_outline_blank,
                          color: sel25
                              ? const Color.fromRGBO(255, 172, 199, 1)
                              : Colors.black,
                        ),
                        const Text(
                          ' Poor vision ',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Q3. Any comment related to the image',
                    ),
                  ),
                  TextField(
                    controller: comments,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusColor: Colors.black,
                      hintText: 'Add comments',
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                  Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //back button
                        ButtonWidget(
                          index: index,
                          iconData: Icons.arrow_back,
                          onClicked: () async {
                            int imgIndex = index;

                            //going back to top
                            scrollController.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.linear,
                            );

                            //initialising new values
                            setState(() {
                              if (index == 0) {
                                imgIndex = index = len - 1;
                              } else {
                                imgIndex = index--;
                              }
                              // opt1 = '0';
                              // opt2 = '0';
                              opt3 = '0';
                              opt4 = '0';
                              opt5 = '0';
                              opt6 = '0';
                              opt7 = '0';
                              opt8 = '0';
                              opt9 = '0';
                              opt10 = '0';
                              opt11 = '0';
                              opt12 = '0';
                              opt13 = '0';
                              opt14 = '0';
                              opt15 = '0';
                              opt16 = '0';
                              opt17 = '0';
                              opt18 = '0';
                              opt19 = '0';
                              opt20 = '0';
                              opt21 = '0';
                              opt22 = '0';
                              opt23 = '0';
                              opt24 = '0';
                              opt25 = '0';

                              // sel1 = false;
                              // sel2 = false;
                              sel3 = false;
                              sel4 = false;
                              sel5 = false;
                              sel6 = false;
                              sel7 = false;
                              sel8 = false;
                              sel9 = false;
                              sel10 = false;
                              sel11 = false;
                              sel12 = false;
                              sel13 = false;
                              sel14 = false;
                              sel15 = false;
                              sel16 = false;
                              sel17 = false;
                              sel18 = false;
                              sel19 = false;
                              sel20 = false;
                              sel21 = false;
                              sel22 = false;
                              sel23 = false;
                              sel24 = false;
                              sel25 = false;

                              comments.text = '';
                            });
                          },
                        ),

                        //The index moves forward and the response gets stored in the excel sheet
                        ButtonWidget(
                          iconData: Icons.arrow_forward,
                          onClicked: () async {
                            Map<String, dynamic> data = {
                              DataSet.imagePath: viewImage,
                              // DataSet.option1: opt1,
                              // DataSet.option2: opt2,
                              DataSet.option3: opt3,
                              DataSet.option4: opt4,
                              DataSet.option5: opt5,
                              DataSet.option6: opt6,
                              DataSet.option7: opt7,
                              DataSet.option8: opt8,
                              DataSet.option9: opt9,
                              DataSet.option10: opt10,
                              DataSet.option11: opt11,
                              DataSet.option12: opt12,
                              DataSet.option13: opt13,
                              DataSet.option14: opt14,
                              DataSet.option15: opt15,
                              DataSet.option16: opt16,
                              DataSet.option17: opt17,
                              DataSet.option18: opt18,
                              DataSet.option19: opt19,
                              DataSet.option20: opt20,
                              DataSet.option21: opt21,
                              DataSet.option22: opt22,
                              DataSet.option23: opt23,
                              DataSet.option24: opt24,
                              DataSet.option25: opt25,
                              DataSet.comment: comments.text.trim(),
                              // DataSet.dateTime: DateTime.now().toString(),
                              DataSet.user: FirebaseAuth
                                  .instance.currentUser!.email
                                  .toString(),
                            };
                            await DataSheetApi.insert([data]);

                            //going back to top
                            scrollController.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.linear,
                            );

                            //popup for no choice selected
                            if (choices == false && comments.text == '') {
                              Fluttertoast.showToast(
                                msg: 'No choice selected and no comment added',
                                gravity: ToastGravity.BOTTOM,
                              );
                            }

                            //saving the progress
                            SharedPreferences sp =
                                await SharedPreferences.getInstance();

                            sp.setInt('index', index + 1);
                            print(sp.getInt('index'));

                            //initialising new values
                            setState(
                              () {
                                if (index == len - 1) {
                                  index = 0;
                                } else {
                                  index++;
                                }
                                // opt1 = '0';
                                // opt2 = '0';
                                opt3 = '0';
                                opt4 = '0';
                                opt5 = '0';
                                opt6 = '0';
                                opt7 = '0';
                                opt8 = '0';
                                opt9 = '0';
                                opt10 = '0';
                                opt11 = '0';
                                opt12 = '0';
                                opt13 = '0';
                                opt14 = '0';
                                opt15 = '0';
                                opt16 = '0';
                                opt17 = '0';
                                opt18 = '0';
                                opt19 = '0';
                                opt20 = '0';
                                opt21 = '0';
                                opt22 = '0';
                                opt23 = '0';
                                opt24 = '0';
                                opt25 = '0';

                                // sel1 = false;
                                // sel2 = false;
                                sel3 = false;
                                sel4 = false;
                                sel5 = false;
                                sel6 = false;
                                sel7 = false;
                                sel8 = false;
                                sel9 = false;
                                sel10 = false;
                                sel11 = false;
                                sel12 = false;
                                sel13 = false;
                                sel14 = false;
                                sel15 = false;
                                sel16 = false;
                                sel17 = false;
                                sel18 = false;
                                sel19 = false;
                                sel20 = false;
                                sel21 = false;
                                sel22 = false;
                                sel23 = false;
                                sel24 = false;
                                sel25 = false;

                                comments.text = '';
                              },
                            );
                          },
                          index: index,
                        ),
                      ],
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

  Widget buildTimer(var viewImage) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    // final min = twoDigits(duration.inMinutes.remainder(60));
    // final seconds = twoDigits(duration.inSeconds.remainder(60));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(3),
        ),
        // Text('$min:$seconds'),
        IconButton(
          onPressed: () async {
            var url = Uri.parse(
                "https://docs.google.com/spreadsheets/d/1w_bjuU4HK7qv0cZ71FRTsYz2Kkkzpm126qLX3OVsrpo/edit?usp=sharing");
            try {
              await launchUrl(url);
            } catch (e) {
              throw e.toString();
            }
          },
          icon: const Icon(Icons.help),
        ),
      ],
    );
  }
}
