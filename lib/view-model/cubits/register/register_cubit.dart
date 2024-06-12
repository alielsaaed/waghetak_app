import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:waghetak_app/constants/linkapi.dart';
import 'package:waghetak_app/model/auth/register_model.dart';
import 'package:waghetak_app/view-model/services/crud.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Crud _crud = Crud();

  Future<void> signup(RegisterModel registerModel, BuildContext context) async {
    emit(RegisterLoading());
    try {
      var respone = await _crud.postRequest(
        linkSignup,
        {
          "email": registerModel.email,
          "password": registerModel.password,
        },
      );
      if (respone.containsKey("token")) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterFailed(errMessage: respone.entries.toString()));
      }
      print(respone);
    } catch (e) {
      if (kDebugMode) {
        print("Resgister: $e");
      }
      emit(RegisterFailed(errMessage: e.toString()));
      throw Exception("error in registertion ops: $e");
    }
  }
}
