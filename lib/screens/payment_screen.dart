import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_choise_app/bloc/payment_bloc/payment_bloc.dart';
import 'package:multi_choise_app/bloc/payment_bloc/payment_event.dart';
import 'package:multi_choise_app/bloc/payment_bloc/payment_state.dart';
import 'package:multi_choise_app/models/payment_date_set.dart';
import 'package:multi_choise_app/resources/size.dart';
import 'package:multi_choise_app/widgets/date_dialog.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  DateTime selectedDate = DateTime.now();
  DateTime selectedMonth = DateTime.now();
  DateTime selectedDay = DateTime.now();
  String today = "يوم";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<PaymentBLoc>(
        create: (_) => PaymentBLoc()..add(FetchPayment()),
        child: Scaffold(
            appBar: buildAppBar(context),
            body: Container(
              decoration: BoxDecoration(color: Color(0xffF2F5FC)),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildtotaleExpenseRow(),
                            ),
                            width: ScreenUtil().setWidth(250),
                            height: ScreenUtil().setHeight(50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffFFD100)),
                          ),
                          InkWell(
                            onTap: () {
                              buildShowDialog(context);
                            },
                            child: buildFilter(),
                          )
                        ],
                      ),
                    ),
                    buildCardLlistView(),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          insetAnimationDuration: const Duration(milliseconds: 100),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            // use container to change width and height
            height: ScreenUtil().setHeight(300),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildFromDate(),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: buildFirstPickersRow(context),
                ),
                buildToDateText(),
                Padding(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                  child: buildSecondPickerRow(context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Color(0xffF2F5FC),
      title: Text(
        'مدفوعات هلا',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget buildCardLlistView() {
    return BlocBuilder<PaymentBLoc, PaymentState>(builder: (context, state) {
      if (state is PaymentLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is PaymentSuccess) {
        return Container(
          child: ListView(
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              children: state.user.result!.dateSet!
                  .map((e) => buildDetailsMaterial(e))
                  .toList()),
        );
      }
      return Container();
    });
  }

  Widget buildDetailsMaterial(PaymentDAteSet? state) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
      child: Column(
        children: [
          Material(
            elevation: 3,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                ScreenUtil().setWidth(15),
              ),
              topLeft: Radius.circular(
                ScreenUtil().setWidth(15),
              ),
            ),
            child: Container(
              height: ScreenUtil().setHeight(96),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(10))),
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
                child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            buildFullNameText(state),
                            Text(state!.mobileNumber)
                          ],
                        ),
                        buildAmountColumn(state),
                      ],
                    )),
              ),
            ),
          ),
          buildTransiationMaterial(state)
        ],
      ),
    );
  }

  Material buildTransiationMaterial(PaymentDAteSet state) {
    return Material(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(
          ScreenUtil().setWidth(15),
        ),
        bottomRight: Radius.circular(
          ScreenUtil().setWidth(15),
        ),
      ),
      elevation: 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              ScreenUtil().setWidth(15),
            ),
            bottomRight: Radius.circular(
              ScreenUtil().setWidth(15),
            ),
          ),
          color: Color(0xffF9FBFD),
        ),
        child: Column(
          children: [
            detailsRow('رقم التحويل:', state.trxRef),
            detailsRow('تاريخ التحويل:', state.trxDate.substring(0, 15)),
            detailsRow('اسم المنشأه:', state.corporateFullNameAr ?? 'mvc'),
          ],
        ),
      ),
    );
  }

  Column buildAmountColumn(PaymentDAteSet state) {
    return Column(
      children: [
        Text(state!.amount.toString(),
            style: TextStyle(
                color: Color(0xffF57D64), fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.only(
              right: ScreenUtil().setHeight(12),
              top: ScreenUtil().setHeight(12)),
          child: Text("ريال سعودى"),
        ),
      ],
    );
  }

  Text buildFullNameText(PaymentDAteSet? state) {
    return Text(
      state!.fullNameAR,
      style: TextStyle(
          color: Color(0xffC3A8D9), fontWeight: FontWeight.bold, fontSize: 20),
    );
  }

  // Widget buildCardLlistView() {
  //   return ListView(
  //     shrinkWrap: true,
  //     children: [
  //       Material(
  //         elevation: 1,
  //         borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
  //         child: ListView(
  //           shrinkWrap: true,
  //           children: [Container(
  //             height: ScreenUtil().setHeight(110),
  //             decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
  //             child: Padding(
  //               padding: EdgeInsets.all(ScreenUtil().setWidth(16)),
  //               child: InkWell(
  //                 onTap: () {},
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Column(
  //                       children: [
  //                         Text(
  //                           "محمد احمد",
  //                           style: TextStyle(
  //                               color: Color(0xffC3A8D9),
  //                               fontWeight: FontWeight.bold,
  //                               fontSize: 20),
  //                         ),
  //                         Text('01068765559')
  //                       ],
  //                     ),
  //                     Column(
  //                       children: [
  //                         Text("2500",
  //                             style: TextStyle(
  //                                 color: Color(0xffF57D64),
  //                                 fontWeight: FontWeight.bold)),
  //                         Padding(
  //                           padding: EdgeInsets.only(
  //                               right: ScreenUtil().setHeight(12),
  //                               top: ScreenUtil().setHeight(12)),
  //                           child: Text("ريال سعودى"),
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //
  //           ),
  //             Container(color: Colors.blueAccent,
  //             child: Column(
  //               children: [
  //                 detailsRow('رقم التحويل:','123456788'),
  //                 detailsRow('رقم التحويل:','123456788'),
  //                 detailsRow('رقم التحويل:','123456788'),
  //               ],
  //             ),
  //             )
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget buildFilter() {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
      child: Container(
        child: Icon(Icons.filter_alt),
        width: ScreenUtil().setWidth(80),
        height: ScreenUtil().setWidth(50),
        decoration: BoxDecoration(
            color: Color(0xffFFFFFF), borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget detailsRow(String name, String type) {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(10), right: ScreenUtil().setHeight(16)),
      child: Row(
        children: [
          Text(name),
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setHeight(8)),
            child: Text(type),
          ),
        ],
      ),
    );
  }

  Row buildSecondPickerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              print('nhn');
              _selectDate(context, selectedDate);
            },
            child: buildPickerContainer(selectedDate.day, today),
          ),
        ),
        GestureDetector(
            onTap: () => _selectDate(context, selectedMonth),
            child: buildPickerContainer(selectedMonth.month, 'شهر')),
        GestureDetector(
            onTap: () => _selectDate(context, selectedDay),
            child: buildPickerContainer(selectedDay.year, 'سنه')),
      ],
    );
  }

  Padding buildToDateText() {
    return Padding(
      padding: EdgeInsets.only(
        right: ScreenUtil().setHeight(20),
      ),
      child: Text('الى تاريخ'),
    );
  }

  Row buildFirstPickersRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: InkWell(
            onTap: () {
              _selectDate(context, selectedDate);
            },
            child: buildPickerContainer(selectedDate.day, 'يوم'),
          ),
        ),
        GestureDetector(
            onTap: () => _selectDate(context, selectedMonth),
            child: buildPickerContainer(selectedMonth.month, 'شهر')),
        GestureDetector(
            onTap: () => _selectDate(context, selectedDay),
            child: buildPickerContainer(selectedDay.year, 'سنه')),
      ],
    );
  }

  Padding buildFromDate() {
    return Padding(
      padding: EdgeInsets.only(
          right: ScreenUtil().setHeight(20), top: ScreenUtil().setHeight(12)),
      child: Text('من تاريخ'),
    );
  }

  Row buildtotaleExpenseRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            "اجمالى المدفوعات",
            style: TextStyle(
                color: Color(0xff23A066), fontWeight: FontWeight.bold),
          ),
        ),
        Text("350.00 ريال سعودى",
            style: TextStyle(
                color: Color(0xff23A066), fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget buildPickerContainer(int dateTime, String type) {
    return Padding(
      padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.black),
          color: Colors.white,
        ),
        width: 80,
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Center(
              child: Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setHeight(8)),
            child: Text(type),
          )),
          Center(child: Icon(Icons.arrow_drop_down)),
        ]),
      ),
    );
  }

  // Create week date picker with passed parameters
  Future<void> _selectDate(BuildContext context, DateTime dateTime) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        today = picked.day.toString();
      });
  }
}
