/*
 *
 *    *****   ******
 *    *   *       *
 *    *   *      *
 *    *   *     *  
 *    *****    *****
 *
 * Wrote By Osman Suliman in 2021 
 */
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../base/client.dart';

class UserServices {
  Future getProfile() async {
    try {
      var response = await client.get(
        ('profile/603df338c55e604e6ef5f91b'),
      );

      return response.data;
    } on DioError catch (error) {
      Fluttertoast.showToast(
          msg: error.error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      switch (error.type) {
        case DioErrorType.CONNECT_TIMEOUT:
        case DioErrorType.SEND_TIMEOUT:
        case DioErrorType.CANCEL:
          return throw error;
          break;
        default:
          return throw error;
      }
    } catch (error) {
      Fluttertoast.showToast(
          msg: error,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.redAccent,
          textColor: Colors.white,
          fontSize: 16.0);
      return throw error;
    }
  }
}
