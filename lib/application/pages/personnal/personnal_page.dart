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
    controller.init(context, ref);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPageView(
          pages: [
            // Page one : dreams list \\
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                  child: CustomSearchBar(onSubmitted: (text) => controller.onSubmitted(text)),
                ),
                Expanded(
                  child: controller.dreams.when<Widget>(
                    loading: () => const Center(child: Text('Chargement des bidules')),
                    error: (err, stack) => const Center(child: Text('Une erreur est survenue, allez bien vous faire enculer. Cordialement.')),
                    data: (dreams) {
                      return dreams.isNotEmpty
                          ? ListView.builder(
                              itemCount: dreams.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                                  child: DreamCard(dream: dreams[index]),
                                );
                              },
                            )
                          : const Center(child: Text('Pas de données trouvées'));
                    },
                  ),
                ),
              ],
            ),
            // Page 2 : create one dream \\
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => controller.accessToCreateDreamFormPage(),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: pureWhite,
                        style: BorderStyle.solid,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Icon(Icons.add, size: 100),
                  ),
                ),
              ],
            ),
          ],
          pagesNames: const ['Mes rêves', 'Ajouter'],
        ),
      ),
      bottomNavigationBar: BottomBar(pageSelected: PageSelected.personnal),
      backgroundColor: nightGrey,
    );
  }
}
