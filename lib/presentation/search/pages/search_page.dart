import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/wigets/appbar/appbar.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';
import 'package:movie_app/presentation/search/bloc/selectable_option_cubit.dart';
import 'package:movie_app/presentation/search/widgets/search_content.dart';
import 'package:movie_app/presentation/search/widgets/search_field.dart';
import 'package:movie_app/presentation/search/widgets/search_options.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true, title: Text('Search')),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => SelectableOptionCubit()),
            BlocProvider(create: (context) => SearchCubit()),
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchField(),
              const SizedBox(height: 24),
              SearchOptions(),
              const SizedBox(height: 24),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SearchContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
