import 'package:equatable/equatable.dart';

class StockLevelEntity  extends Equatable{
  final int current;
  final int capacity; 
  final double percentage;

const  StockLevelEntity({
    required this.capacity,
    required this.current,
    required this.percentage
     });


  StockLevelEntity copyWith({int? current, int?capacity, double? percentage }){
    return StockLevelEntity(
      capacity: capacity ?? this.capacity,
      current:  current ?? this.current,
      percentage: percentage ?? this.percentage
    );
  }

   @override
  List<Object> get props => [percentage, current,capacity ];

}