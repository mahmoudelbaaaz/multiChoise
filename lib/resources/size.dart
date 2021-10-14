import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeightBox extends StatelessWidget {
  double height;

  HeightBox(this.height);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(height),

    );
  }
}

class WidthBox extends StatelessWidget {
  double width;
late  Widget child;
  WidthBox(this.width,{child});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(width: ScreenUtil().setWidth(width),child:child
    );
  }
}
