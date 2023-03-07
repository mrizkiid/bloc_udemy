import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import './app.dart';
import './general_observer.dart';

void main() {
  Bloc.observer = MyObserver();
  runApp(App());
}
