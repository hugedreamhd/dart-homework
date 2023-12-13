import 'dart:ffi';
import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];

void main(){


  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  print(transactions.map((e) => e.trader.city).toSet().toList());

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오

  print(transactions
      .where((e) => e.trader.city == "Cambridge")//city 이름으로 찾는다
      .map((e) => e.trader.name)//map으로 name을 뽑아낸다
      .toList()//리스트 형태로 변경
    ..sort((a, b) => a.compareTo(b)));//이름 순으로 나열

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오

  print(transactions.map((e) => e.trader.name).toList()
    ..sort((a, b) => a.compareTo(b)));

  // 5. 밀라노에 거래자가 있는가?

  print(transactions.any((e) => e.trader.city == "Milano"));

  //6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오

  transactions.where((e) => e.trader.city == "Cambridge").forEach((e) {
    print('Trader: ${e.trader.name}, year: ${e.year}, value: ${e.value}');
  });

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?(value를 말하는건가?)

  final maxValue = transactions.map((e) => e.value).toList();
  print(maxValue.reduce((value, element) => max(value, element)));
  //왜 where는 안되고 map은 되징?

//8. 전체 트랜잭션 중 최대값은 얼마인가?(value를 말하는건가?)
  final minValue = transactions.map((e) => e.value).toList();
  print(minValue.reduce((value, element) => min(value, element)));
}