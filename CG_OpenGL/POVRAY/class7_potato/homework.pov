#include "colors.inc"    

global_settings {
    assumed_gamma 1.0
    max_trace_level 20
}
 
camera{
 location<-0.5,10,-9>
 look_at<0,2.7,0>   
}

light_source{
 <-5,20,-8>
 White * 0.7
} 

light_source{
 <0,15,-8>
 White * 0.2
} 

light_source{
 <5,15,-8>
 White * 0.1
} 

light_source{
 <0,10, 8>
 White * 0.2
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
        phong 0.1
        reflection {
        0.0, 1.0
        fresnel on
      }
        specular 0.5         // Shininess
        roughness 0.01      // Very smooth surface 
        conserve_energy 
        diffuse 0.6
      } 
      normal {bumps 0.2 scale 0.7}
    }  
    interior {
        ior 1.7              // Index of refraction for glass       
        fade_distance 3
        fade_power 1.2
    }
}

#declare GlassMaterialTopJar = 
material{
    texture {
      pigment { rgbf <230, 238, 228, 150>/255 }  // High transparency
      finish {
        phong 0.2
        reflection {
        0.0, 1.0
        fresnel on
      }
        specular 1.0         // Shininess
        roughness 0.01      // Very smooth surface 
        //conserve_energy 
        diffuse 0.9
      } 
      normal {bumps 0.2 scale 0.7}
    }  
    interior {
        ior 1.1              // Index of refraction for glass       
        fade_distance 2
        fade_power 100
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
            image_map{
                png "Teacup.png"  
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
                <0,0.5,0>, <0,4.6,0>, 2.1
                 material{CeramicMaterial}
            }
            intersection{
                torus{1.1, 1
                translate<0,0.5,0>
                }
                cylinder{<0,0.5,0>, <0,1.5,0>, 2.1}
                cylinder{<0,0.0,0>, <0,-1.0,0>, 2.1}

                material{CeramicMaterial}
            }
            intersection{
                
                torus { 
                        1.9,sqrt(2)/5
                    material{CeramicYellowMaterial}    
                    translate<0,4.4,0>
                }
                torus { 
                        2.0,0.1
                    material{CeramicWhiteMaterial}    
                    translate<0,4.6,0>
                }
                cylinder{
                    <0,4.6,0>, <0,6,0>, 2.1
                }
                
            }
            
            sphere_sweep{
                b_spline
                7,
                <.7,2.2,0> ,.8
                <1.5,.5,-0.1>, .2
                <2.5,1.5,-0.2>, .2
                <4,3.5,-0.3>, .2
                <2.8,5,-0.3>, .2
                <1.5,4.1,-0.2>, .2 
                <.7,2.6,-0.1>, .8
                material{CeramicMaterial2}
                scale <1,1,2>
            }
            
        }//end union
        cylinder{
            <0,.2,0>, <0,4.9,0>, 1.9
            material{CeramicWhiteMaterial}
        } 
        //finish {phong 0.7 reflection 0.3} 
    }//end difference    
}


//tea
#declare LiquidLevel = 3.6;
declare Tea = object{

    union {
        difference {
            // Tea body inside the cup
            cylinder {<0,0.5,0>, <0,LiquidLevel,0>, 1.79999}
            cylinder {<0,LiquidLevel-0.2,0>,<0,LiquidLevel+0.3,0>,1.7}
            torus {1.7, 0.2 translate y*LiquidLevel}
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
#declare c = .20;
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
                open
                material { GlassMaterialTopJar }
            }
            cylinder{ 
                <2,4.3,2>,<2,4.5,2>,1.8
                open
                material { GlassMaterialTopJar }
            }
            cylinder{ 
                <2,4.6,2>,<2,4.8,2>,1.8
                open
                material { GlassMaterialTopJar }
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
            [0.2 color rgb<229, 40, 0>/255]  
            [1 color Red]
        } 
        scale 2
        translate<-1,0,0>
    }
    finish{
        ambient .025
        phong 0.8    
    }  

}


object {
    union{
        object{Jar}  
        object { Tomato scale<1.3,1,1> rotate<0,-40,30> translate <3.25, .25, 1.05>} 
        object { Tomato scale<1.5,1.2,1> rotate<0,-80,0> translate <1.75, .5, 1.55> } 
    }
     
    scale 0.8
    translate <-4, 0, -2> 
}  


object {
    TeaCup   
    translate<2.1,0,0> 
    rotate<0,0,0>
} 
           
