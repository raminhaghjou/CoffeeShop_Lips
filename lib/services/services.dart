import 'dart:io';

import 'package:bcoffee/constants/constants.dart';
import 'package:bcoffee/extensions/extensions.dart';
import 'package:bcoffee/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart' as apple;

part 'auth_services.dart';
part 'authenticate.dart';
part 'helper.dart';
part 'order_services.dart';
part 'products_services.dart';
part 'user_services.dart';
