import 'package:flutter/material.dart';
import 'package:logintest/bloc/launch_bloc.dart';

class LaunchProvider with ChangeNotifier {
  LaunchBloc _bloc;

  LaunchProvider() {
    _bloc = LaunchBloc();
  }

  LaunchBloc get bloc => _bloc;
}
