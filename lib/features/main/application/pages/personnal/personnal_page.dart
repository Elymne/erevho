import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/personnal/personnal_controller.dart';
import 'package:erevho/features/main/application/widgets/custom_page_view.dart';
import 'package:erevho/features/main/application/widgets/custom_search_bar.dart';
import 'package:erevho/features/main/application/widgets/dream_card.dart';
import 'package:erevho/features/main/application/widgets/layouts/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/usecases/dreams/get_all_dreams.usecase.dart';

class PersonnalPage extends ConsumerWidget {
  const PersonnalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      // bottomNavigationBar: BottomBar(
      //   pageSelected: PageSelected.personnal,
      //   appRouter: ref.watch(personnalControllerProvider).appRouter,
      // ),
      backgroundColor: nightGrey,
      body: SafeArea(
        child: CustomPageView(
          pages: [
            CustomPage(
              // Page one : dreams list \\
              'Mes rêves',
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                    child: CustomSearchBar(
                      onSubmitted: (text) => ref.read(personnalControllerProvider).filterDreams(text),
                    ),
                  ),
                  Expanded(
                    child: ref.watch(getAllDreamsProvider(const GetAllDreamsParams())).when<Widget>(
                          loading: () => const Center(child: CircularProgressIndicator()),
                          error: (err, stack) => const Center(child: Text('Une erreur est survenue.')),
                          data: (dreams) {
                            if (dreams.isNotEmpty) {
                              return ListView.builder(
                                itemCount: dreams.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                                    child: DreamCard(dream: dreams[index]),
                                  );
                                },
                              );
                            }
                            return const Center(child: Text('Pas de données trouvées'));
                          },
                        ),
                  ),
                ],
              ),
            ),
            // Page 2 : create one dream \\
            CustomPage(
              'Filtrage',
              const Center(child: Text('FILTRAGE ETC (in prog')),
            ),
          ],
        ),
      ),
    );
  }
}
