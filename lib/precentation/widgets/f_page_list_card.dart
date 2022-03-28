
import 'package:flutter/material.dart';

class FPageListCard extends StatelessWidget {
  String? carName, firstDiscriptName, secondDiscriptName, thirdDiscriptName, fourthDiscriptName,
      firstDiscriptValue, secondDiscriptValue, thirdDiscriptValue, fourthDiscriptValue;
  IconData? firstDiscriptIcon, secondDiscriptIcon, thirdDiscriptIcon, fourthDiscriptIcon;
  void Function()? onTap;

  FPageListCard({Key? key, this.carName,
    this.firstDiscriptIcon, this.firstDiscriptName, this.firstDiscriptValue,
    this.secondDiscriptIcon, this.secondDiscriptName, this.secondDiscriptValue,
    this.thirdDiscriptIcon, this.thirdDiscriptName, this.thirdDiscriptValue,
    this.fourthDiscriptIcon, this.fourthDiscriptName, this.fourthDiscriptValue, this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    Icon(Icons.directions_car, size: 50, color: Color(0xffd6d6d6),),
                    SizedBox(height: 15,),
                    Text( carName!, style: TextStyle(
                        color: Colors.black, fontSize: 10, fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
              ),
              const SizedBox(height: 100, child: VerticalDivider(color: Color(0xffd6d6d6), thickness: 1.5,)),
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      nestedRowInListCar(
                          firstDiscriptIcon,
                          firstDiscriptName,
                        firstDiscriptValue
                      ),
                      nestedRowInListCar(
                          secondDiscriptIcon,
                        secondDiscriptName,
                        secondDiscriptValue
                      ),
                      nestedRowInListCar(
                          thirdDiscriptIcon,
                        thirdDiscriptName,
                        thirdDiscriptValue
                      ),
                      nestedRowInListCar(
                         fourthDiscriptIcon,
                        fourthDiscriptName,
                        fourthDiscriptValue
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Row nestedRowInListCar(IconData? icon, String? fTitle, fTitleValue){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Icon(icon, color:  const Color(0xffb71c1c),),
          Text(fTitle!, style: const TextStyle(color: Colors.black, fontSize: 12),)
        ],
      ),
      Text(fTitleValue, style: const TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),),
      const SizedBox(width: 10,)
    ],
  );
}
// Row detailsRowInListCar(String? firstValue, secondValue, thirdValue, fourthValue){
//   return Row(
//     children: [
//       Column(
//         children: [
//           Row(
//             children:  const [
//               Icon(Icons.directions_car, color: Color(0xffb71c1c)),
//               Text("Transmission", style: TextStyle(color: Colors.black, fontSize: 12),)
//             ],
//           ),
//           Row(
//             children:  const [
//               Icon(Icons.data_usage, color: Color(0xffb71c1c)),
//               Text("Wheel Type", style: TextStyle(color: Colors.black, fontSize: 12),)
//             ],
//           ),
//           Row(
//             children:  const [
//               Icon(Icons.electric_car_rounded, color: Color(0xffb71c1c)),
//               Text("Suspension", style: TextStyle(color: Colors.black, fontSize: 12),)
//             ],
//           ),
//           Row(
//             children:  const [
//               Icon(Icons.highlight, color: Color(0xffb71c1c)),
//               Text("Haed Light", style: TextStyle(color: Colors.black, fontSize: 12),)
//             ],
//           ),
//         ],
//       ),
//       Column(
//         children: [
//           Text(firstValue!, style: const TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),),
//           Text(secondValue!, style: const TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),),
//           Text(thirdValue!, style: const TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),),
//           Text(fourthValue!, style: const TextStyle(color: Colors.black,fontSize: 12, fontWeight: FontWeight.bold),),
//         ],
//       )
//     ],
//   );
// }


// Icons.directions_car_sharp,
// "Transmission",
// "Test.07453"

