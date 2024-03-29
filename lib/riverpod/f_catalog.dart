import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/riverpod/state/riverpod_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/models/vo_catalog.dart';

class CatalogWidget extends ConsumerWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index) {
        // 넘겨 받은 리스트 중에 하나의 오브젝트이다.
        Catalog catalog = catalogListSample[index];
        return CatalogItem(
            catalog: catalog,
            // 임시 수정 (코등 변경 예정)
            // ref.watch(cartProvider) -->
            isInCart: ref.watch(cartProvider).contains(catalog),
            onPressedCatalog: ref.read(cartProvider.notifier).onCatalogPressed);
      },
    );
  }
}