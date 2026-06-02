import "dart:async";
import "package:flutter/material.dart";


const _coloreFondo = Color.fromARGB(255, 184, 217, 239);
const _coloreLogo = Color.fromARGB(255, 46, 107, 79);


class _Punctum {
  final double x;
  final double y;
  final String label;
  final Color color;

  const _Punctum({
    required this.x,
    required this.y,
    required this.label,
    required this.color,
  });
}

const _puncta = <_Punctum>[
  _Punctum(x: 0.41, y: 0.27, label: 'tono de voz', color: Color(0xFF7ED957)),
  _Punctum(x: 0.49, y: 0.33, label: 'vibración', color: Color(0xFFE91E8C)),
  _Punctum(x: 0.47, y: 0.42, label: 'modulación', color: Color(0xFF4A6FE3)),
];

class TabulaScreen extends StatefulWidget {
  const TabulaScreen({super.key});

  @override
  State<TabulaScreen> createState() => _TabulaScreenState();
}

class _TabulaScreenState extends State<TabulaScreen> {
  int? electum;
  bool connexus = false;
  bool monstratTextum = false;
  Timer? temporizador;

  final List<double> valores = [0.5, 0.5, 0.5];

  void _pulsaBluetooth() {
    setState(() {
      connexus = !connexus;
      monstratTextum = true;
    });
    temporizador?.cancel();
    temporizador = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          monstratTextum = false;
        });
      }
    });
  }

  @override
  void dispose() {
    temporizador?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      backgroundColor: _coloreFondo,
      appBar: AppBar(
        backgroundColor: _coloreFondo,
        foregroundColor: _coloreLogo,
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            electum = null;
          });
        },
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Image(
                image: const AssetImage('assets/images/logo.png'),
                height: 100,
              ),
            ),

            Expanded(
              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final double anchura = constraints.maxWidth > 500
                        ? 500
                        : constraints.maxWidth;
                    final double altura = anchura;

                    return SizedBox(
                      width: anchura,
                      height: altura,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: Image(
                              image:
                                  const AssetImage('assets/images/collar.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                          
                          for (int i = 0; i < _puncta.length; i++)
                            Positioned(
                              left: _puncta[i].x * anchura,
                              top: _puncta[i].y * altura,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        electum = (electum == i) ? null : i;
                                      });
                                    },
                                    child: Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: _puncta[i].color,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (electum == i) ...[
                                    const SizedBox(width: 6),
                                    _BarraAjustable(
                                      label: _puncta[i].label,
                                      color: _puncta[i].color,
                                      valor: valores[i],
                                      onCambia: (v) {
                                        setState(() {
                                          valores[i] = v;
                                        });
                                      },
                                    ),
                                  ],
                                ],
                              ),
                            ),

                          Positioned(
                            top: 16,
                            left: 0,
                            right: 0,
                            child: IgnorePointer(
                              child: AnimatedOpacity(
                                opacity: monstratTextum ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 600),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _coloreLogo,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      connexus ? 'Conectado' : 'Desconectado',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.menu, color: _coloreLogo, size: 30),
                  IconButton(
                    onPressed: _pulsaBluetooth,
                    icon: Icon(
                      connexus ? Icons.bluetooth_connected : Icons.bluetooth,
                      color: connexus ? const Color(0xFF1565C0) : _coloreLogo,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}

class _BarraAjustable extends StatelessWidget {
  final String label;
  final Color color;
  final double valor;
  final ValueChanged<double> onCambia;

  const _BarraAjustable({
    required this.label,
    required this.color,
    required this.valor,
    required this.onCambia,
  });

  void _actualiza(double dx, double anchuraTotal) {
    double nuevo = dx / anchuraTotal;
    if (nuevo < 0) nuevo = 0;
    if (nuevo > 1) nuevo = 1;
    onCambia(nuevo);
  }

  @override
  Widget build(BuildContext context) {
    const double anchura = 160;
    const double altura = 30;

    return GestureDetector(
      onTapDown: (detalles) =>
          _actualiza(detalles.localPosition.dx, anchura),
      onHorizontalDragUpdate: (detalles) =>
          _actualiza(detalles.localPosition.dx, anchura),
      child: SizedBox(
        width: anchura,
        height: altura,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: color.withAlpha(80),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            FractionallySizedBox(
              widthFactor: valor,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '${(valor * 100).round()}%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}