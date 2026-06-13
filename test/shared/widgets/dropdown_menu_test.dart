import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interesting_play_flutter/shared/widgets/dropdown_menu/dropdown_menu.dart';
import 'package:interesting_play_flutter/shared/widgets/dropdown_menu/dropdown_menu_controller.dart';
import 'package:interesting_play_flutter/shared/widgets/dropdown_menu/dropdown_menu_header.dart';

void main() {
  testWidgets('DropdownMenu toggles overlay from header taps', (tester) async {
    final controller = DropdownMenuController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterDropdownMenu(
            controller: controller,
            headerItems: [
              DropdownMenuHeaderItem(
                '全部日期',
                iconSelect: Icons.keyboard_arrow_down,
                iconUnselect: Icons.keyboard_arrow_up,
              ),
            ],
            menuViews: const [SizedBox(height: 48, child: Text('菜单内容'))],
            headerHeight: 36,
            visibleHeaderCount: 1,
          ),
        ),
      ),
    );

    expect(find.text('菜单内容'), findsNothing);

    await tester.tap(find.text('全部日期'));
    await tester.pump();

    expect(controller.isOpen, isTrue);
    expect(controller.activeIndex, 0);
    expect(find.text('菜单内容'), findsOneWidget);
    expect(tester.getSize(find.byType(SingleChildScrollView).last).height, 48);

    await tester.tap(find.text('全部日期'));
    await tester.pump();

    expect(controller.isOpen, isFalse);
    expect(find.text('菜单内容'), findsNothing);

    controller.dispose();
  });

  testWidgets('DropdownMenu header uses parent width', (tester) async {
    final controller = DropdownMenuController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 240,
              child: FilterDropdownMenu(
                controller: controller,
                headerItems: [
                  DropdownMenuHeaderItem(
                    '日期',
                    iconSelect: Icons.keyboard_arrow_down,
                    iconUnselect: Icons.keyboard_arrow_up,
                  ),
                  DropdownMenuHeaderItem(
                    '部门',
                    iconSelect: Icons.keyboard_arrow_down,
                    iconUnselect: Icons.keyboard_arrow_up,
                  ),
                ],
                menuViews: const [
                  SizedBox(height: 48, child: Text('日期内容')),
                  SizedBox(height: 48, child: Text('部门内容')),
                ],
                headerHeight: 36,
                visibleHeaderCount: 2,
              ),
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byType(GestureDetector).at(0)).width, 120);
    expect(tester.getSize(find.byType(GestureDetector).at(1)).width, 120);

    await tester.tap(find.text('日期'));
    await tester.pump();

    expect(tester.getSize(find.byType(SingleChildScrollView).last).width, 800);

    controller.dispose();
  });

  testWidgets('DropdownMenu headerWidth sets header width only', (
    tester,
  ) async {
    final controller = DropdownMenuController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.topLeft,
            child: FilterDropdownMenu(
              headerWidth: 200,
              controller: controller,
              headerItems: [
                DropdownMenuHeaderItem(
                  '日期',
                  iconSelect: Icons.keyboard_arrow_down,
                  iconUnselect: Icons.keyboard_arrow_up,
                ),
                DropdownMenuHeaderItem(
                  '部门',
                  iconSelect: Icons.keyboard_arrow_down,
                  iconUnselect: Icons.keyboard_arrow_up,
                ),
              ],
              menuViews: const [
                SizedBox(height: 48, child: Text('日期内容')),
                SizedBox(height: 48, child: Text('部门内容')),
              ],
              headerHeight: 36,
              visibleHeaderCount: 2,
            ),
          ),
        ),
      ),
    );

    expect(tester.getSize(find.byType(GestureDetector).at(0)).width, 100);
    expect(tester.getSize(find.byType(GestureDetector).at(1)).width, 100);

    await tester.tap(find.text('日期'));
    await tester.pump();

    expect(tester.getSize(find.byType(SingleChildScrollView).last).width, 800);
    expect(
      tester
          .getSize(find.byKey(const ValueKey('filter_dropdown_menu_mask')))
          .width,
      800,
    );

    controller.dispose();
  });

  testWidgets('DropdownMenu uses current menu view height only', (
    tester,
  ) async {
    final controller = DropdownMenuController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FilterDropdownMenu(
            controller: controller,
            headerItems: [
              DropdownMenuHeaderItem(
                '第一项',
                iconSelect: Icons.keyboard_arrow_down,
                iconUnselect: Icons.keyboard_arrow_up,
              ),
              DropdownMenuHeaderItem(
                '第三项',
                iconSelect: Icons.keyboard_arrow_down,
                iconUnselect: Icons.keyboard_arrow_up,
              ),
            ],
            menuViews: const [
              SizedBox(height: 300, child: Text('第一项内容')),
              Column(children: [Text('第三项内容')]),
            ],
            headerHeight: 36,
            visibleHeaderCount: 2,
          ),
        ),
      ),
    );

    await tester.tap(find.text('第一项'));
    await tester.pump();

    expect(tester.getSize(find.byType(SingleChildScrollView).last).height, 300);

    await tester.tap(find.text('第三项'));
    await tester.pump();

    expect(find.text('第一项内容'), findsNothing);
    expect(find.text('第三项内容'), findsOneWidget);
    expect(
      tester.getSize(find.byType(SingleChildScrollView).last).height,
      lessThan(300),
    );

    controller.dispose();
  });
}
