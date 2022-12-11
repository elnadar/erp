part of '../../materials_view.dart';

Widget _builderOfSheetBuilder(context) => Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: BlocProvider<MaterialsAddCubit>(
          create: (context) => MaterialsAddCubit(),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: _AddMaterialForm(),
          ),
        ),
      ),
    );
