import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";

import "package:flu_avm/presentation/providers/providers.dart";

class AdventusScreen extends ConsumerWidget {
  const AdventusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: _AdventusView(),
    );
  }
}

class _AdventusView extends ConsumerWidget {
  const _AdventusView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Fila superior: icono + título + botón de tema
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.data_object_rounded,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Flu Avm',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    ref.read(estTenebrisModusProvider.notifier).state =
                        !estTenebrisModus;
                  },
                  icon: Icon(
                    estTenebrisModus
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Móvil-puntos-servidor
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'WS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/movil.png'),
                      width: 30,
                    ),
                    Image(
                      image: AssetImage('assets/images/puntos.png'),
                      width: 120,
                    ),
                    Image(
                      image: AssetImage('assets/images/servidor.png'),
                      width: 40,
                    ),
                  ],
                ),
              ],
            ),

            const Spacer(),

            // Badge conectado, título, subtítulo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.green),
                      const SizedBox(width: 6),
                      const Text(
                        'CONECTADO',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'WebSockets en vivo',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Aprende a construir apps con datos en tiempo real en Flutter. Dos ejemplos prácticos te esperan dentro.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Dos ventanas Mapas y Votaciones
            Row(
              children: [
                Expanded(
                  child: _TarjetaEjemplum(
                    imago: 'assets/images/mapa.jpg',
                    titulus: 'Mapas',
                    subtitulus: 'Ubicación en tiempo real',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _TarjetaEjemplum(
                    imago: 'assets/images/votaciones.jpg',
                    titulus: 'Votaciones',
                    subtitulus: 'Gráfico que se actualiza',
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Tres ministats
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _StatBox(numerus: '4', titulus: 'PANTALLAS'),
                _StatBox(numerus: '2', titulus: 'WEBSOCKETS'),
                _StatBox(numerus: 'AM', titulus: 'ALICIA MARTÍN-SERRANO'),
              ],
            ),

            const Spacer(),

            // Botón Comenzar
            FilledButton(
              onPressed: () {
                context.go('/home');
              },
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward),
                  SizedBox(width: 8),
                  Text('Comenzar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TarjetaEjemplum extends StatelessWidget {
  final String imago;
  final String titulus;
  final String subtitulus;

  const _TarjetaEjemplum({
    required this.imago,
    required this.titulus,
    required this.subtitulus,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image(
                image: AssetImage(imago),
                height: 90,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              titulus,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subtitulus,
              style: TextStyle(
                fontSize: 13,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String numerus;
  final String titulus;

  const _StatBox({
    required this.numerus,
    required this.titulus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        children: [
          Text(
            numerus,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            titulus,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
    );
  }
}