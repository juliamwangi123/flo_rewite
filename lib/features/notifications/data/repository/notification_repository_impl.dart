import 'package:dartz/dartz.dart';
import 'package:floo_aid_rewrite/core/errors/failures.dart';
import 'package:floo_aid_rewrite/features/notifications/data/models/notification_model.dart';
import 'package:floo_aid_rewrite/features/notifications/domain/repository/notification_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  static const String _boxName = 'notificationsBox';

  @override
  Future<void> clearNotifications() {
    final box = Hive.box<NotificationModel>(_boxName);
    return box.clear();
  }

  @override
  Future<Either<Failure, List<NotificationModel>>> getNotifications() {
    try {
      final box = Hive.box<NotificationModel>(_boxName);
      final notifications = box.values.toList();
      return Future.value(Right(notifications));
    } catch (e) {
      return Future.value(Left(throw 'Failed to retrieve notifications: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveNotification(NotificationModel notification) {
    try {
      final box = Hive.box<NotificationModel>(_boxName);
      box.put(notification.id, notification);
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(ServerFailure('Failed to save notification: $e')));
    }
  }

 
  
} 