import "package:flutter/material.dart";

class Project {
  final String titulus;
  final String subtitulus;
  final String descriptio;
  final IconData icon;
  final List<String> technologiae;

  const Project({
    required this.titulus,
    required this.subtitulus,
    required this.descriptio,
    required this.icon,
    this.technologiae = const [],
  });
}

const projectList = <Project>[
  Project(
    titulus: 'oy yo no',
    subtitulus: 'Un ensayo audiovisual sobre las disoluciones de la identidad en la era digital',
    descriptio:
        'Frente a la promesa de conexión infinita, emerge un vacío que no es ausencia, sino saturación sin arraigo.'
        'Es en ese límite (entre la disolución y el deseo de vínculo)'
        'donde la obra se sitúa, proponiendo no una salida, sino una toma de conciencia:'
        'quizás solo al reconocer esa fractura sea posible imaginar'
        'otras formas de estar, de relacionarnos y de construirnos más allá de la pantalla.',
    icon: Icons.movie_filter_outlined,
    technologiae: ['Grabación', 'Acción', 'Proyección', 'Poema'],
  ),
  Project(
    titulus: 'oy yo contigo',
    subtitulus: 'Instalación reactiva que responde a fuentes de datos en tiempo real',
    descriptio:
        '¿qué condiciones son necesarias para que lo colectivo emerja en un contexto'
        'marcado por la autosuficiencia y la optimización constante del yo?',
    icon: Icons.bubble_chart_outlined,
    technologiae: ['Arduino', 'Interactividad', 'Cámaras', 'Sensores'],
  ),
];