import 'package:flutter/material.dart';
import 'package:marvels/app/list/domain/entities/m_characters.dart';

class CardCharacter extends StatefulWidget {
  const CardCharacter({
    required this.character,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  final MarverCharacter character;
  final Function(MarverCharacter character) onPress;

  @override
  State<CardCharacter> createState() => _CardCharacterState();
}

class _CardCharacterState extends State<CardCharacter> {
  bool _animate = false;

  static bool _isStart = true;

  @override
  void initState() {
    super.initState();
    if (_isStart) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _animate = true;
          _isStart = false;
        });
      });
    } else {
      _animate = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    String img = widget.character.thumbnail.path;
    img = "$img.${widget.character.thumbnail.extension}";

    final labelStyle = Theme.of(context).textTheme.labelMedium;
    return InkWell(
      onTap: () => widget.onPress(widget.character),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Column(
          children: [
            Hero(
              tag: widget.character.id,
              child: Stack(
                children: [
                  SizedBox.fromSize(
                    size: Size.fromRadius(
                      MediaQuery.of(context).size.width * 0.23,
                    ),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 9,
                    child: AnimatedOpacity(
                      opacity: _animate ? 1 : 0,
                      curve: Curves.easeInOutQuart,
                      duration: const Duration(milliseconds: 500),
                      child: Text(
                        widget.character.name,
                        style: labelStyle!.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
