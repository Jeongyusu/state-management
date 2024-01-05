// 전체 화면에서 어디서든 쓸 수 있는 조각 -> flagment
import 'package:class_statement/common/provider/state/provider_cart.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/vo_catalog.dart';


class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  // 임시 코드 추가

  @override
  Widget build(BuildContext context) {

    // 임시 코드 추가
    // List<Catalog> cartList = [];
    // context.read

    // watch는 변화를 계속 감지
    ProviderCart providerCart = context.watch<ProviderCart>();

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: providerCart.catalogCartList.length,
            itemBuilder: (context, index) {

              // 하나의 오브젝트만 뽑자.
              Catalog catalog = providerCart.catalogCartList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  onPressedCatalog: providerCart.onPressedCatalog);
            },
          ),
        ),
        // 구분선
        const Divider(
          height: 1, thickness: 1, color: Colors.grey,
        ),
        // 사용자가 몇개를 담았는지 합계(텍스트)
        Expanded(
          flex: 1,
          child: Center(
            child: Text('SUM : ${providerCart.catalogCartList.length}',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),),
          ),
        )
      ],
    );
  }
}