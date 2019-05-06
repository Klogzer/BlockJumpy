import 'dart:html';

void main() {
    final player = querySelector('#player');
    while(true){
        for(int i = 0; i <= 400; i++){
            querySelector('#player').style.left = i as String;
            sleep(const Duration(milliseconds:1));
        }
        for(int i = 400; i >= 0; i--){
            querySelector('#player').style.left = i as String;
            sleep(const Duration(milliseconds:1));
        } 
    }
}
