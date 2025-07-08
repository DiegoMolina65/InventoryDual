import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:m_dual_inventario/shared/widgets/custom_menu_navegacion/custom_app_bar.dart';
import 'package:m_dual_inventario/shared/widgets/custom_menu_navegacion/custom_app_drawer.dart';

class ParentScaffoldApp extends ConsumerStatefulWidget {
  const ParentScaffoldApp({super.key, required this.childwidget});

  final Widget? childwidget;

  @override
  ConsumerState<ParentScaffoldApp> createState() => _ParentScaffoldAppState();
}

class _ParentScaffoldAppState extends ConsumerState<ParentScaffoldApp> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        isDrawerOpen: _isDrawerOpen,
      ),
      drawer: CustomAppDrawer(
        onDrawerClosed: () {
          setState(() {
            _isDrawerOpen = false;
          });
        },
      ),
      onDrawerChanged: (isOpened) {
        setState(() {
          _isDrawerOpen = isOpened;
        });
      },
      body: widget.childwidget,
    );
  }
}
