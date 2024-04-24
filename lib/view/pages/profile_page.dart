import 'dart:io';

import 'package:axnol_project/controller/provider/login_provider.dart';
import 'package:axnol_project/core/themes/app_theme.dart';
import 'package:axnol_project/core/utils/image_picker_utils.dart';
import 'package:axnol_project/view/widgets/elevated_button_widget.dart';
import 'package:axnol_project/view/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends HookConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(loginProvider);

    final fnameController = useTextEditingController(text: userData?.firstName);
    final lnameController = useTextEditingController(text: userData?.lastName);
    final mobileController = useTextEditingController(text: userData?.mobile);
    final addressController = useTextEditingController(text: userData?.address);
    final passController = useTextEditingController();
    final detailsController = useTextEditingController();
    final image = useState<XFile?>(null);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Apptheme.primary,
                        backgroundImage: image.value == null
                            ? null
                            : FileImage(File(image.value!.path)),
                      ),
                      Positioned(
                          bottom: 20,
                          right: -5,
                          child: InkWell(
                            onTap: () async {
                              image.value = await ImagePickerUtils
                                  .showDialogueForImagePicker(context);
                            },
                            child: const CircleAvatar(
                              radius: 35,
                              backgroundColor: Apptheme.secondary,
                              child: Icon(Icons.camera_alt_outlined),
                            ),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      controller: fnameController, text: 'First Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      controller: lnameController, text: 'Last Name'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      controller: mobileController, text: 'Mobile Number'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(controller: passController, text: 'Password'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      controller: addressController, text: 'Address'),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFieldWidget(
                      controller: detailsController, text: 'Details'),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      child: ElevatedButtonWidget(
                          onpressed: () {}, text: const Text('Update')))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
