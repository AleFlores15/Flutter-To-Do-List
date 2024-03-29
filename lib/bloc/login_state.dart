import 'package:equatable/equatable.dart';

enum LoginStatus{init ,loading, success, failure}

class LoginState extends Equatable{

  LoginStatus? status;

  LoginState({ this.status=LoginStatus.init});

  LoginState copyWith({LoginStatus? status}){
    return LoginState(

      status: status ?? this.status
    );
  }

  @override
  List<Object?> get props => [ status];
}
