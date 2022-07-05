import 'package:flutter/material.dart';
import 'package:netflx_ui/assets.dart';
import 'package:netflx_ui/widgets/responsive.dart';

class CusrtomAppbar extends StatelessWidget {
  const CusrtomAppbar({Key? key, this.scroll0ffset = 0.0}) : super(key: key);
  final double scroll0ffset;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
        color: Colors.black
            .withOpacity((scroll0ffset / 350).clamp(0, 1).toDouble()),
        child: const Responsive(
          mobile: const _CustomAppBarMobile(),
          desktop: _CustomAppBarDesktop(),
        ));
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'Tv Shows',
                  onTap: () => print('Tv Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'Homes',
                  onTap: () => print('Homes'),
                ),
                _AppBarButton(
                  title: 'Tv Shows',
                  onTap: () => print('Tv Shows'),
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                ),
                _AppBarButton(
                  title: 'Latest',
                  onTap: () => print('Latest'),
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Search'),
                    icon: const Icon(Icons.search)),
                _AppBarButton(
                  title: 'KIDS',
                  onTap: () => print('KIDS'),
                ),
                _AppBarButton(
                  title: 'DVD',
                  onTap: () => print('DVD'),
                ),
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Gift'),
                    icon: const Icon(Icons.card_giftcard)),
                IconButton(
                    padding: EdgeInsets.zero,
                    iconSize: 28.0,
                    color: Colors.white,
                    onPressed: () => print('Notification'),
                    icon: const Icon(Icons.notifications)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppBarButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w600),
      ),
    );
  }
}
