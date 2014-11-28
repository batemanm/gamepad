use <roundCornersCube.scad>
$fn=100;
module button (){
  roundCornersCube (9.5,4.5,4.8,2);
  translate ([0,0,2.5]) {
    roundCornersCube (9,4,0.2,2);
  }
  translate ([0,0,2.7]) {
    roundCornersCube (8.5,3.5,0.2,2);
  }

  translate ([0,0,2.9]) {
    roundCornersCube (8,3,0.2,2);
  }

//  translate ([0,0,4.6]) {
//    roundCornersCube (9.5,4.5,0.2,2);
//  }
}

roundCornersCube (28,5.5,1,2);

translate ([8.5,0,2]){
button ();
}
translate ([-8.5,0,2]){
button ();
}