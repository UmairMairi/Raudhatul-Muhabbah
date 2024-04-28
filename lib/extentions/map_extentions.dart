import 'package:flutter/foundation.dart';

extension MapExtention on Map? {
  dynamic getValueOfKey(String keyToFind) {
    if(this != null){
      var keys = this!.keys;
      for (var key in keys) {
        var value = this![key];

        if (key == keyToFind) {
          if(value is List){
            for (var element in value) {
              if (element is Map) {
                var nestedValue = element.getValueOfKey(keyToFind);
                if (nestedValue != null) {
                  return nestedValue; // Return the value and exit the function
                }
              } else if (element is String) {
                return element;
              }
            }
          }
          return value; // Return the value when the key is found
        }
        if (kDebugMode) {
          print("type ---------------->${value.runtimeType}");
        }
        if(value is Map){
          var nestedValue = value.getValueOfKey(keyToFind); // Recursively search in nested objects
          if (nestedValue != null) {
            return nestedValue; // Propagate the value upwards
          }
        }
        else if(value is List){
          for (var element in value) {
            if (element is Map) {
              var nestedValue = element.getValueOfKey(keyToFind);
              if (nestedValue != null) {
                return nestedValue; // Return the value and exit the function
              }
            } else if (element is String) {
              return element;
            }
          }
        }
        // else if(value is Function && key == keyToFind){
        //   return value;
        // }
        else{
          // return null;
        }
      }
    }
    return null; // Key not found in this level or any nested levels
  }
}
