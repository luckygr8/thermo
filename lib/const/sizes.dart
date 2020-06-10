import 'dart:ui';

class DeviceSize{
  static double ppi;
  static Size size;

  static void setDimens(double p , Size s){
    ppi = p;
    size = s;
  }
}