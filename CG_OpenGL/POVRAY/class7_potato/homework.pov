#include "colors.inc"    
 
camera{
 location<0,10,-10>
 look_at<0,2,0>   
}

light_source{
 <-5,15,-8>
 White
    
} 


background{
  Grey
} 

sky_sphere{
 pigment{
    gradient y
    color_map{   
        [0 color White]
        [1 color Blue]
    } 
    scale 2
    translate<0,-1,0>
 }
}
//floor
plane{
    <0, 0, 1>, 0
    pigment{    
            image_map{
                jpeg "grey_velvet.jpg"  
                map_type 0
            } 
        scale <20, 20, 1> 
        translate<-30,0,0>
    }
    rotate<90,0,0> 
    finish{ambient .4}
} 

//wall
plane{
    <0, 0, 1>, 5
    pigment{White}  
    normal {bumps 0.1 scale .3}
    
}


#declare GlassMaterial = 
material{
    texture {
      pigment { rgbf <230, 238, 228, 240>/255 }  // High transparency
      finish {
        phong 0.5
        reflection 0.01       // Slight reflection
        specular 0.9         // Shininess
        roughness 0.01      // Very smooth surface 
        conserve_energy 
        diffuse 0.9
      } 
      normal {bumps 0.2 scale .7}
    }  
    interior {
        ior 1.3              // Index of refraction for glass       
        fade_distance 10
        fade_power 2
    }
}



 
#declare CeramicMaterial = 
material {
    texture {
        pigment{    
            image_map{
                jpeg "blue.jpg"  
                map_type 2
            }
            scale 10
        }                     
        finish {  

            phong 0.9       // Slight glossiness for ceramic shine
            reflection 0.1  // Low reflection for a matte look, adjust as needed
            diffuse 0.9     // Strong diffuse for a solid color look
        }
    }
}
 
#declare CeramicWhiteMaterial = 
material {
    texture {
        pigment{    
            color rgb<1, 0.9, 0.8>
        }                     
        finish {  
            phong 0.9       // Slight glossiness for ceramic shine
            reflection 0.1  // Low reflection for a matte look, adjust as needed
            diffuse 0.9     // Strong diffuse for a solid color look
        }
    }
}

#declare CeramicMaterial2 = 
material {
    texture {
        pigment{    
            image_map{
                jpeg "light_blue.jpg"  
                map_type 0
            }
            scale 8
        }                     
        finish {  

            phong 0.9       // Slight glossiness for ceramic shine
            reflection 0.1  // Low reflection for a matte look, adjust as needed
            diffuse 0.9     // Strong diffuse for a solid color look
        }
    }
}
#declare CeramicYellowMaterial = 
material {
    texture {
        pigment{    
            color rgb<259, 180, 0>/255
        }                     
        finish {  
            phong 0.9       // Slight glossiness for ceramic shine
            reflection 0.1  // Low reflection for a matte look, adjust as needed
            diffuse 0.9     // Strong diffuse for a solid color look
        }
    }
}

#declare Cup = object{
    difference{
        union{
            cylinder {
                <0,0,0>, <0,4.6,0>, 2 
                 material{CeramicMaterial}
            }
            torus { 
                    1.9,.1 
                 material{CeramicYellowMaterial}    
                 translate<0,4.6,0>
            }
            
            sphere_sweep{
                b_spline
                7,
                <.7,2.2,0> ,.8
                <1.5,.5,0>, .2
                <2.5,1.5,0>, .2
                <4,3.5,0>, .2
                <2.8,5,0>, .2
                <1.5,4.1,0>, .2 
                <.7,2.6,0>, .8
                material{CeramicMaterial2}
                scale <1,1,2>
            }
            
        }//end union
        cylinder{
            <0,.2,0>, <0,4.9,0>, 1.8
            material{CeramicWhiteMaterial}
        } 
        finish {phong 0.7 reflection 0.3} 
    }//end difference    
}


//tea
#declare LiquidLevel = 3.7;
declare Tea = object{
    union {
        difference {
            // Tea body inside the cup
            cylinder {<0,0.5,0>, <0,LiquidLevel,0>, 1.8}
            torus {1.5, 0.2 translate y*LiquidLevel}
            cylinder {<0,LiquidLevel-0.2,0>,<0,LiquidLevel+0.3,0>,1.5}
            pigment {Orange*0.8 filter 0.6}
            finish {phong 0.7 reflection 0.15}
            normal {bumps 0.05 scale 1}
        }
    } 
}

#declare TeaCup = object{   
    union{
        object{Cup}
        object{Tea}  
    }
}
 

//Points for glass jar 
#declare c = .25;
#declare jarWidth = 4;
#declare p1 = <c, c, c>;
#declare p2 = <jarWidth - c, c, c>;
#declare p3 = <jarWidth - c, c, jarWidth - c>;
#declare p4 = <c, c, jarWidth - c>;

#declare p5 = <c, jarWidth - c, c>;
#declare p6 = <jarWidth - c, jarWidth - c, c>;
#declare p7 = <jarWidth - c, jarWidth - c, jarWidth - c>;
#declare p8 = <c, jarWidth - c, jarWidth - c>;

#declare RoundEdges = object{   
    union{
        //horizontal cylinders
        cylinder{
            p1,p5,c
            material { GlassMaterial }
        }
        cylinder{
            p2,p6,c
            material { GlassMaterial }
        } 
        cylinder{
            p3,p7,c
            material { GlassMaterial }
        }
        cylinder{
            p4,p8,c
            material { GlassMaterial }
        } 
        
        //vertical botton cylinders
        cylinder{
            p1,p2,c
            material { GlassMaterial }
        }        
        cylinder{
            p2,p3,c
            material { GlassMaterial }
        }
        cylinder{
            p3,p4,c
            material { GlassMaterial }
        }
        cylinder{
            p1,p4,c
            material { GlassMaterial }
        }
        
        //vertical upper cylinders
        cylinder{
            p5,p6,c
            material { GlassMaterial }
        }        
        cylinder{
            p6,p7,c
            material { GlassMaterial }
        }
        cylinder{
            p7,p8,c
            material { GlassMaterial }
        }
        cylinder{
            p5,p8,c
            material { GlassMaterial }
        } 

        //sphere edge
        sphere{
            p1,c
            material { GlassMaterial }
        } 
        sphere{
            p2,c
            material { GlassMaterial }
        }
        sphere{
            p3,c
            material { GlassMaterial }
        }
        sphere{
            p4,c
            material { GlassMaterial }
        }
        sphere{
            p5,c
            material { GlassMaterial }
        }
        sphere{
            p6,c
            material { GlassMaterial }
        }
        sphere{
            p7,c
            material { GlassMaterial }
        }
        sphere{
            p8,c
            material { GlassMaterial }
        }
    }
}
      
#declare HollowBox = object{
    difference{
        union{
            object{RoundEdges}  
            box {
                <c, c, c>, <jarWidth - c, jarWidth - c, jarWidth - c>
                material { GlassMaterial }
            }
        } 
        box {
                <2*c, 2*c, 2*c>, <jarWidth - 2*c, jarWidth - 2*c, jarWidth - 2*c>
                material { GlassMaterial }
        }         
    }
} 
      
//glass jar

#declare Jar = object {
    difference {
        union{
            cylinder{ 
                <2,4,2>,<2,5,2>,1.7
                material { GlassMaterial }
            }
            cylinder{ 
                <2,4.3,2>,<2,4.5,2>,1.8
                material { GlassMaterial }
            }
            cylinder{ 
                <2,4.6,2>,<2,4.8,2>,1.8
                material { GlassMaterial }
            }
            object{HollowBox}
        }
        union{  
            cylinder{ 
                <2,3.8,2>,<2,6,2>,1.5
                material { GlassMaterial }
            } 
        }
    }
} 

 
//tomato 
#declare Tomato = 
sphere{ 
    <0,1,0>, .7
    pigment{
        gradient x
        color_map{   
            [0 color Yellow] 
            [0.3 color rgb<229, 40, 0>/255]  
            [1 color Red]
        } 
        scale 2
        translate<-1,0,0>
    }
    finish{
        ambient .1
        phong 0.9    
    }  

}


object {
    union{
        object{Jar}  
        object { Tomato scale<1.3,1,1> rotate<0,-30,0> translate <3, .5, 1.3>} 
        object { Tomato scale<1.5,1.2,1> rotate<0,-80,0> translate <1.5, .5, 1.5> } 
    }
     
    scale 0.8
    translate <-4, 0, -2> 
}  


object {
    TeaCup   
    translate<2,0,0> 
    rotate<0,0,0>
} 
           
