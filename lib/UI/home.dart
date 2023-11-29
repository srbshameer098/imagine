import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imagine/Bloc/imagine_bloc.dart';
import 'package:imagine/Bloc/imagine_bloc.dart';

import '../Repository/ModelClass/ImagineModel.dart';



class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
late ImagineModel data;
TextEditingController message = TextEditingController();

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa653e8),
        leading: Icon(
          Icons.menu_outlined,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [


                Container(
                  height: 320.0,
                  width: 320.0,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(0),
                      color: Colors.white,
                      border: Border.all(
                          width: 3,
                          color: Colors.black
                      )
                  ),


                  child: BlocBuilder<ImagineBloc, ImagineState>(
                    builder: (context, state) {
                      if (state is ImagineblocLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is ImagineblocError) {
                        return Center(
                          child: Text("ERROR"),
                        );
                      }
                      if (state is ImagineblocLoaded) {
                        data = BlocProvider
                            .of<ImagineBloc>(context).imagineModel;
                        return Center(
                            child: Image.network(data.imageUrl.toString(), fit: BoxFit
                                .fill,));
                      } else {
                        return SizedBox();
                      }
                    }),

                ),


                Container(
                    margin: EdgeInsets.all(30),
                    child: TextField(controller: message,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Enter your Text"),
                    )),

                ElevatedButton(
                  child: Text('Generate', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffa653e8)
                  ),),
                  onPressed: () {

                    BlocProvider.of<ImagineBloc>(context).add(FetchImagine(message: message.text));
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
