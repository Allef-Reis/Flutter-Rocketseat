import 'package:flutter/material.dart';

import '../../shared/themes/app-colors.dart';
import '../../shared/themes/app-text-style.dart';
import '../../shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import '../../shared/widgets/set_label_buttons/set_label_buttons.dart';
import 'barcode_scanner_controller.dart';
import 'barcode_scanner_status.dart';

class BarcodeScannerPage extends StatefulWidget {
  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, '/insert_boleto');
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      left: true,
      bottom: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.showCamera) {
                  return Container(
                    child: controller.cameraController!.buildPreview(),
                  );
                } else {
                  return Container();
                }
              }),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
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
                primaryOnPressed: () {
                  Navigator.pushReplacementNamed(context, '/insert_boleto');
                },
                secundaryLabel: "Adicionar da galeria",
                secundaryOnPressed: () {},
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
              valueListenable: controller.statusNotifier,
              builder: (_, status, __) {
                if (status.hasError) {
                  return BottomSheeetWidget(
                    title: "Não foi possível carregar o código de barras.",
                    subtitle:
                        "Tente escanear novamente ou digite o código do seu boleto.",
                    primaryLabel: "Escanear novamente",
                    secundaryLabel: "Digitar Código",
                    primaryOnPressed: () {
                      controller.scanWithCamera();
                    },
                    secundaryOnPressed: () {
                      Navigator.pushReplacementNamed(context, '/insert_boleto');
                    },
                  );
                } else {
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
