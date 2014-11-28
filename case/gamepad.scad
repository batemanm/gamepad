use <roundCornersCube.scad>
$fn=360;
module screwHole(){
    translate ([0,0,-0.5]){
//    union (){
    difference () {
      cylinder (r=4.5,h=12);
      translate ([0,0,1]){
        cylinder (r=1.5, h=12.5);
      }
    }
//}
}
}

length = 125;
width = 64;
height = 15;

difference (){
union (){
    translate ([0,0,(height/2) - 5]){
      difference(){
        roundCornersCube (length,width,height,10);
        translate ([0,0,1]){
          roundCornersCube (length-4,width-4,height,8);
        }
        // power switch
        translate ([-(length/2)+15,(width/2)-3,2.5]){
          cube ([10,5,5]);
        }
      }
  }

translate ([-(length/2)+10,(width/2)-8,-5]){
  cube ([20,5,height-6.5]);
}

translate ([-(length/2)+28,(width/2)-8,3.5]){
  cube ([2,5,6.5]);
}

translate ([-(length/2)+10,(width/2)-8,3.5]){
  cube ([2,5,6.5]);
}


// case hole left
  translate ([-((length/2)-6),5,-4]) {
    screwHole ();
  }

  
// case hole right
  translate ([((length/2)-6),5,-4]) {
    screwHole ();
  }


// left stick top right
  translate ([-((length/2)-(9+18)),-((width/2)-(13+15)),-4]) {
    screwHole ();
  }


// left stick bottom right
  translate ([-((length/2)-(9+18)),-((width/2)-(13)),-4]) {
    screwHole ();
  }

// left stick bottom left
  translate ([-((length/2)-9),-((width/2)-13),-4]) {
    screwHole ();
  }


// right side
// right stick bottom right 
  translate ([((length/2)-12),-((width/2)-9),-4]) {
    screwHole ();
  }

// right stick top right 
  translate ([((length/2)-(12+25.5)),-((width/2)-(9+28)),-4]) {
    screwHole ();
  }



// start select
// right 
  translate ([((31/2)),-(32-(7)),-4]) {
    screwHole ();
  }

// left 
  translate ([(-(31/2)),-(32-(7)),-4]) {
    screwHole ();
  }


  translate ([((length/2)-(12+25.5))-55, ((width/2) - (2+27+2)),-4]){
    cube ([5,2,10]);
    cube ([2,5,10]);

  }
}

  translate ([-((length/2)-6),5,-5]) {
	cylinder (r=3.5,h=10);
  }
  translate ([((length/2)-6),5,-5]) {
	cylinder (r=3.5,h=10);
  }

}