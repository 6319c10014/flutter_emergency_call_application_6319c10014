import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import '../validations/validation.dart';
import '../db/contact_custom_db.dart';
import '../models/contact_custom.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home2_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home3_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home4_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home5_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home6_ui.dart';
import 'package:flutter_emergency_call_application_6319c10014/views/home_ui.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactsUI extends StatefulWidget {
  static const routeName = '/Contact';

  const ContactsUI({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ContactsUIState();
  }
}

class _ContactsUIState extends State<ContactsUI> {
  late ContactsDatabase _db; // อ้างอิงฐานข้อมูล
  late Future<List<Contact>> Contacts; // ลิสรายการหนังสือ
  int i = 0; // จำลองตัวเลขการเพิ่่มจำนวน
  late DateFormat dateFormat; // รูปแบบการจัดการวันที่และเวลา

  // สร้างฟอร์ม key หรือ id ของฟอร์มสำหรับอ้างอิง
  final _formKey = GlobalKey<FormState>();

// กำหนดตัวแปรรับค่าและจัดการข้อมูล ผ่าน controller
  final _contactID = TextEditingController();
  final _name = TextEditingController();
  final _mobile = TextEditingController();

// กำหนดตัวแปรรับค่าและจัดการข้อมูล ไม่ผ่าน controller
  bool _inStock = false;

  @override
  void initState() {
    // กำหนดรูปแบบการจัดการวันที่และเวลา มีเพิ่มเติมเล็กน้อยในในท้ายบทความ
    Intl.defaultLocale = 'th';
    initializeDateFormatting();
    dateFormat = DateFormat.yMMMMEEEEd('th');

    // อ้างอิงฐานข้อมูล
    _db = ContactsDatabase.instance;
    Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    super.initState();
  }

  // คำสั่งลบรายการทั้งหมด
  Future<void> clearContact() async {
    await _db.deleteAll(); // ทำคำสั่งลบข้อมูลทั้งหมด
    setState(() {
      Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    });
  }

  // คำสั่งลบเฉพาะรายการที่กำหนดด้วย id ที่ต้องการ
  Future<void> deleteContact(int id) async {
    await _db.delete(id); // ทำคำสั่งลบข้มูลตามเงื่อนไข id
    setState(() {
      Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    });
  }

  // จำลองทำคำสั่งแก้ไขรายการ
  Future<void> editContact(Contact contact) async {
    await _db.update(contact); // ทำคำสั่งอัพเดทข้อมูล
    setState(() {
      Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    });
    // // เลื่อกเปลี่ยนเฉพาะส่วนที่ต้องการ โดยใช้คำสั่ง copy
    // contact = contact.copy(
    //   name: contact.name,
    //   mobile: contact.mobile,
    //   // title: Contact.title+' new ',
    //   // price: 30.00,
    //   // in_stock: true,
    //   // num_pages: 300,
    //   // publication_date: DateTime.now()
    // );
    // await _db.update(contact); // ทำคำสั่งอัพเดทข้อมูล
    // setState(() {
    //   Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    // });
  }

  // จำลองทำคำสั่งเพิ่มข้อมูลใหม่
  Future<void> newContact(Contact contact) async {
    Contact new_contact = await _db.create(contact); // ทำคำสั่งเพิ่มข้อมูลใหม่
    setState(() {
      Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    });
    // i++;
    // Contact contact = Contact(
    //   id: i,
    //   name: 'สมชาย',
    //   mobile: '0845123457',
    //   // Contact_id: i,
    //   // title: 'Contact title $i',
    //   // price: 20.00,
    //   // in_stock: true,
    //   // num_pages: 200,
    //   // publication_date: DateTime.now()
    // );
    // Contact new_Contact = await _db.create(contact); // ทำคำสั่งเพิ่มข้อมูลใหม่
    // setState(() {
    //   Contacts = _db.readAllContact(); // แสดงรายการหนังสือ
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        title: Text(
          'กำหนดเอง',
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
                    style: TextStyle(color: Colors.grey),
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
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (
                //       context,
                //     ) =>
                //         ContactsUI(),
                //   ),
                // );
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
          child: FutureBuilder<List<Contact>>(
            // ชนิดของข้อมูล
            future: Contacts, // ข้อมูล Future
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      // ส่วนของลิสรายการ
                      child: snapshot.data!.isNotEmpty // กำหนดเงื่อนไขตรงนี้
                          ? ListView.separated(
                              // กรณีมีรายการ แสดงปกติหนด controller ที่จะใช้งานร่วม
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Contact contact = snapshot.data![index];

                                Widget card; // สร้างเป็นตัวแปร
                                card = Card(
                                    margin: const EdgeInsets.all(
                                        5.0), // การเยื้องขอบ
                                    child: Column(
                                      children: [
                                        ListTile(
                                          leading: IconButton(
                                            onPressed: () {
                                              _makePhoneCall(
                                                contact.mobile,
                                              );
                                            },
                                            // จำลองแก้ไขข้อมูล
                                            icon: const Icon(Icons.phone),
                                          ),
                                          title: Text(contact.name),
                                          subtitle: Text(contact.mobile),
                                          trailing: IconButton(
                                            onPressed: () => deleteContact(
                                                contact.id!), // ลบข้อมูล
                                            icon: const Icon(Icons.delete),
                                          ),
                                          onTap: () {
                                            _viewDetail(contact
                                                .id!); // กดเลือกรายการให้แสดงรายละเอียด
                                          },
                                        ),
                                      ],
                                    ));
                                return card;
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(),
                            )
                          : const Center(
                              child: Text('No items')), // กรณีไม่มีรายการ
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                // กรณี error
                return Text('${snapshot.error}');
              }
              // กรณีสถานะเป็น waiting ยังไม่มีข้อมูล แสดงตัว loading
              return const RefreshProgressIndicator();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addContactForm(),
        child: const Icon(Icons.add),
        backgroundColor: Colors.black,
      ),
    );
  }

  // สร้างฟังก์ชั่นจำลองการแสดงรายละเอียดข้อมูล
  Future<Widget?> _viewDetail(int id) async {
    Future<Contact> contact =
        _db.readContact(id); // ดึงข้อมูลจากฐานข้อมูลมาแสดง
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return FutureBuilder<Contact>(
              future: contact,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var Contact = snapshot.data!;
                  return Container(
                    height: 200,
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${Contact.id}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('ชื่อ: ${Contact.name}'),
                        SizedBox(
                          height: 5,
                        ),
                        Text('เบอร์โทร: ${Contact.mobile}'),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  // กรณี error
                  return Text('${snapshot.error}');
                }
                return const RefreshProgressIndicator();
              });
        });
  }

  // ฟังก์ชั่นแสดง bottom sheet มีฟอร้ฒเพิ่มข้อมูล
  Future<Widget?> _addContactForm() async {
    bool? initial; // ตัวแปรสำหรับเงื่อนไขเมือฟังก์ชั่นถูกเรียกแต่ละครั้ง
    showModalBottomSheet(
        isScrollControlled: true, // ต้องกำหนดให้รองรับการเลื่อนได้
        context: context,
        builder: (BuildContext context) {
          if (initial == null) {
            //เมื่อโหลดครั้งแรกยังเป็น null
            initial = true; // เปลี่ยนป็น true
            // ล้างค่า controller และ ค่า state ถ้ามี
            // ทำแค่ครั้งเดียวเมื่อฟอร์มโหลดครั้งแรก แต่ถ้ามีการ rebuild จะไม่ทำงานแล้ว
            // เพราะค่า initial ไม่ใช่ null แล้ว
            _contactID.clear();
            _name.clear();
            _mobile.clear();
            // _bookID.clear();
            // _title.clear();
            // _price.clear();
            // _numPages.clear();
            // _publicDate.clear();
            _inStock = false;
          }
          // เราใช้ StatefulBuilder เป็นตัวแรกเลย เพราะจะให้สามารถใช้งาน setState ในนี้ได้
          return StatefulBuilder(builder: (context, setState) {
            // สังเกตว่ามีกำหนด setState เข้ามาใช้งาน
            return SingleChildScrollView(
              // เราใช้ตัวนี้เพื่อป้องกันการขยายของพื้นที่ข้อมูล รองรับการเลื่อนได้
              child: Form(
                // ใช้งาน Form
                key: _formKey, // กำหนด key
                child: Padding(
                  // เราใช้ padding เพื่อเมื่อแป้นพิมพ์แสดง ให้ดันส่วนของฟอร์มขึ้นไปอยู่ด้านบนแป้น
                  padding: MediaQuery.of(context)
                      .viewInsets, // ดันตามแป้นที่แทรกเข้ามา แป้นจะไม่บังฟอร์ม
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: <Widget>[
                        // กำหนด widget ที่จะใช้งานกับฟอร์ม

                        TextFormField(
                          controller: _name,
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            hintText: 'ชื่อ',
                            icon: Icon(Icons.contact_page),
                          ),
                          //validator: Validators.required('โปรดระบุชื่อ'),
                        ),
                        TextFormField(
                          controller: _mobile,
                          autovalidateMode: AutovalidateMode.always,
                          decoration: InputDecoration(
                            hintText: 'เบอร์โทร',
                            icon: Icon(Icons.mobile_friendly),
                          ),
                          keyboardType: TextInputType.number,
                          //validator: Validators.required('โปรดระบุชื่อ'),
                        ),
                        // TextFormField(
                        //   controller: _mobile,
                        //   autovalidateMode: AutovalidateMode.always,
                        //   decoration: InputDecoration(
                        //     hintText: 'เบอร์ติดต่อ',
                        //     icon: Icon(Icons.mobile_friendly),
                        //   ),
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.allow(
                        //         RegExp(r'[0-9\.]')),
                        //   ],
                        //   //validator: Validators.required('โปรดระบุราคา'),
                        // ),
                        // TextFormField(
                        //   controller: _numPages,
                        //   autovalidateMode: AutovalidateMode.always,
                        //   decoration: InputDecoration(
                        //     hintText: 'จำนวนหน้า',
                        //     icon: Icon(Icons.dynamic_feed_outlined),
                        //   ),
                        //   keyboardType: TextInputType.number,
                        //   inputFormatters: <TextInputFormatter>[
                        //     FilteringTextInputFormatter.digitsOnly
                        //   ],
                        //   validator: Validators.required('โปรดระบุจำนวนหน้า'),
                        // ),
                        // CheckboxListTile(
                        //   value: _inStock,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       _inStock = value!;
                        //     });
                        //   },
                        //   title: new Text(
                        //     'มีสินค้า',
                        //   ),
                        //   controlAffinity: ListTileControlAffinity.leading,
                        // ),
                        // TextFormField(
                        //   controller:
                        //       _publicDate, // ผูกกับ TextFormField ที่จะใช้
                        //   autovalidateMode: AutovalidateMode.always,
                        //   decoration: InputDecoration(
                        //     hintText: 'วันที่เผยแพร่',
                        //     icon: Icon(Icons.date_range_outlined),
                        //   ),
                        //   validator:
                        //       Validators.required('โปรดระบุวันที่เผยแพร่'),
                        //   onTap: _selectDate,
                        //   readOnly: true,
                        // ),
                        SizedBox(
                          height: 5.0,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // อ้างอิงฟอร์มที่กำลังใช้งาน ตรวจสอบความถูกต้องข้อมูลในฟอร์ม
                            if (_formKey.currentState!.validate()) {
                              //หากผ่าน
                              // เมื่อฟอรฺ์มผ่าน เราสร้างข้อมูล book สำหรับส่งเข้าไปบันทึก
                              // ค่าแต่ละค่าดึงจาก controller และ state โดยแปลงเป็น
                              // รูปแบบข้อมูลที่ถูกต้อง
                              Contact contact = Contact(
                                //id: int.parse(_contactID.text),
                                name: _name.text,
                                mobile: _mobile.text,
                                // price: double.parse(_price.text),
                                // in_stock: _inStock,
                                // num_pages: int.parse(_numPages.text),
                                // publication_date:
                                //     DateTime.parse(_publicDate.text),
                              );
                              // ทำการ reset ข้อมูล จะได้เฉพาะ textinput บางกรณีค่าก็ไม่ถูกล้าง
                              _formKey.currentState!.reset();
                              // เพิ่มการล้างค่าเฉพาะรายการ
                              _contactID.clear();
                              _name.clear();
                              _mobile.clear();
                              // _numPages.clear();
                              // _publicDate.clear();
                              setState(() {
                                // ล้างค่าข้อมูล state
                                _inStock = false;
                              });
                              Navigator.pop(context); // ปิดฟอร์มไป
                              await newContact(
                                  contact); // เพิ่มข้อมูลไปในฐานข้อมูล
                              // แสดงข้อความจำลอง ใน snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                // นำค่าข้อมูลไปแสดงหรือใช้งานผ่าน controller
                                SnackBar(
                                    content: Text('บันทึกข้อมูลเรียบร้อย')),
                              );
                            }
                          },
                          child: Container(
                            // เราใช้ container ขายปุ่มให้เต็มพื้นที่
                            alignment: Alignment.center, // จัดข้อความตรงกลาง
                            width: double.infinity, // กำหนดความกว้างให้เต็ม
                            child: const Text('เพิ่มรายชื่อ'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }

  // ฟังก์ชั่นแสดง bottom sheet มีฟอร้มแก้ไขข้อมูล
  Future<Widget?> _editContactForm(int id) async {
    bool? initial; // ตัวแปรสำหรับเงื่อนไขเมือฟังก์ชั่นถูกเรียกแต่ละครั้ง
    Future<Contact> contact =
        _db.readContact(id); // ดึงข้อมูลจากฐานข้อมูลมาแสดง
    showModalBottomSheet(
        isScrollControlled: true, // ต้องกำหนดให้รองรับการเลื่อนได้
        context: context,
        builder: (BuildContext context) {
          // เนื่องจากต้องใช้ข้อมูล Future ที่ไปดึงมาจากฐานข้อมูล
          return FutureBuilder<Contact>(
              // เราต้องใช้ FutureBuilder เป็นตัวแรก
              future: contact,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // เมื่อได้ข้อมูลมา
                  var contact = snapshot.data!;
                  if (initial == null) {
                    //เมื่อโหลดครั้งแรกยังเป็น null
                    initial = true; // เปลี่ยนป็น true
                    // กำหนดค่าให้กับข้อมูล controller และ state
                    // ทำแค่ครั้งเดียวเมื่อฟอร์มโหลดครั้งแรก แต่ถ้ามีการ rebuild จะไม่ทำงานแล้ว
                    // เพราะค่า initial ไม่ใช่ null แล้ว
                    _contactID.value = TextEditingValue(
                      text: contact.id.toString(),
                    );
                    _name.value = TextEditingValue(
                      text: contact.name..toString(),
                    );
                    _mobile.value = TextEditingValue(
                      text: contact.mobile.toString(),
                    );
                    // _numPages.value = TextEditingValue(
                    //   text: book.num_pages.toString(),
                    // );
                    // _inStock = book.in_stock ? true : false;
                    // _publicDate.value = TextEditingValue(
                    //   text: DateFormat('yyyy-MM-dd').format(book.publication_date).toString()
                    // );
                  }
                  // เราใช้ StatefulBuilder ให้สามารถใช้งาน setState ในนี้ได้
                  return StatefulBuilder(builder: (context, setState) {
                    // มีกำหนด setState เข้ามาใช้งาน
                    return SingleChildScrollView(
                      // เราใช้ตัวนี้เพื่อป้องกันการขยายของพื้นที่ข้อมูล
                      child: Form(
                        // ใช้งาน Form
                        key: _formKey, // กำหนด key
                        child: Padding(
                          // เราใช้ padding เพื่อเมื่อแป้นพิมพ์แสดง ให้ดันส่วนของฟอร์มขึ้นไปอยู่ด้านบนแป้น
                          padding: MediaQuery.of(context)
                              .viewInsets, // ดันตามแป้นที่แทรกเข้ามา แป้นจะไม่บังฟอร์ม
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              // กำหนด widget ที่จะใช้งานกับฟอร์ม
                              children: <Widget>[
                                // แทบไม่ต้องแก้ไขใดๆ ใช้รูปแบบเดียวกับการเพิ่มข้อมูล
                                TextFormField(
                                  controller: _contactID,
                                  autovalidateMode: AutovalidateMode.always,
                                  decoration: InputDecoration(
                                    hintText: 'รหัส',
                                    icon: Icon(Icons.emoji_flags_outlined),
                                  ),
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: <TextInputFormatter>[
                                  //     FilteringTextInputFormatter.digitsOnly
                                  // ],
                                  // validator: Validators.required('โปรดระบุรหัสหนังสือ'),
                                ),
                                TextFormField(
                                  controller: _name,
                                  autovalidateMode: AutovalidateMode.always,
                                  decoration: InputDecoration(
                                    hintText: 'ชื่อผู้ติดต่่อ',
                                    icon: Icon(Icons.contact_mail),
                                  ),
                                  //validator: Validators.required('โปรดระบุชื่อหนังสือ'),
                                ),
                                TextFormField(
                                  controller: _mobile,
                                  autovalidateMode: AutovalidateMode.always,
                                  decoration: InputDecoration(
                                    hintText: 'เบอร์โทร',
                                    icon: Icon(Icons.credit_card_outlined),
                                  ),
                                  keyboardType: TextInputType.number,
                                  // inputFormatters: <TextInputFormatter>[
                                  //     FilteringTextInputFormatter.allow(RegExp(r'[0-9\.]')),
                                  // ],
                                  // validator: Validators.required('โปรดระบุราคา'),
                                ),
                                // TextFormField(
                                //   controller: _numPages,
                                //   autovalidateMode: AutovalidateMode.always,
                                //   decoration: InputDecoration(
                                //     hintText: 'จำนวนหน้า',
                                //     icon: Icon(Icons.dynamic_feed_outlined),
                                //   ),
                                //   keyboardType: TextInputType.number,
                                //   inputFormatters: <TextInputFormatter>[
                                //       FilteringTextInputFormatter.digitsOnly
                                //   ],
                                //   validator: Validators.required('โปรดระบุจำนวนหน้า'),
                                // ),
                                // CheckboxListTile(
                                //   value: _inStock,
                                //   onChanged: (value) {
                                //     setState(() {
                                //       _inStock = value!;
                                //     });
                                //   },
                                //   title: new Text('มีสินค้า',
                                //   ),
                                //   controlAffinity: ListTileControlAffinity.leading,
                                // ),
                                // TextFormField(
                                //   controller: _publicDate, // ผูกกับ TextFormField ที่จะใช้
                                //   autovalidateMode: AutovalidateMode.always,
                                //   decoration: InputDecoration(
                                //     hintText: 'วันที่เผยแพร่',
                                //     icon: Icon(Icons.date_range_outlined),
                                //   ),
                                //   validator: Validators.required('โปรดระบุวันที่เผยแพร่'),
                                //   onTap: _selectDate,
                                //   readOnly: true,
                                // ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                ButtonTheme(
                                  minWidth: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      // อ้างอิงฟอร์มที่กำลังใช้งาน ตรวจสอบความถูกต้องข้อมูลในฟอร์ม
                                      if (_formKey.currentState!.validate()) {
                                        //หากผ่าน
                                        // เมื่อฟอร์มผาน เราทำการ copy ข้อมูลที่ดึงจากฐานข้อมูล
                                        // แล้วแก้ไขเฉพาะที่ต้องการ ในที่นี้เราไม่ได้แก้ไข id หลัก
                                        // จากนั้นกำหนดค่าในตัวแปรใหม่ชื่อ edit_book
                                        Contact edit_contact = contact.copy(
                                          //id: int.parse(_contactID.text),
                                          name: _name.text,
                                          mobile: _mobile.text,
                                          // in_stock: _inStock,
                                          // num_pages: int.parse(_numPages.text),
                                          // publication_date: DateTime.parse(_publicDate.text),
                                        );
                                        // ทำการ reset ข้อมูล จะได้เฉพาะ textinput บางกรณีค่าก็ไม่ถูกล้าง
                                        _formKey.currentState!.reset();
                                        // เพิ่มการล้างค่าเฉพาะรายการ
                                        _contactID.clear();
                                        _name.clear();
                                        _mobile.clear();
                                        // _numPages.clear();
                                        // _publicDate.clear();
                                        setState(() {
                                          // ล้างค่าข้อมูล state
                                          _inStock = false;
                                        });
                                        Navigator.pop(context); // ปิดฟอร์มไป
                                        await editContact(
                                            edit_contact); // อัพเดทข้อมูลลงไปในฐานข้อมูล
                                        // แสดงข้อความจำลอง ใน snackbar
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          // นำค่าข้อมูลไปแสดงหรือใช้งานผ่าน controller
                                          SnackBar(
                                              content: Text(
                                                  'บันทึกข้อมูลเรียบร้อย')),
                                        );
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child: const Text('แก้ไข'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
                } else if (snapshot.hasError) {
                  // กรณี error
                  return Text('${snapshot.error}');
                }
                return const RefreshProgressIndicator();
              });
        });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
