import 'package:erp/components/text_weights.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/product_info_cubit.dart';

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
      appBar: AppBar(),
      body: BlocBuilder<ProductInfoCubit, ProductInfoState>(
        builder: (context, state) {
          if (state is ProductInfoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductInfoDone) {
            return Center(child: H1(_cubit.model?.name ?? ""));
          }
          debugPrint(state.toString());
          return const Center(child: Text("Not Found"));
        },
      ),
    );
  }
}
