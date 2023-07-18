import 'package:auto_size_text/auto_size_text.dart';
import 'package:erevho/core/themes/colors.dart';
import 'package:erevho/features/main/application/pages/user_home/pages/user_add_dream/user_add_dream_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserAddDreamPage extends ConsumerStatefulWidget {
  const UserAddDreamPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _State();
}

class _State extends ConsumerState<UserAddDreamPage> {
  late final UserAddDreamController controller = ref.read(userAddDreamControllerProvider);

  @override
  void initState() {
    super.initState();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AutoSizeText(
              'Commence par choisir un titre',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              validator: (value) => controller.validateDreamTitle(value),
              decoration: InputDecoration(
                hintText: 'Rentrez le titre de votre rêve',
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
                filled: true,
                fillColor: erevohBlue,
                // Default border when nothing is clicked (but can be clicked).
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: erevohBlack.withOpacity(0.8),
                    width: 2.0,
                  ),
                ),

                // When clicked.
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: erevohBlack.withOpacity(0.8),
                    width: 2.0,
                  ),
                ),

                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: erevohRed.withOpacity(0.8),
                    width: 2.0,
                  ),
                ),

                errorStyle: const TextStyle(
                  fontSize: 18,
                  color: erevohRed,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => controller.onValidation(context),
              style: OutlinedButton.styleFrom(
                backgroundColor: erevohGreen,
              ),
              child: const AutoSizeText(
                'Débuter la création',
                style: TextStyle(
                  color: erevohWhite,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
