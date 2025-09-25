import 'package:add_2_calendar/add_2_calendar.dart';
// this file should act as a service to add the pick up date to users calendar but for now added  the event directl to the ui widget
 Event event = Event(
      title: 'Event title',
      description: 'Event description',
      location: 'Event location',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(const Duration(minutes: 30)),
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
        url: 'http://example.com',
      ),
      androidParams: const AndroidParams(
        emailInvites: ['test@example.com'],
      ),
    );



class AddEventsToCalendar {
  String eventTitle;
  String eventDescription;
  String eventLocation;
  DateTime startDate;
  DateTime endDate;

  AddEventsToCalendar({
    required this.eventTitle,
    required this.eventDescription,
    required this.eventLocation,
    required this.startDate,
    required this.endDate,
  });

  Event call() {
    return Event(
      title: eventTitle,
      description: eventDescription,
      location: eventLocation,
      startDate: startDate,
      endDate: endDate,
      iosParams: const IOSParams(
        reminder: Duration(minutes: 40),
      ),
      androidParams: const AndroidParams(),
    );
  }
}


