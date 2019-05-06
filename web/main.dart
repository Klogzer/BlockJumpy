import 'dart:html';

void main() {
    final player = querySelector('#player');
    while(true){
        for(int i = 0; i <= 400; i++) player.style.left = i as String;
        for(int i = 400; i >= 0; i--) player.style.left = i as String;
    }
}
