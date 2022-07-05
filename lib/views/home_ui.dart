import 'package:flutter/material.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/contact_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_emergency_call_application_6319c10014/models/phone_emer_list.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home2_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home3_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home4_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home5_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home6_ui.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
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

  int NumofTitle = 0;

  var titleappbarinfo = [
    'แจ้งเหตุด่วน เหตุร้าย',
    'เหตุฉุกเฉินด้านการแพทย์',
    'เหตุฉุกเฉินสำหรับการเดินทางท่องเที่ยว',
    'เบอร์โทรหน่วยงานทั่วไป',
    'เบอร์โทรธนาคาร',
    'เบอร์โทรเครือข่ายโทรศัพท์มือถือ',
    'Contact',
  ];

  List<PhoneEmerList> phoneemerInfo = [
    PhoneEmerList(
      name: 'แจ้งเหตุเจ้าหน้าที่ตำรวจ',
      mobile: '191',
      image: 'f1.jpg',
      detail: 'ติดต่อแจ้งเหตุเจ้าหน้าที่ตำรวจ',
    ),
    PhoneEmerList(
      name: 'ภัยพิบัติแห่งชาติ',
      mobile: '192',
      image: 'f2.jpg',
      detail: 'ภัยพิบัติแห่งชาติ',
    ),
    PhoneEmerList(
      name: 'แจ้งอัคคีภัย/สัตว์ร้ายบุกรุกบ้าน',
      mobile: '199',
      image: 'f3.jpg',
      detail: 'ศูนย์วิทยุพระราม เพื่อแจ้งอัคคีภัย/สัตว์ร้ายบุกรุกบ้าน',
    ),
    PhoneEmerList(
      name: 'ปอเต๊กตึ๊ง กทม.',
      mobile: '1418',
      image: 'f4.jpg',
      detail: 'มูลนิธิปอเต๊กตึ๊ง กทม.',
    ),
    PhoneEmerList(
      name: 'สายด่วนเหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว',
      mobile: '1155',
      image: 'f5.jpg',
      detail: 'ตำรวจท่องเที่ยว (สายด่วนเหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว)',
    ),
    PhoneEmerList(
      name: 'ศูนย์ปราบขโมยรถ',
      mobile: '1192',
      image: 'f6.jpg',
      detail: 'ศูนย์ปราบขโมยรถ (สตช.)',
    ),
    PhoneEmerList(
      name: 'ตำรวจทางหลวง',
      mobile: '1193',
      image: 'f7.jpg',
      detail: 'ตำรวจทางหลวง',
    ),
    PhoneEmerList(
      name: 'แจ้งเหตุอาชญากรรม คดีร้ายแรงเป็นภัยต่อประเทศ',
      mobile: '1195',
      image: 'f8.jpg',
      detail: 'กองปราบ (สายด่วนแจ้งเหตุอาชญากรรม คดีร้ายแรงเป็นภัยต่อประเทศ)',
    ),
    PhoneEmerList(
      name: 'หน่วยประสานงานกลางเหตุฉุกเฉินในกรุงเทพฯ',
      mobile: '1555',
      image: 'f9.jpg',
      detail:
          'ศูนย์ร้องทุกข์กรุงเทพฯ (หน่วยประสานงานกลางเหตุฉุกเฉินในกรุงเทพฯ)',
    ),
    PhoneEmerList(
      name: 'แจ้งบุคคลสูญหาย',
      mobile: '1300',
      image: 'f10.jpg',
      detail: 'ศูนย์ประชาบดี เพื่อแจ้งบุคคลสูญหาย',
    ),
  ];

  List<PhoneEmerList2> phoneemer2Info = [
    PhoneEmerList2(
      name: 'สถาบันการแพทย์ฉุกเฉินแห่งชาติ',
      mobile: '1669',
      image: 'f1.jpg',
      detail:
          'สถาบันการแพทย์ฉุกเฉินแห่งชาติ สำหรับเหตุด่วนเหตุร้ายหรือผู้ได้รับบาดเจ็บ ',
    ),
    PhoneEmerList2(
      name: 'หน่วยแพทย์กู้ชีวิต วชิรพยาบาล',
      mobile: '1554',
      image: 'f2.jpg',
      detail: 'หน่วยแพทย์กู้ชีวิต วชิรพยาบาล',
    ),
    PhoneEmerList2(
      name: 'โรงพยาบาลตำรวจ',
      mobile: '1691',
      image: 'f3.jpg',
      detail: 'โรงพยาบาลตำรวจ',
    ),
    PhoneEmerList2(
      name: 'ศูนย์เอราวัณ สำนักการแพทย์',
      mobile: '1646',
      image: 'f4.jpg',
      detail: '',
    ),
    PhoneEmerList2(
      name: 'กรมป้องกันและบรรเทาสาธารณภัย',
      mobile: '1784',
      image: 'f5.jpg',
      detail: 'กรมป้องกันและบรรเทาสาธารณภัย',
    ),
  ];

  List<PhoneEmerList3> phoneemer3Info = [
    PhoneEmerList3(
      name: ' บริษัท ขนส่ง จำกัด หรือ บขส.',
      mobile: '1490',
      image: 'f1.jpg',
      detail: 'บริษัท ขนส่ง จำกัด หรือ บขส.',
    ),
    PhoneEmerList3(
      name: 'การรถไฟแห่งประเทศไทย',
      mobile: '1690',
      image: 'f2.jpg',
      detail: 'การรถไฟแห่งประเทศไทย',
    ),
    PhoneEmerList3(
      name: 'เหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว',
      mobile: '1155',
      image: 'f3.jpg',
      detail: ' ตำรวจท่องเที่ยว (สายด่วนเหตุร้ายที่เกี่ยวข้องกับนักท่องเที่ยว)',
    ),
    PhoneEmerList3(
      name: ' จส.100',
      mobile: '1137',
      image: 'f4.jpg',
      detail: ' จส.100',
    ),
    PhoneEmerList3(
      name: 'กรมทางหลวงชนบท',
      mobile: '1146',
      image: 'f5.jpg',
      detail: 'กรมทางหลวงชนบท',
    ),
    PhoneEmerList3(
      name: 'การทางพิเศษแห่งประเทศไทย',
      mobile: '1543',
      image: 'f6.jpg',
      detail: 'การทางพิเศษแห่งประเทศไทย',
    ),
    PhoneEmerList3(
      name: ' วิทยุร่วมด้วยช่วยกัน',
      mobile: '1677',
      image: 'f7.jpg',
      detail: ' วิทยุร่วมด้วยช่วยกัน',
    ),
    PhoneEmerList3(
      name: 'แจ้งเหตุด่วนบนท้องถนน',
      mobile: '1644',
      image: 'f8.jpg',
      detail: 'สวพ. FM91 รายงานสภาพการจราจร แจ้งเหตุด่วนบนท้องถนน',
    ),
    PhoneEmerList3(
      name: ' ศูนย์ช่วยเหลือนักท่องเที่ยว (TAC)',
      mobile: '021344077',
      image: 'f9.jpg',
      detail: 'ศูนย์ช่วยเหลือนักท่องเที่ยว (TAC)',
    ),
  ];

  List<PhoneEmerList4> phoneemer4Info = [
    PhoneEmerList4(
      name: 'สำนักงานประกันสังคม',
      mobile: '1506',
      image: 'f1.jpg',
      detail: 'สำนักงานประกันสังคม',
    ),
    PhoneEmerList4(
      name: ' สายด่วนประกันภัย',
      mobile: '1186',
      image: 'f2.jpg',
      detail: ' สายด่วนประกันภัย',
    ),
    PhoneEmerList4(
      name: ' การไฟฟ้าส่วนภูมิภาค',
      mobile: '1129',
      image: 'f3.jpg',
      detail: ' การไฟฟ้าส่วนภูมิภาค',
    ),
    PhoneEmerList4(
      name: ' การประปานครหลวง',
      mobile: '1125',
      image: 'f4.jpg',
      detail: ' การประปานครหลวง',
    ),
    PhoneEmerList4(
      name: ' การประปาส่วนภูมิภาค',
      mobile: '1662',
      image: 'f5.jpg',
      detail: ' การประปาส่วนภูมิภาค',
    ),
  ];

  List<PhoneEmerList5> phoneemer5Info = [
    PhoneEmerList5(
      name: ' ธนาคารออมสิน ',
      mobile: '1115',
      image: 'f1.jpg',
      detail: ' ธนาคารออมสิน ',
    ),
    PhoneEmerList5(
      name: ' ธนาคารกรุงศรีอยุธยา',
      mobile: '1572',
      image: 'f2.jpg',
      detail: ' ธนาคารกรุงศรีอยุธยา',
    ),
    PhoneEmerList5(
      name: ' ธนาคารทหารไทย (TMB)',
      mobile: '1558',
      image: 'f3.jpg',
      detail: ' ธนาคารทหารไทย (TMB)',
    ),
    PhoneEmerList5(
      name: ' ธนาคารกรุงเทพ ',
      mobile: '1333',
      image: 'f4.jpg',
      detail: ' ธนาคารกรุงเทพ ',
    ),
    PhoneEmerList5(
      name: ' ซิตี้แบงก์ (Citibank)',
      mobile: '1588',
      image: 'f5.jpg',
      detail: ' ซิตี้แบงก์ (Citibank)',
    ),
    PhoneEmerList5(
      name: ' ธนาคารธนชาต ',
      mobile: '1770',
      image: 'f6.jpg',
      detail: ' ธนาคารธนชาต ',
    ),
    PhoneEmerList5(
      name: 'ธนาคารอาคารสงเคราะห์ (ธอส.) ',
      mobile: '026459000',
      image: 'f7.jpg',
      detail: 'ธนาคารอาคารสงเคราะห์ (ธอส.) ',
    ),
    PhoneEmerList5(
      name: 'ธนาคารไทยพาณิชย์ (SCB)',
      mobile: '027777777',
      image: 'f8.jpg',
      detail: 'ธนาคารไทยพาณิชย์ (SCB)',
    ),
    PhoneEmerList5(
      name: 'ธนาคารยูโอบี (UOB)',
      mobile: '022851555',
      image: 'f9.jpg',
      detail: 'ธนาคารยูโอบี (UOB)',
    ),
    PhoneEmerList5(
      name: ' ธนาคารกสิกรไทย ',
      mobile: '028888888',
      image: 'f10.jpg',
      detail: ' ธนาคารกสิกรไทย ',
    ),
    PhoneEmerList5(
      name: ' ธนาคารกรุงไทย ',
      mobile: '021111111',
      image: 'f9.jpg',
      detail: ' ธนาคารกรุงไทย ',
    ),
    PhoneEmerList5(
      name: ' ธนาคารเกียรตินาคิน',
      mobile: '021655555',
      image: 'f9.jpg',
      detail: ' ธนาคารเกียรตินาคิน',
    ),
    PhoneEmerList5(
      name: ' ธนาคารทิสโก้',
      mobile: '026336000',
      image: 'f9.jpg',
      detail: ' ธนาคารทิสโก้',
    ),
    PhoneEmerList5(
      name: 'ธนาคารอิสลามแห่งประเทศไทย',
      mobile: '022042766',
      image: 'f9.jpg',
      detail: 'ธนาคารอิสลามแห่งประเทศไทย',
    ),
    PhoneEmerList5(
      name: 'ธนาคารซีไอเอ็มบี (CIMB)',
      mobile: '026267777',
      image: 'f9.jpg',
      detail: 'ธนาคารซีไอเอ็มบี (CIMB)',
    ),
  ];

  List<PhoneEmerList6> phoneemer6Info = [
    PhoneEmerList6(
      name: 'AIS',
      mobile: '1678',
      image: 'f1.jpg',
      detail: 'AIS',
    ),
    PhoneEmerList6(
      name: 'DTAC',
      mobile: '1678',
      image: 'f2.jpg',
      detail: 'DTAC',
    ),
    PhoneEmerList6(
      name: 'TRUEMOVE',
      mobile: '1242',
      image: 'f3.jpg',
      detail: 'TRUEMOVE',
    ),
    PhoneEmerList6(
      name: 'TOT',
      mobile: '1100',
      image: 'f4.jpg',
      detail: 'TOT',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          titleappbarinfo[NumofTitle],
          //'แจ้งเหตุด่วน เหตุร้าย',
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
            initialValue: titleappbarinfo.length,
            itemBuilder: (
              context,
            ) {
              return [
                PopupMenuItem<int>(
                  value: 0,
                  child: Text(
                    titleappbarinfo[0],
                    //'แจ้งเหตุด่วน เหตุร้าย',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 1,
                  child: Text(
                    titleappbarinfo[1],
                    //style: TextStyle(color: Colors.grey),

                    //'เหตุฉุกเฉินด้านการแพทย์',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 2,
                  child: Text(
                    titleappbarinfo[2],
                    //'เหตุฉุกเฉินสำหรับการเดินทางท่องเที่ยว',
                    //style: TextStyle(color: Colors.grey),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 3,
                  child: Text(
                    titleappbarinfo[3],
                    //'เบอร์โทรหน่วยงานทั่วไป',
                    //style: TextStyle(color: Colors.grey),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 4,
                  child: Text(
                    titleappbarinfo[4],
                    //style: TextStyle(color: Colors.grey),
                    //'เบอร์โทรธนาคาร',
                  ),
                ),
                PopupMenuItem<int>(
                  value: 5,
                  child: Text(
                    titleappbarinfo[5],
                    //'เบอร์โทรเครือข่ายโทรศัพท์มือถือ',
                    //style: TextStyle(color: Colors.grey),
                  ),
                ),
                PopupMenuItem<int>(
                  value: 6,
                  child: Text(
                    titleappbarinfo[6],
                    //style: TextStyle(color: Colors.grey),
                    //'กำหนดเอง',
                  ),
                ),
              ];
            },
            onSelected: (value) {
              if (value == 0) {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (
                //       context,
                //     ) =>
                //         HomeUI(),
                //   ),
                // );
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
