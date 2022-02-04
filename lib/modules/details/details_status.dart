abstract class EventDetailsStatus {}

class EventDetailsStatusLoading extends EventDetailsStatus {}

class EventDetailsStatusEmpty extends EventDetailsStatus {}

class EventDetailsStatusSuccess extends EventDetailsStatus {}

class EventDetailsStatusFailure extends EventDetailsStatus {
  final String message;
  EventDetailsStatusFailure({required this.message});
}
