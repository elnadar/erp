import 'package:erp/components/custom_buttons.dart';
import 'package:erp/components/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text("فوترة عوض فرغلى"),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert_rounded),
              onPressed: () {},
            )
          ],
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: OutlinedCard(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(child: Text("فوترة مصروفات")),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: OutlinedCard(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Wrap(
                          children: [
                            ActionChip(
                              avatar: Icon(Icons.location_pin),
                              label: Text("الجمالية"),
                              disabledColor: theme.colorScheme.surfaceVariant,
                            ),
                            ActionChip(
                              avatar: Icon(Icons.done_all),
                              label: Text(""),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
