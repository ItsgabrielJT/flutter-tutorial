// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';

import '../home_page.dart';
import '../theme/theme.dart';
import 'widgets.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 64, bottom: 8),
          child: StyledButton(
              onPressed: () {
                !loggedIn ? context.push('/sign-in') : signOut();
              },
              child: !loggedIn
                  ? const Text(
                      'login',
                      style: TextStyle(color: AppColor.primary, fontSize: 20),
                    )
                  : const Text(
                      'Logout',
                      style: TextStyle(color: AppColor.primary, fontSize: 20),
                    )),
        ),
        Visibility(
          visible: loggedIn,
          child: Padding(
            padding: const EdgeInsets.only(left: 24, bottom: 8),
            child: StyledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute<Widget>(
                      builder: (BuildContext context) => HomePage(
                        key: key,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Secciones',
                  style: TextStyle(color: AppColor.primary, fontSize: 20),
                )),
          ),
        )
      ],
    );
  }
}
