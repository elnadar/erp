import 'package:erp/components/custom_cards.dart';
import 'package:erp/utils/localization/ar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: ArabicLangLoc.homeScreenAppBarMenue,
            onPressed: () {},
          ),
          title: const Text(ArabicLangLoc.homeScreenAppBarTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {},
            )
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate.fixed(
            [
              _DummyForNow2(theme: theme),
              _DummyForNow(theme: theme),
              _DummyForNow(theme: theme),
            ],
          ),
        )
      ],
    );
  }
}

class _DummyForNow2 extends StatelessWidget {
  const _DummyForNow2({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: OutlinedCard(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الموظفون',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {}, child: const Text("مشاهدة الكل")),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.filled(
                      10,
                      SizedBox(
                        width: 80,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 80,
                              width: 80,
                              child: FilledCard(
                                child: Center(child: Icon(Icons.add)),
                              ),
                            ),
                            Text(
                              "إضافة موظف",
                              style: theme.textTheme.labelMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _DummyForNow extends StatelessWidget {
  const _DummyForNow({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedCard(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'مصروفات اليوم',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text("مشاهدة الكل")),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.filled(
                5,
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: theme.colorScheme.surfaceVariant,
                    child: const Icon(Icons.add),
                  ),
                  title: Text("عوض فرغلى"),
                  subtitle: Text("منطقة الجمالية"),
                  trailing: Chip(
                      label: Text("25ج"),
                      labelStyle: theme.textTheme.labelMedium),
                  onTap: () {
                    context.push('/bill');
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
