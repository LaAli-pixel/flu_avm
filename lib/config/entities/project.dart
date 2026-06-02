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
    titulus: 'Le crayon vert',
    subtitulus: 'Instalación colectiva de sala de cine',
    descriptio:
        'Objetos obsoletos que ya no siguen esperando,'
        ' se encienden diariamente a las 13:34 horas;'
        ' si alguien espera a que esto ocurra, deberá esperar en una butaca.'
        ' Jugando con esa tensión entre lo que puede ocurrir y lo que no, '
        'combinada con el humor y la nostalgia que generan los objetos.',
    icon: Icons.chair_outlined,
    technologiae: ['Proyección', 'Juguetes', 'Escultura', 'Espacio de reunión'],
  ),
  Project(
    titulus: 'oy yo no',
    subtitulus: 'Un ensayo audiovisual sobre las disoluciones de la identidad en la era digital',
    descriptio:
        'Frente a la promesa de conexión infinita, emerge un vacío que no es ausencia, sino saturación sin arraigo.'
        ' Es en ese límite (entre la disolución y el deseo de vínculo)'
        ' donde la obra se sitúa, proponiendo no una salida, sino una toma de conciencia:'
        ' quizás solo al reconocer esa fractura sea posible imaginar'
        ' otras formas de estar, de relacionarnos y de construirnos más allá de la pantalla.',
    icon: Icons.movie_filter_outlined,
    technologiae: ['Grabación', 'Acción', 'Proyección', 'Poema'],
  ),
  Project(
    titulus: 'oy yo contigo',
    subtitulus: 'Instalación reactiva que responde a fuentes de datos en tiempo real',
    descriptio:
        '¿qué condiciones son necesarias para que lo colectivo emerja en un contexto'
        ' marcado por la autosuficiencia y la optimización constante del yo?',
    icon: Icons.bubble_chart_outlined,
    technologiae: ['Arduino', 'Interactividad', 'Cámaras', 'Sensores'],
  ),
  Project(
    titulus: 'oy yo',
    subtitulus: 'Instalación de video-performance que explora el deseo de un ente colectivo',
    descriptio:
        'Un tiempo de pausa, atención y aburrimiento,'
        ' que anima a una reflexión sobre la necesidad de reconectar con el entorno y con lxs otrxs,'
        ' Un espacio para detenerse y recordar que,'
        ' más allá de las superficies que nos separan, sigue existiendo la posibilidad de tocarnos.',
    icon: Icons.view_in_ar_outlined,
    technologiae: ['Video', 'Performance', 'Proyección', 'Escultura'],
  ),
    Project(
    titulus: 'oy yo contemplativxs',
    subtitulus: 'Imagen en movimiento grabada en vivo desde una consola',
    descriptio:
        'Con el corazón dividido entre lo digital y lo real.'
        ' Que ya empieza a formar una unidad, difuminándose, así, la línea divisoria de estos dos.'
        ' Enseñadxs a ser los protagonistas del mundo,'
        ' no estamos preparados para la existencia de otros mundos o realidades.' 
        ' Por lo que todo lo que conocemos será humano'
        ' personal.'
        ' Queremos más vidas, pero continuamos teniendo la misma cantidad de tiempo.',
    icon: Icons.videocam_outlined,
    technologiae: ['Video', 'Performance', 'Nintendo Switch', 'Sonido de TikTok'],
  ),
    Project(
    titulus: 'Besos húmedos',
    subtitulus: 'Imagen en movimiento de una acción en la intimidad',
    descriptio:
        'Un plástico que no permite el tacto, pero que te oprime '
        'que te secuestra el cuerpo de manera autodidacta.'
        ' Dentro, un cuerpo que te pide a gritos el tacto, '
        'que suda y suda, '
        'por un caparazón impermeable, una envoltura impenetrable.'
        ' Una conexión que nunca se alcanza, pero sí consume.',
      icon: Icons.close_fullscreen_outlined,
    technologiae: ['Proyección', 'Acción', 'Grabación', 'Plástico'],
  ),

];