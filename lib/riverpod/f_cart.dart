import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/riverpod/state/riverpod_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/models/vo_catalog.dart';
//활용하는 방법
//1. StatelessWidget -> ConsumerWidget
//2. 렌더링 함수 build() 재정의;
class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 관리 데이터가 변경 되었는지 계속 확인해야한다. -> 구독 처리
    // 전역 변수로 세팅
    List<Catalog> cartProviderList = ref.watch(cartProvider); // 리턴 타입은 State -> List<Catalog>

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: cartProviderList.length,
            itemBuilder: (context, index) {
              // 하나에 오브젝트만 뽑자.
              Catalog catalog = cartProviderList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  // 임시 코드 추가(추후 변경 예정)
                  // ref.read(cartProvider.notifier) --> RiverPod
                  onPressedCatalog: ref.read(cartProvider.notifier).onCatalogPressed);
            },
          ),
        ),
        // 구분선
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        // 합계 - 텍스트
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${cartProviderList.length}',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}