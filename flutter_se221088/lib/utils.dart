import 'package:flutter/material.dart';

// UTILS: Helper functions to validate forms
class MyUtils {
  // Checks if a field is completely empty
  static String? checkEmpty(String? text) {
    if (text == null || text.isEmpty) {
      return 'Dude, you cannot leave this empty'; 
    }
    return null; // Null means no error!
  }

  // Checks if password is at least 6 characters
  static String? checkPassword(String? text) {
    if (text == null || text.isEmpty) {
      return 'Enter a password';
    }
    if (text.length < 6) {
      return 'Password needs to be 6 characters minimum';
    }
    return null;
  }
}