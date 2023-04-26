import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_do_list/bloc/login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  //final LoginRepository _loginRepository;
  LoginCubit() : super(LoginState());
  Future<void> login(String email, String password) async{
    emit(state.copyWith(status: LoginStatus.loading));
    try{
      //final user = await _loginRepository.login(email, password); 
      emit(state.copyWith(status: LoginStatus.success));
    } on Exception catch(e){
      emit(state.copyWith(status: LoginStatus.failure));
    }
  }


}