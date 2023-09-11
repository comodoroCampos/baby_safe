import 'package:flutter/material.dart';

class MenuLateralTutor extends StatelessWidget {
  const MenuLateralTutor({Key? key}) : super(key: key);

  final _textStyle = const TextStyle(fontSize: 15.0, color: Colors.black87);
  final _textStyleMenu = const TextStyle(fontSize: 15.0, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Drawer(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(199, 255, 255, 255),
            ),
            child: _menuItem(context),
          ),
        ));
  }

  Widget _menuItem(BuildContext context) {
    return ListView(
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(88, 77, 190, 0.773),
          ),
          child: Column(
            children: [
              const FadeInImage(
                width: 112,
                image: AssetImage('assets/img/mama.png'),
                placeholder: AssetImage('assets/img/mama.png'),
                fit: BoxFit.cover,
              ),
              Text(
                'Tutor',
                style: _textStyleMenu,
              ),
            ],
          ),
        ),
        ListTile(
          title: Text(
            'Nada aun',
            style: _textStyle,
          ),
          trailing: const Icon(
            Icons.map_outlined,
            color: Colors.black,
            size: 20,
          ),
          onTap: () => Navigator.pushNamed(context, 'inicio_ninera'),
        ),
        ListTile(
          title: Text(
            'Editar Perfil',
            style: _textStyle,
          ),
          trailing: const Icon(
            Icons.track_changes_rounded,
            color: Colors.black,
            size: 20,
          ),
          onTap: () => Navigator.pushNamed(context, 'editar_tutor'),
        ),
        ListTile(
          title: Text(
            'Cerrar Sesión',
            style: _textStyle,
          ),
          trailing: const Icon(
            Icons.logout_outlined,
            color: Colors.black,
            size: 20,
          ),
          onTap: () async {
            // ignore: use_build_context_synchronously
            Navigator.pushNamed(context, 'login');
          },
        ),
      ],
    );
  }
}
