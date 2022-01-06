import 'dart:core';

String dateConverterHelper( DateTime date ){ 

  String convertedDateTime = "${date.day.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.year.toString()}";
  return convertedDateTime;
}