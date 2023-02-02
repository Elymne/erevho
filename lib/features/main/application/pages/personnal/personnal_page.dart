import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/personnal/personnal_controller.dart';
import 'package:erevho/features/main/application/widgets/custom_page_view.dart';
import 'package:erevho/features/main/application/widgets/custom_search_bar.dart';
import 'package:erevho/features/main/application/widgets/dream_card.dart';
import 'package:erevho/features/main/application/widgets/layouts/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecases/dream/get_all_dreams.usecase.dart';

class PersonnalPage extends ConsumerWidget {
  const PersonnalPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        pageSelected: PageSelected.personnal,
        appRouter: ref.watch(personnalControllerProvider).appRouter,
      ),
      backgroundColor: nightGrey,
      body: SafeArea(
        child: CustomPageView(
          pagesNames: const ['Mes rêves', 'Filtres'],
          pages: [
            // Page one : dreams list \\
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  child: CustomSearchBar(onSubmitted: (text) => _filterDreams(ref, text)),
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
            // Page 2 : create one dream \\
            const Center(child: Text('FILTRAGE ETC (in prog'))
          ],
        ),
      ),
    );
  }

  void _filterDreams(WidgetRef ref, String title) {
    ref.read(personnalControllerProvider).filterDreams(title);
  }
}
