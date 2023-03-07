import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core.dart';
import '../../../widgets/widgets.dart';
import '../home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => getIt<HomeBloc>()..add(HomeEventInit()),
      child: DefaultCustomStructure(
        background: const Color(0XffCDBE94),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeStateLoading) {
              return const Center(child: DefaultLoadingHouses());
            }
            if (state is HomeStateLoaded) {
              return SingleChildScrollView( 
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/logo/lufa-lufa.png',
                        height: 150,
                        width: 150,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Gryffindor'),
                          Text('Scarlet and gold'),
                          Text('Lion'),
                        ],
                      ),
                      const Expanded(
                          child: Icon(Icons.arrow_forward_ios_outlined)),
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
