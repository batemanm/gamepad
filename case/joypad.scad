cylinder (r=14.5,h=1);

module button () {
  translate ([-10, -(7/2), 0]) {
    cube([20,7,6]);
    translate ([0.5,0,6]) {
      cube([19,7,0.2]);
    }
    translate ([1,0,6.2]) {
      cube([18,7,0.2]);
    }
    translate ([1.5,0,6.4]) {
      cube([17,7,0.2]);
    }

  }
}

button ();

rotate ([0,0,90]){
  button ();
}
