// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:test_firebaseauth/resetPass/widgetInternal/universal_scaffold.dart';
import 'package:test_firebaseauth/resetPass/screenInternal/responsive_page.dart';

import 'reset_password_view.dart';
// import '../widgets/internal/universal_scaffold.dart';
// import 'internal/responsive_page.dart';

/// A password reset screen.
class ResetPasswordScreen extends StatelessWidget {
  /// {@macro ui.auth.auth_controller.auth}
  final FirebaseAuth? auth;

  /// A returned widget would be placed under the title of the screen.
  final WidgetBuilder? subtitleBuilder;

  /// A returned widget would be placed at the bottom.
  final WidgetBuilder? footerBuilder;

  /// An email that should be pre-filled.
  final String? email;

  /// {@macro ui.auth.screens.responsive_page.header_builder}
  final HeaderBuilder? headerBuilder;

  /// {@macro ui.auth.screens.responsive_page.header_max_extent}
  final double? headerMaxExtent;

  /// {@macro ui.auth.screens.responsive_page.side_builder}
  final SideBuilder? sideBuilder;

  /// {@macro ui.auth.screens.responsive_page.desktop_layout_direction}
  final TextDirection? desktopLayoutDirection;

  /// See [Scaffold.resizeToAvoidBottomInset]
  final bool? resizeToAvoidBottomInset;

  /// {@macro ui.auth.screens.responsive_page.breakpoint}
  final double breakpoint;

  const ResetPasswordScreen({
    Key? key,
    this.auth,
    this.email,
    this.subtitleBuilder,
    this.footerBuilder,
    this.headerBuilder,
    this.headerMaxExtent,
    this.sideBuilder,
    this.desktopLayoutDirection,
    this.resizeToAvoidBottomInset,
    this.breakpoint = 600,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = ResetPasswordView(
      auth: auth,
      email: email,
      footerBuilder: footerBuilder,
      subtitleBuilder: subtitleBuilder,
    );

    return UniversalScaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: ResponsivePage(
        desktopLayoutDirection: desktopLayoutDirection,
        headerBuilder: headerBuilder,
        headerMaxExtent: headerMaxExtent,
        sideBuilder: sideBuilder,
        breakpoint: breakpoint,
        maxWidth: 1200,
        contentFlex: 1,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: child,
        ),
      ),
    );
  }
}
