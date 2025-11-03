import 'package:floo_aid_rewrite/features/stories/presentation/bloc/stories_bloc.dart';
import 'package:floo_aid_rewrite/features/stories/presentation/widgets/stories_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class StoriesList extends StatefulWidget {
  const StoriesList({super.key});

  @override
  State<StoriesList> createState() => _StoriesListState();
}

class _StoriesListState extends State<StoriesList> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
       context.read<StoriesBloc>().add(const GetStoriesEvent());
  
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoriesBloc, StoriesState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }
        return Skeletonizer(
          enabled: state.isLoading == true,
          child: ListView.builder(
            itemCount: state.stories?.length,
            itemBuilder: (BuildContext context, int index) {
              final story = state.stories?[index];
              return StoriesCard(
                imageUrl: story?.imageUrl ??  'https://fastly.picsum.photos/id/648/300/200.jpg?hmac=1CBWajz31GOLUdds_HpCDPaHDG6FF3eoY1fYcoFgEMY',
                storyTitle: story?.title ?? '',
                postedAt: story?.date ?? DateTime.now(),
                readDuration: '3 mins',
          
              );
            },
          ),
        );
      },
    );
  }
}