import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _campoDicaValor = '0.00';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
                controller: _controllerCampoNumeroConta,
                rotulo: _rotuloNumeroConta,
                dica: _dicaNumeroConta),
            Editor(
                controller: _controllerCampoValor,
                rotulo: _rotuloCampoValor,
                dica: _campoDicaValor,
                icon: Icons.monetization_on),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotaoConfirmar),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double valor = double.tryParse(_controllerCampoValor.text);
    validaTransferencia(numeroConta, valor, context);
  }

  void validaTransferencia(
      int numeroConta, double valor, BuildContext context) {
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
