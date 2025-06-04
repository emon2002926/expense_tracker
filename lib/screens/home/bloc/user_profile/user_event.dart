part of 'user_bloc.dart';

@immutable
sealed class UserEvent {

}

class GetUser extends UserEvent {
  final String? uid;
  GetUser( this.uid);
}
class UpdateUser extends UserEvent {
  final UserProfile userProfile;
  UpdateUser(this.userProfile);
}