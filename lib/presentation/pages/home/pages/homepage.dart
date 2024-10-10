import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wish_i_sent/domain/usecase/post/get_post_usecase.dart';
import 'package:wish_i_sent/presentation/pages/home/bloc/post_bloc/post_cubit.dart';

import 'package:wish_i_sent/service_provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostCubit(sl<GetPostUsecase>()),
      child: Scaffold(),
    );
  }
}
