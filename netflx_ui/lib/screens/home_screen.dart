import 'package:flutter/material.dart';
import 'package:netflx_ui/cubit/app_bar/app_bar_cubits.dart';
import 'package:netflx_ui/data/data.dart';
import 'package:netflx_ui/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;


  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.read<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.grey[850],
        child: const Icon(Icons.cast),
        onPressed: () => print('cast'),
      ),
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50.0),
        child: BlocBuilder<AppBarCubit,double>(
          builder: (context , scrollOffset) {
            return CusrtomAppbar(scroll0ffset: scrollOffset);
          }
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
              child: ContentHeader(
            feturedContent: sintelContent,
          )),
          SliverPadding(padding: const EdgeInsets.only(top: 20.0),
          sliver: SliverToBoxAdapter(
            child: Previews(
              key: const PageStorageKey('previews'),
              title: 'Previews', contenList: previews,
            ),
          ),),
          SliverToBoxAdapter(
            child: ContentList (
              key: const PageStorageKey('myList'),
              title : 'My List',contentlist: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList (
              key: const PageStorageKey('originals'),
              title : 'Netflix Originals',
              contentlist : originals,
              isOriginal : true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(bottom: 20.0),
            sliver: SliverToBoxAdapter(
              child: ContentList (
                key: const PageStorageKey('trending'),
                title : 'Trending',
                contentlist : trending,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
