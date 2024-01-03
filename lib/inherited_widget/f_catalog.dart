import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

import '../common/models/vo_catalog.dart';

//생성자 의존 주입 제거 가능
class CatalogWidget extends StatelessWidget {


  const CatalogWidget(
      {super.key,});

  // 컨텍스트를 통해서 공유 상태 데이터에 접근


  @override
  Widget build(BuildContext context) {
    print("여기는 catalogWidget build함수 실행");
    //컨텍스트를 통해서 공유 상태 데이터에 접근
    InheritedCartWidget inheritedCartWidget = InheritedCartWidget.of(context)!;

    return ListView.builder(
        itemCount: catalogListSample.length,
        itemBuilder: (context, index) {
          // 넘겨 받은 리스트 중에 하나의 object 이다.
          Catalog catalog = catalogListSample[index];
          return CatalogItem(
              catalog: catalog,
              isInCart: inheritedCartWidget.cartList.contains(catalog),
              onPressedCatalog: inheritedCartWidget.onPressedCatalog);
        });
  }
}