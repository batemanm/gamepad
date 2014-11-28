use <roundCornersCube.scad>
$fn=100;
module screwHole(){
    translate ([0,0,-0.5]){
//    union (){
    difference () {
      cylinder (r=5.5,h=10);
      translate ([0,0,1]){
        cylinder (r=1.5, h=9.5);
      }

    }
//}
}
}

module optionButton (){
  translate ([12.5,0,0]) {
  cylinder (r=13.5/2, h = 50);
  }
  translate ([-12.5,0,0]) {
  cylinder (r=13.5/2, h = 50);
  }
  translate ([0,12.5,0]) {
  cylinder (r=13.5/2, h = 50);
  }
  translate ([0,-12.5,0]) {
  cylinder (r=13.5/2, h = 50);
  }
}

length = 125;
width = 64;
height = 8;

difference (){
union (){
    translate ([0,0,(height/2) - 5]){
      difference(){
        roundCornersCube (length,width,height,10);
        translate ([0,0,1]){
          roundCornersCube (length-4,width-4,height,8);
        }

// pad
		translate ([-((length/2)-8), ((width/2) - (23.5)), -10]) {
		cube([21, 8,50]);

      }
		translate ([-((length/2)-(8 + ((21-8)/2))), ((width/2) - (30)), -10]) {
		  cube([8, 21,50]);
		}

// start select
		translate ([-8.5,(width/2) - 7,-10]) {
			roundCornersCube (10.5,6,50,2);
		}
		translate ([8.5,(width/2) - 7,-10]) {
			roundCornersCube (10.5,6,50,2);
		}

// option buttons
		translate ([(length/2)-25, (width/2)-23, -10]){
			optionButton();
      }

      }
  }


// case hole left
difference () {
  translate ([-((length/2)-6),-5,-4]) {
    screwHole ();
  }
//translate ([-(length/2)-8, -9,1]){
//cube([10,10,10]);
//}

}

// case hole right
difference () {
  translate ([((length/2)-6),-5,-4]) {
    screwHole ();
  }
//translate ([(length/2)-2, -9,1]){
//cube([10,10,10]);
//}

}


//  translate ([((length/2)-(12+25.5))-55, ((width/2) - (2+27+2)),-4]){
//    cube ([5,2,10]);
//    cube ([2,5,10]);
//  }
}

}


