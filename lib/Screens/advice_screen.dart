import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/advice_bloc.dart';

class AdvicePage extends StatefulWidget {
  const AdvicePage({Key? key}) : super(key: key);

  @override
  State<AdvicePage> createState() => _AdvicePageState();
}

class _AdvicePageState extends State<AdvicePage> {
  @override
  void initState() {
    context.read<AdviceBloc>().add(AdviceLoadedEvent());
    super.initState();
  }

  void reloadedAdvice() {
    setState(() {
      context.read<AdviceBloc>().add(AdviceLoadedEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Pinkie.png"),
            fit: BoxFit.fill,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ///**Future Builder Use For Getting Data From APi */
            BlocBuilder<AdviceBloc, AdviceState>(
              builder: (context, state) {
                if (state is AdviceLoadingState) {
                  return const Center(
                      child: SpinKitDoubleBounce(
                    color: Colors.white,
                    size: 50.0,
                    // style: TextStyle(fontSize: 25),
                  ));
                } else if (state is AdviceLoadedState) {
                  return Expanded(
                    child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                      sigmaX: 6.0, sigmaY: 6.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(top: 250),
                                        alignment: Alignment.center,
                                        width: 500.0,
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                          color: Colors.white.withOpacity(0.10),
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: RichText(
                                              text: TextSpan(
                                                text: state
                                                    .adviceModel.slip!.advice,
                                                style:
                                                    GoogleFonts.akayaTelivigala(
                                                        textStyle:
                                                            const TextStyle(
                                                                fontSize: 22)),
                                                children: [
                                                  TextSpan(
                                                      text: state
                                                          .adviceModel.slip!.id
                                                          .toString())
                                                ],
                                              ),

                                              // child: SelectableText(
                                              //
                                              //   style: GoogleFonts.akayaTelivigala(
                                              //     textStyle: const TextStyle(
                                              //       fontSize: 22.0,
                                              //       color:
                                              //           Color.fromARGB(255, 36, 35, 35),
                                              //     ),
                                              //   ),
                                              // ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: reloadedAdvice,
                                          child: ClipRect(
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                  sigmaX: 6.0, sigmaY: 6.0),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          40.0),
                                                  color: Colors.white
                                                      .withOpacity(0.10),
                                                ),
                                                child: const Icon(
                                                    Icons.refresh_rounded),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is AdviceErrorState) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
