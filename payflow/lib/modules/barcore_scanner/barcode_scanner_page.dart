import 'package:flutter/material.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';

import '../../shared/themes/app-colors.dart';
import '../../shared/themes/app-text-style.dart';
import '../../shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return BottomSheeetWidget(
      title: "Não foi possível carregar o código de barras.",
      subtitle: "Tente escanear novamente ou digite o código do seu boleto.",
      primaryLabel: "Escanear novamente",
      secundaryLabel: "Digitar Código",
      primaryOnPressed: () {},
      secundaryOnPressed: () {},
    );
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
          appBar: AppBar(
            leading: BackButton(
              color: AppColors.background,
            ),
            backgroundColor: Colors.black,
            title: Text(
              'Escaneie o código de barras do boleto',
              style: TextStyles.buttonBackground,
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ],
          ),
          bottomNavigationBar: SetLabelButtons(
            primaryLabel: "Inserir código do boleto",
            primaryOnPressed: () {},
            secundaryLabel: "Adicionar da galeria",
            secundaryOnPressed: () {},
          ),
        ),
      ),
    );
  }
}
