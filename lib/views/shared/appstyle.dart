import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// method to create text style as an variable
TextStyle appstyle(double size,Color color,FontWeight fw){
  return GoogleFonts.poppins(fontSize: size,color: color ,fontWeight: fw);
}

TextStyle appstyleHt(double size,Color color,FontWeight fw,double ht){
  return GoogleFonts.poppins(fontSize: size,color: color ,fontWeight: fw,height: ht);
}