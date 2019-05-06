class Hitbox {

   bool active;

   Hitbox(bool active) {

   }

   bool overlap(Hitbox element) {

   }

   bool getActive() {

     return active;

   }

   void activate() {

     active = true;

   }

   void deactivate() {

     active = false;

   }

}