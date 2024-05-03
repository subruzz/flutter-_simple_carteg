import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cart_eg/data/features/home/ui/cart_page.dart';
import 'package:flutter_bloc_cart_eg/data/features/home/ui/wish_page.dart';
import 'package:flutter_bloc_cart_eg/data/features/home/bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        // BlocProvider(create: (context) => ,)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Cart Bloc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeCartNavState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
        } else if (state is HomeWishNavState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WishPage(),
              ));
        }
      },
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is HomeSuccessState) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomecartListNavigate());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined)),
                IconButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(HomeWishNavigate());
                    },
                    icon: const Icon(Icons.favorite_outline_outlined))
              ],
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text(widget.title),
            ),
            body: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: state.models.length,
              itemBuilder: (context, index) {
                print(state.models.length);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      image: DecorationImage(
                          image: NetworkImage(state.models[index].imageUrl),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Text(state.models[index].name),
                            Text(state.models[index].price.toString()),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                                onPressed: () {
                                  state.models[index].isWished = true;
                                  context.read<HomeBloc>().add(
                                      HomecartListClicked(
                                          model: state.models[index]));
                                },
                                icon:  Icon(
                                  Icons.shopping_bag_outlined,
                                  color: state.models[index].isWished
                                      ? Colors.red
                                      : Colors.grey,
                                )),
                            IconButton(
                                onPressed: () {
                                  context.read<HomeBloc>().add(
                                      HomeWishListClicked(
                                          model: state.models[index]));
                                },
                                icon:
                                    const Icon(Icons.favorite_outline_outlined))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
