import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:myenglish/model/model_materi.dart';

class PengertianTenses extends StatefulWidget {
  const PengertianTenses({Key? key}) : super(key: key);

  @override
  _PengertianTensesState createState() => _PengertianTensesState();
}

class _PengertianTensesState extends State<PengertianTenses> {
  Future<List<ModelMateri>> ReadJsonData() async {
    final jsonData = await rootBundle.rootBundle.loadString('');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelMateri.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff0e1446)),
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    margin: EdgeInsets.only(top: 120, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Materi Tenses",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                        Text('16 Tenses Dalam Bahasa Inggris',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  ),
                  child: Image.asset('assets/images/bgmye.png',
                  width: 330,), 
                ),
              )
              ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: Container(
            child: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data){
                if (data.hasError){
                  return Center(child: Text("${data.error}"),
                  );
                }
                else if(data.hasData){
                  var items = data.data as List<ModelMateri>;
                  return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (context.(context, index){
                      return Card(
                        shape: RoundedRectagBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),
                        elevation: 5,
                        margin: EdgeInsets.all(15),
                        child: Theme(data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                          title: Text(items[index].name.toString(),
                          style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold),
                          ),
                          Container((
                            padding: EdgeInsets.all(8),
                            child
                          )
                        )
                      )
                    }
                    ),
                  );
                }
              },
            ),)
          )
        ],
      )),
    );
  }
}
