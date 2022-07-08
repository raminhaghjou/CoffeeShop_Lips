// List of libraries that used by this application pages
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffeelips/bloc/blocs.dart';
import 'package:coffeelips/models/models.dart';
import 'package:coffeelips/services/services.dart';
import 'package:coffeelips/shared/shared.dart';
import 'package:coffeelips/ui/widgets/widgets.dart';
import 'package:email_validator/email_validator.dart';
// List of packages that used by this application pages
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:supercharged/supercharged.dart';
import 'package:url_launcher/url_launcher.dart';

part 'account_confirmation_page.dart';
part 'coffee_detail_page.dart';
part 'coffee_page.dart';
part 'edit_profile_page.dart';
// List of pages in this application
part 'general_page.dart';
part 'inprogress_page.dart';
part 'main_page.dart';
part 'newtaste_page.dart';
part 'order_history_page.dart';
part 'paid_page.dart';
part 'popular_page.dart';
part 'profile_page.dart';
part 'recommended_page.dart';
part 'sign_in_page.dart';
part 'sign_up_page.dart';
part 'wrapper.dart';

String prettyPrint(Map json) {
  JsonEncoder encoder = new JsonEncoder.withIndent('  ');
  String pretty = encoder.convert(json);
  return pretty;
}
