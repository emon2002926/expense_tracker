part of 'user_bloc.dart';

@immutable
sealed class UserEvent {

}

class GetUser extends UserEvent {
  final String? email;
  GetUser( this.email);
}