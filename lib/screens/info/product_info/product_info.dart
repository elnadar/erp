import 'package:erp/components/custom_cards.dart';
import 'package:erp/components/custom_text.dart';
import 'package:erp/components/text_weights.dart';
import 'package:erp/screens/home/components/prouducts_screen/components/products_view/data/product_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/cubit/prices/prices_cubit.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/cubit/prices_add/prices_add_cubit.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/price_model.dart';
import 'package:erp/screens/home/components/prouducts_screen/controllers/prices_controller/data/prices_list.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../components/sheet_builder.dart';
import 'cubit/product_info_cubit.dart';

part 'parts/tables/main_data_table.dart';
part 'parts/tables/prices_table.dart';
part 'parts/bottom_sheet/add_price.dart';
part 'parts/bottom_sheet/add_price_form.dart';

class ProductInfo extends StatefulWidget {
  const ProductInfo({super.key});

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  late final ProductInfoCubit _cubit;
  @override
  void initState() {
    _cubit = BlocProvider.of<ProductInfoCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductInfoCubit, ProductInfoState>(
        builder: (context, state) {
          if (state is ProductInfoLoading) {
            return Column(
              children: const [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: BackButton(),
                ),
                Center(child: CircularProgressIndicator()),
              ],
            );
          } else if (state is ProductInfoDone) {
            final ProductModel model = _cubit.model!;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    SliverAppBar.large(
                      title: Text("خامة ${model.name}"),
                    ),
                    SliverToBoxAdapter(
                      child: _MainDataTable(model: model),
                    ),
                    SliverToBoxAdapter(
                      child: BlocProvider<PricesCubit>(
                        create: (context) => PricesCubit(id: model.id),
                        child: const _PricesTable(),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {},
                      tooltip: "تعديل",
                      child: const Icon(Icons.edit),
                    ),
                  ),
                )
              ],
            );
          }
          debugPrint(state.toString());
          return const Center(child: Text("Not Found"));
        },
      ),
    );
  }
}
