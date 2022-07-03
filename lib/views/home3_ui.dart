import 'package:flutter/material.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/contact_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_emergency_call_application_6319c10014/models/phone_emer_list.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home2_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home3_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home4_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home5_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home6_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class Home3UI extends StatefulWidget {
  const Home3UI({Key? key}) : super(key: key);

  @override
  State<Home3UI> createState() => _Home3UIState();
}

class _Home3UIState extends State<Home3UI> {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  List<PhoneEmerList> phoneemerInfo = [
    PhoneEmerList(
      name: ' บริษัท ขนส่ง จำกัด หรือ บขส.',
      mobile: '1490',
      image: 'f1.jpg',
      detail: 'บริษัท ขนส่ง จำกัด หรือ บขส.',
    ),
    PhoneEmerList(
      name: 'การรถไฟแห่งประเทศไทย',
      mobile: '1690',
      image: 'f2.jpg',
      detail: 'การรถไฟแห่งประเทศไทย',
    ),
    PhoneEmerList(
      name: 'เหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว',
      mobile: '1155',
      image: 'f3.jpg',
      detail: ' ตำรวจท่องเที่ยว (สายด่วนเหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว)',
    ),
    PhoneEmerList(
      name: ' จส.100',
      mobile: '1137',
      image: 'f4.jpg',
      detail: ' จส.100',
    ),
    PhoneEmerList(
      name: 'กรมทางหลวงชนบท',
      mobile: '1146',
      image: 'f5.jpg',
      detail: 'กรมทางหลวงชนบท',
    ),
    PhoneEmerList(
      name: 'การทางพิเศษแห่งประเทศไทย',
      mobile: '1543',
      image: 'f6.jpg',
      detail: 'การทางพิเศษแห่งประเทศไทย',
    ),
    PhoneEmerList(
      name: ' วิทยุร่วมด้วยช่วยกัน',
      mobile: '1677',
      image: 'f7.jpg',
      detail: ' วิทยุร่วมด้วยช่วยกัน',
    ),
    PhoneEmerList(
      name: 'แจ้งเหตุด่วนบนท้องถนน',
      mobile: '1644',
      image: 'f8.jpg',
      detail: 'สวพ. FM91 รายงานสภาพการจราจร แจ้งเหตุด่วนบนท้องถนน',
    ),
    PhoneEmerList(
      name: ' ศูนย์ช่วยเหลือนักท่องเที่ยว (TAC)',
      mobile: '021344077',
      image: 'f9.jpg',
      detail: 'ศูนย์ช่วยเหลือนักท่องเที่ยว (TAC)',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'เหตุฉุกเฉินสำหรับการเดินทางท่องเที่ยว',
          style: TextStyle(
            color: Colors.black,
            //fontSize: 35.0,
          ),
        ),
        centerTitle: true,
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(206, 241, 104, 94),
            Color.fromARGB(230, 255, 243, 130),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: FaIcon(
              FontAwesomeIcons.tableList,
              color: Colors.black,
              size: 30.0,
            ),
            itemBuilder: (
              context,
            ) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    'แจ้งเหตุด่วน เหตุร้าย',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    'เหตุฉุกเฉินด้านการแพทย์',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    'เหตุฉุกเฉินสำหรับการเดินทางท่องเที่ยว',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    'เบอร์โทรหน่วยงานทั่วไป',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text(
                    'เบอร์โทรธนาคาร',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 5,
                  child: Text(
                    'เบอร์โทรเครือข่ายโทรศัพท์มือถือ',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 6,
                  child: Text(
                    'กำหนดเอง',
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        HomeUI(),
                  ),
                );
              } else if (value == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        Home2UI(),
                  ),
                );
              } else if (value == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        Home3UI(),
                  ),
                );
              } else if (value == 3) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        Home4UI(),
                  ),
                );
              } else if (value == 4) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        Home5UI(),
                  ),
                );
              } else if (value == 5) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        Home6UI(),
                  ),
                );
              } else if (value == 6) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      context,
                    ) =>
                        ContactsUI(),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
                0.6,
                0.9,
              ],
              colors: [
                Color.fromARGB(239, 252, 238, 109),
                Color.fromARGB(240, 245, 96, 86),
                Color.fromARGB(240, 103, 123, 235),
                Color.fromARGB(230, 16, 202, 184),
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: phoneemerInfo.length,
                  itemBuilder: (context, index) {
                    return Container(
                      //width: MediaQuery.of(context).size.width - 500.0,
                      child: Card(
                        child: ListTile(
                          onTap: () {
                            _makePhoneCall(
                              phoneemerInfo[index].mobile!,
                            );
                          },
                          leading: CircleAvatar(
                            backgroundColor: Colors.red[300],
                            child: Center(
                              child: Text(
                                phoneemerInfo[index].mobile!,
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            phoneemerInfo[index].name!,
                            style: TextStyle(
                              fontSize: 30.0,
                            ),
                          ),
                          trailing: Icon(
                            FontAwesomeIcons.phoneFlip,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
