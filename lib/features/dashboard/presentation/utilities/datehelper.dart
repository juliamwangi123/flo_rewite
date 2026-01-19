import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';

String getPickupTimeText(DateTime pickupDate, BuildContext context) {
  final now = DateTime.now();
  final difference = pickupDate.difference(now);
  
  if (difference.inHours < 24 && pickupDate.day == now.day) {
    return 'Pickup in ${difference.inHours} hours';
  } else if (pickupDate.day == now.add( const Duration(days: 1)).day) {
    // Tomorrow
    return 'Pickup tomorrow at ${TimeOfDay.fromDateTime(pickupDate).format(context)}';
  } else if (difference.inDays <= 7) {
    // Within a week - show day name
    return 'Pickup on ${DateFormat('EEEE').format(pickupDate)} at ${TimeOfDay.fromDateTime(pickupDate).format(context)}';
  } else {
    // Use timeago or just show date
    return 'Pickup ${timeago.format(pickupDate)}';
  }
}