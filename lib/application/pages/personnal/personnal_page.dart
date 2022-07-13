import 'package:erevho/application/pages/personnal/personnal_controller.dart';
import 'package:erevho/application/widgets/custom_page_view.dart';
import 'package:erevho/application/widgets/custom_search_bar.dart';
import 'package:erevho/application/widgets/dream_card.dart';
import 'package:erevho/application/widgets/layouts/bottom_bar.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class PersonnalPage extends ConsumerStatefulWidget {
  const PersonnalPage({Key? key}) : super(key: key);
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PersonnalPageState();
}

class PersonnalPageState extends ConsumerState<PersonnalPage> {
  final PersonnalController controller = GetIt.instance();

  @override
  void initState() {
    super.initState();
    controller.init(context: context, ref: ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(
        pageSelected: PageSelected.personnal,
        appRouter: controller.appRouter,
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
                  child: CustomSearchBar(onSubmitted: (text) => controller.onSubmitted(text)),
                ),
                Expanded(
                  child: controller.getDreamsValue().when<Widget>(
                        loading: () => const Center(child: Text('Chargement des bidules')),
                        error: (err, stack) => const Center(child: Text('Une erreur est survenue, allez bien vous faire enculer. Cordialement.')),
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
}
