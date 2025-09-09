import 'dart:developer';
import 'package:flutter/material.dart';
import 'sign_up_state.dart';
import 'package:flutter/foundation.dart';

class SignUpController extends ChangeNotifier {
  SignUpState _state = SignUpInitialState();
  SignUpState get state => _state;

  void _changeState(SignUpState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doSignUp() async {
    _changeState(SignUpLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      log("Conta criada com sucesso!");
      _changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      log("Erro ao criar conta: $e");
      _changeState(SignUpErrorState("Erro ao criar conta. Tente novamente."));
      return false;
    }
  }
}
