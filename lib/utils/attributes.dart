
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../modals/quote_database.dart';


final scaffoldKey = GlobalKey<ScaffoldState>();
final data = GetStorage();

Future<List<QuotesDatabaseModel>>? getAllQuotes;