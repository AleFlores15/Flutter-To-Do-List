import 'package:equatable/equatable.dart';

enum LoginStatus{loading, success, failure}

class LoginState extends Equatable{
  final String? email;
  final String? password;
  final LoginStatus? status;

  const LoginState({this.email, this.password, this.status});

  LoginState copyWith({String? email, String? password, LoginStatus? status}){
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [email, password, status];
}
