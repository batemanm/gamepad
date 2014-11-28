$fn=100;

module button (){
  difference () {
    union () {
      cylinder(r=5.5,h=5);
      translate ([0,0,5]) {
        cylinder(r=5, h=0.2);
      }
      translate ([0,0,5.2]) {
        cylinder(r=4.8, h=0.2);
      }
      translate ([0,0,5.4]) {
        cylinder(r=4.6, h=0.2);
      }
    }

      translate ([0,0,18]) {  
        sphere (r=13);
      }
    }

  cylinder(r=7,h=1);
}


rotate ([0,0,45]) {
  translate ([-12.5,-12.5,0]){
    cube ([25,25,1]);
  }
}

translate ([-12.5,0,0]){
button ();
}
translate ([12.5,0,0]){
button ();
}

translate ([0,-12.5,0]){
button ();
}

translate ([0,12.5,0]){
button ();
}