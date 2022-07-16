import 'package:carousel_slider/carousel_slider.dart';
import 'package:djubli/detailScreen.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';

import 'package:flutter_echarts/flutter_echarts.dart';

final List<String> imgList = [
  'assets/innova_hitam.jpg',
  'assets/innova_putih.jpg',
  'assets/Innova_silver.jpg',
  'assets/innova_putih2.jpg',
  'assets/innova_abu_abu.jpg'
];

final List<String> teksList = ['Hitam', 'Putih', 'Silver', 'Putih', 'Abu-abu'];
late final List<Widget> imageSliders;

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  CarouselController cc = CarouselController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List<Map<String, dynamic>> _data1 = [
    {'Tahun': 0, 'Harga': 0, 'Tanggal': '', 'Warna': '', 'KM': 0, 'Lokasi': ''}
  ];

  getData1() async {
    await Future.delayed(const Duration(seconds: 1));

    const dataObj = [
      [
        2015,
        500,
        "31/1/2015",
        "Hitam",
        1250,
        "Surabaya",
        'assets/innova_hitam.jpg',
      ],
      [
        2016,
        400,
        "30/11/2016",
        "Putih",
        12300,
        "DKI Jakarta",
        'assets/innova_putih.jpg',
      ],
      [
        2017,
        335,
        "02/02/2017",
        "Silver",
        26250,
        "DKI Jakarta",
        'assets/Innova_silver.jpg',
      ],
      [
        2017,
        300,
        "20/04/2017",
        "Putih",
        23200,
        "Bandung",
        'assets/innova_putih2.jpg',
      ],
      [
        2018,
        200,
        "03/03/2018",
        "Abu-Abu",
        41513,
        "DKI Jakarta",
        'assets/innova_abu_abu.jpg',
      ],
    ];

    setState(() {
      _data1 = dataObj.cast<Map<String, dynamic>>();
    });

    imageSliders = imgList
        .map((
          item,
        ) =>
            Container(
              margin: const EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          int indexImg = imgList.indexOf(item);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => detailScreen(
                                data: dataObj[indexImg],
                              ),
                            ),
                          );
                        },
                        child:
                            Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                      ),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black,
                                ),
                                child: Text(
                                  '${dataObj[imgList.indexOf(item)][3]}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
            ))
        .toList();

    setState(() {
      imageSliders;
    });
  }

  @override
  void initState() {
    super.initState();

    getData1();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 147, 126, 0),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/djubli_logo_2.png",
                height: 90,
                width: 120,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0))),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          color: Colors.grey,
                          icon: const Icon(Icons.search),
                          tooltip: 'Open shopping cart',
                          onPressed: () {
                            // handle the press
                          },
                        ),
                        const Text(
                          "Cari Mobil",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Toyota Innova 2.5V AT",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 147, 126, 1)),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 147, 126, 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 16,
                    ),
                    onPressed: () {
                      // handle the press
                    },
                  ),
                ),
                const Text(
                  "2015",
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  height: 30,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 147, 126, 1),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    color: Colors.white,
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    ),
                    onPressed: () {
                      // handle the press
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
              child: SizedBox(
                width: 400,
                height: 285,
                child: Echarts(
                  option: '''
                          {
                            dataset: [
    {
      source: [
       [2015, 500, "31/1/2015", "Hitam", 1250, "Surabaya", ],
  [2016, 400, "30/11/2016", "Putih", 12300, "DKI Jakarta", ],
  [2017, 335, "02/02/2017", "Silver", 26250, "DKI Jakarta", ],
  [2017, 300, "20/04/2017", "Putih", 23200, "Bandung", ],
  [2018, 200, "03/03/2018", "Abu-Abu", 41513, "DKI Jakarta", ],
      ]
    },
      ],
  tooltip: {
    trigger: 'item',
    backgroundColor: '#000000',
    textStyle: {
        color: '#fff',
        fontSize: 8
      },
    formatter: function (param) {
      var value = param.value;
      // prettier-ignore
      return '<div style="border-bottom: 2px solid rgba(0,147,126,255); font-size: 12px;padding-bottom: 7px;margin-bottom: 7px">'
                + "Toyota Innova 2.5V AT tahun 2015" + ' '  + '：'
                
                + '</div>'
                + 'Harga Mobil' + '：' + value[1] + '.000.000' + '<br>'
                +  'Tanggal Transaksi' + '：' + value[2] + '<br>'
                + 'Warna' + '：' + value[3] + '<br>'
                + 'KM' + '：' + value[4] + '<br>'
                + 'Lokasi' + '：' + value[5] + '<br>';
    },
    position: function (pos, params, el, elRect, size) {
        let obj = {};
        obj[['left', 'right'][+(pos[0] < size.viewSize[0] / 4)]] = 60;
        obj[['top', 'bottom'][+(pos[1] < size.viewSize[1] / 2)]] = 20;
        return obj;
      },

  },
  legend: {
    top: 'bottom',
    right: 90,
    data: ['Harga Transaksi'],
    textStyle: {
      fontSize: 9
    }
  },
  xAxis: {
    type: 'value',
    name : 'Tahun',
     nameTextStyle: {
      fontSize: 12
    },
    min : 2014,
    splitLine: {show : true
      
    }
  },
  yAxis: {
    type: 'value',
    name : 'Harga (jutaan rupiah)',
     nameTextStyle: {
      fontSize: 12
    },
    splitLine: {show:true
    }
  },
grid: {
    left: '10%',
    containLabel: true,
    right: 80,
    top: '20%',
    bottom: '10%'
  },
    series: [
    {
      name: 'Harga Transaksi',
      type: 'scatter',
      itemStyle:  {opacity: 0.8,
  shadowBlur: 10,
  shadowOffsetX: 0,
  shadowOffsetY: 0,
  shadowColor: 'rgba(0,0,0,0.3)',},
      datasetIndex:0,
      symbolSize: function(value) {
        return value [1]/25;
      },
      color: {
          type: 'radial',
          x: 0.4,
          y: 0.3,
          r: 1,
          colorStops: [
            {
              offset: 1,
              color: 'rgba(0,147,126,255)'
            }
          ]
        }


    },
    
    
  ]
  }
                        ''',
                  extraScript: '''
                    chart.on('click', (params) => {
                      if(params.componentType === 'series') {
                        Messager.postMessage(JSON.stringify({
                          type: 'select',
                          payload: params.dataIndex,
                        }));
                      }
                   
                    
});

                  ''',
                  onMessage: (String message) {
                    Map<String, Object> messageAction = jsonDecode(message);
                    if (messageAction['type'] == 'select') {
                      final item = messageAction['payload'];
                      cc.animateToPage(int.parse(item.toString()),
                          duration: const Duration(seconds: 1));
                    }
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            CarouselSlider(
              carouselController: cc,
              options: CarouselOptions(
                autoPlay: false,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageSliders,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(imgList, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
