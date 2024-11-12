abstract class UserEvent {}

class FetchUserEvent extends UserEvent {
  final String userId;

  FetchUserEvent({required this.userId});
}
