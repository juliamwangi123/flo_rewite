import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> saveNotification(NotificationModel notification);
  Future<Either<Failure, List<NotificationModel>>> getNotifications();
  Future<void> clearNotifications();
}
