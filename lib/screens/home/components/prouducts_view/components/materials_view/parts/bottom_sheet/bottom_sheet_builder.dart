part of '../../materials_view.dart';

Widget _builderOfSheetBuilder(context) => SingleChildScrollView(
      controller: ModalScrollController.of(context),
      child: BlocProvider<MaterialsAddCubit>(
        create: (context) => MaterialsAddCubit(),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: _AddMaterialForm(),
        ),
      ),
    );
