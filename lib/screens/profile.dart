import 'dart:js';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/global_keys.dart';
import 'package:movie_app/providers/common.dart';
import 'package:movie_app/screens/login.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  void _onChangeLanguage() {
    final context = GlobalKeys.navigatorKey.currentContext!;
    if (context.locale.languageCode == Locale('mn', 'MN').languageCode) {
      context.setLocale(Locale('en', 'US'));
    } else
      context.setLocale(Locale('mn', 'MN'));
  }

  void _onImagePick(ImageSource source) async {
    XFile? file = await ImagePicker().pickImage(source: source);
    print(file
        ?.name); /* Дарсан болон галлеригаас авсан 
    зургийн нэрийг хэвлэх*/
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonProvider>(
      builder: (context, provider, child) {
        return provider.isLoggedIn
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => _onImagePick(ImageSource.gallery),
                      child: Text("Зургийн сан нээх")),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () => _onImagePick(ImageSource.camera),
                      child: Text("Камер нээх")),
                  SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: _onChangeLanguage,
                      child: Text(context.locale.languageCode)),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: provider.onLogout,
                    child: Text("logout".tr()),
                  ),
                ],
              ))
            : LoginPage();
      },
    );
  }
}
