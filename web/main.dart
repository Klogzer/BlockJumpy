import 'dart:html';
import 'dart:async';

void main() {
  var height = 50;
  querySelector("#overwrittenByDart").text = "'Hello World' from Dart, this is Marius";
  DivElement div = document.querySelector('#box');
  div.style.position="relative";
  const twentymil = const Duration(milliseconds:20);
  new Timer.periodic(twentymil, (Timer t) {
    if(height >200){
      height = height -5;
    }
    if(height <200){
      height = height +5;
    }


    div.style.top = div.style.top = "${height}px";
  });


}

