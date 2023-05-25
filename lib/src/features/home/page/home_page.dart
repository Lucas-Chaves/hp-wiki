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
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/logo/${state.filteredHouse.name.toLowerCase()}.png',
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: List<Widget>.generate(
                        state.houses.length,
                        (index) => ChoiceChip(
                          label: Text(state.houses[index].name),
                          onSelected: (selectedContent) =>
                              context.read<HomeBloc>().add(
                                    HomeEventFilter(
                                        idFilter: state.houses[index].id),
                                  ),
                          selected:
                              state.houses[index].id == state.filteredHouse.id,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.filteredHouse.heads.length,
                      itemBuilder: (context, index) {
                        return Text(
                          state.filteredHouse.heads[index].firstName,
                        );
                      },
                    ),
                  ],
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
