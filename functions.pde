public void results_list(File statueSize, File[] statueList, float scrollNum){

  
 if( rankLoaded ==  false ){
 
  
  for (int i = 0; i < statueSize.list().length; i++) {
  
  
    String scoreaccess = statue_paths.get(i)+"\\score.json";
      JSONObject j = loadJSONObject(scoreaccess);
      //int score = j.getInt("scoreone") + (j.getInt("scoretwo")*2) + (j.getInt("scorethree")*3) + (j.getInt("scorefour")*4) + (j.getInt("scorefive")*5);
      ///new
      int score = -(j.getInt("scoreone")*2) - (j.getInt("scoretwo")) + (j.getInt("scorefour")) + (j.getInt("scorefive")*2);
      
      
      //new
   int[] list = {i,score};
   append(list,i);
     append(list,score);
   
   rankingList[i] = list;
   

  }

  

  
    for (int d = 0; d < rankingList.length ; d++) {
  
  for (int i = 0; i < rankingList.length - 1; i++) {
    
  
  
  if(rankingList[i][1] <  rankingList[i + 1][1])
{
int[] x = rankingList[i];
int[] y= rankingList[i + 1];

rankingList[i] = y;
rankingList[i + 1] = x;
}

  
  };
    }
    
    votedStatues = 10;
    
for (int d = 0; d < votedStatues ; d++) {


 String target =  statue_image_paths.get(d);          

int index = target.lastIndexOf('\\');
int index2 = target.lastIndexOf('_');

String target2 = statue_image_paths.get(d).substring(index+1,index2);

    println(rankingList[3][0]);
    println( statue_list[rankingList[3][0]].getName());


}
   
    


 rankLoaded = true;
    
}

  //for (int i = 0; i < rankingList.length; i++) {
    
  //   // println(rankingList[5][0]);
    
  //  float calculate = (height/2.27 - scrollNum ) + (height/16.0)*i;
  //       String statue_name = statue_list[rankingList[i][0]].getName();
  //  String[] statue_name2 = match(statue_name, "^[^_]*_(.*)$");

  //if(calculate > height/2.29  && calculate < height - height/16.0 ){
    
  //  ///new
  //  if(getWidth(statue_name2[1],font) > width/10.0){
    
    
  //  }
    
  //  ///new
    
    
  //  text((i+1)+". "+statue_name2[1] +"  "+rankingList[i][1], width/2.0, calculate);
 
  //}

  

  //  };




}



boolean is_movie_finished(Movie m) {
  return m.duration() - m.time() < 0.05;
}

public void makeTriangle(float a, float b, String orientation){

if(orientation == "up"){
beginShape();

vertex(a -width/280.0, b +width/280.0);
vertex(a +width/280.0, b + width/280.0);
vertex(a , b - width/280.0);
endShape();
}
if(orientation == "down"){

beginShape();

vertex(a -width/280.0, b -width/280.0);
vertex(a +width/280.0, b - width/280.0);
vertex(a , b + width/280.0);
endShape();
}
if(orientation == "left"){

beginShape();

vertex(a -width/280.0, b);
vertex(a +width/280.0, b - width/280.0);
vertex(a +width/280.0, b + width/280.0);
endShape();
}
if(orientation == "right"){

beginShape();
vertex(a +width/280.0, b);
vertex(a -width/280.0, b + width/280.0);
vertex(a -width/280.0, b - width/280.0);
endShape();
}
}

void movieEvent(Movie m) {
  m.read();
};



//new
public void artlist(StringList list, float scrollNum) {
  

  
  float limit =  (width/2.0 - ((width/34)/2.0)) - width/34.0;
textAlign(CENTER,CENTER);

float offset_sides2 =   (( width/2.0 - ((width/34)/2.0)) + width/34.0)/2.0;



rectMode(CORNERS);
 


 // rect(width/34.0,height/2.37,  width/2.0 - ((width/34)/2.0), height - height/16.0);
   //rect( width/2.0 + ((width/34)/2.0),height/2.37,width - width/34.0,height - height/16.0);
  


  int count = 0;
  int count2 = 0;
    boolean bigSentence = false;
    boolean SentenceLeft = false;
   for (int i = 0; i < list.size(); i++) {
     
    
     if((i + 1+count2)% 2 == 1){
           
    count = count + 1;
     }
    float calculate = (height/2.27 - scrollNum ) + (height/16.0)*count ;
  
         String statue_name = list.get(i);
    String statue_name2 = statue_name.substring(statue_name.lastIndexOf("_")+1,statue_name.lastIndexOf("."));

  if(calculate > height/2.29  && calculate < height - height/16.0 ){
    
    if( getWidth(statue_name2,font) > limit ){


if(bigSentence == false){
        if((i+1+count2)%2 == 0){
          SentenceLeft = true;
         
               // println(statue_name2+" left");
   // println("here");
          count = count +1;
         // count2 = count2 + 2;
          calculate = (height/2.27 - scrollNum ) + (height/16.0)*count ;
        }
}

    
        
         
         
       
         
      
         
         //  text(statue_name2,  width/2.0 ,calculate);
              
          
              
      
//   //bs

      mover2 = mover2 + 1;
      

              float widthx =  getWidth(statue_name2,font);
          float heightx = getHeight(statue_name2,font);
        mover = mover + 1;
  text(statue_name2, width/2.0 + mover2,calculate);
    
  if(width/2.0 +mover2 + (widthx/2.0) > width - width/34.0){
    text(statue_name2,  mover2   - widthx + width/34.0  ,calculate);
     if(  width/2.0 +mover2  > width - width/34.0 + widthx  ){
          
         mover2 = 0;
     }
     

  } 
        rectMode(CORNER);
  fill(0);
noStroke();
    rect(width  - width/34.0 ,calculate -heightx ,width,heightx*2);
      rect(0 ,calculate -heightx ,width/34.0 ,heightx*2);
      fill(255);
      stroke(255);
      
///////////////////bs
 
    
    //right
    if((i+1+count2)%2 == 1){
    // println(statue_name2+" right");
            count = count + 1;
                
                 
        }else
   if(bigSentence){
 

   SentenceLeft = false;
  }
    bigSentence = true;
  

 //   count2 = count2 + 1;
  



  }else{
    if(bigSentence){
      //println(SentenceLeft);
      //   println(statue_name2);
      //println(count);
 
   if(SentenceLeft == true){
    
   
    calculate = (height/2.27 - scrollNum ) + (height/16.0)*(count-2) ;
    text(statue_name2,  width -offset_sides2,calculate);
    count = count - 1;
    count2 = count2 + 1;

    
    
    }else{

      
      //left
count2 = count2 + 1;
    text(statue_name2, offset_sides2,calculate);
    
    
    
    };
  bigSentence = false;
    SentenceLeft = false;
  
  }else{
  
   if((i+1 + count2)%2 == 1){
    
    text(statue_name2,  offset_sides2,calculate);
      bigSentence = false;
    
    
    }else{
    
    text(statue_name2,  width - offset_sides2,calculate);
      bigSentence = false;
    
    };
  
  
  }
  
  
  }
    //  if( getWidth(statue_name2,font) > limit ){
     
    
//     mover2 = mover2 + 1;
//        float widthx =  getWidth(statue_name2,font);
//          float heightx = getHeight(statue_name2,font);
        
       
  
   
   
     
        
//       //  text(statue_name2, width/34.0,calculate);
   
         
    
         

    
//            rectMode(CORNER);
//         fill(0);
//       noStroke();
//         rect(width/2.0 + ((width/34)/2.0),calculate -heightx ,width,heightx*2);
//       fill(255);
//text(statue_name2, width - offset_sides2+mover2,calculate);
              
    
//         if(width-offset_sides2+mover2 + (widthx/2.0) > width - width/34.0){
//                fill(255);
//       // println("here");
//     text(statue_name2,width/2.0 + ((width/34)/2.0)-(widthx/2.0)  + mover2  - width/15.0,calculate);
          
//          if(width-offset_sides2+mover2  > width - width/34.0  + width/15.0 + widthx/2.0 ){
          
//          mover2 = 0;
//          }
//         };
         
         
//            fill(0);
        
//            rect(width  - width/34.0 ,calculate -heightx ,0,heightx*2);
//        // rect(width/2.0 + ((width/34)/2.0),calculate -heightx ,width,heightx*2);
    
//      fill(255);
       
        
         
         
      
//        textAlign(CENTER,CENTER);
//      }else{

     
// text(statue_name2, offset_sides2,calculate);
//      }
  //  }else{
  //if(getWidth(statue_name2,font) > limit  ){
    

//        mover = mover + 1;
//        float widthx =  getWidth(statue_name2,font);
//          float heightx = getHeight(statue_name2,font);
        
       
  
   
   
     
        
//         text(statue_name2, width/34.0,calculate);
   
         
    
         

    
//            rectMode(CORNER);
//         fill(0);
//       noStroke();
//         rect(width/34.0 ,calculate -heightx ,width,heightx*2);
//       fill(255);
//             text(statue_name2, offset_sides2+mover,calculate);
              
    
//         if(offset_sides2+mover + (widthx/2.0) > width/2.0 - ((width/34)/2.0)){
//                fill(255);
//       // println("here");
//       text(statue_name2,width/34.0-(widthx/2.0)  + mover  - width/15.0,calculate);
          
//          if(offset_sides2+mover  > (width/2.0 - ((width/34)/2.0))  + width/15.0 + widthx/2.0 ){
          
//          mover = 0;
//          }
//         };
         
         
//            fill(0);
        
//              rect(0 ,calculate -heightx ,width/34.0,heightx*2);
//          rect(width/2.0 - ((width/34)/2.0) ,calculate -heightx ,width,heightx*2);
    
//      fill(255);
       
        
         
         
      
// textAlign(CENTER,CENTER);
  
  
  //}else{
  //     text(statue_name2, width-offset_sides2,calculate);
  //}
    }}
  
    
    }
  

//}



//show ranking
  int[][] rankingList = new int[folder.list().length][2] ;

  public int comp( int[] a, int[] b){
    
        return  max(a[1],b[1]);  
    }
  

public void ranking(File statueSize, File[] statueList, float scrollNum) {

  textAlign(LEFT, CENTER);
  
  float offset_sides = width/45.0;

  


  
  
  if( rankLoaded ==  false ){
 
  
  for (int i = 0; i < statueSize.list().length; i++) {
  
  
    String scoreaccess = statue_paths.get(i)+"\\score.json";
      JSONObject j = loadJSONObject(scoreaccess);
      //int score = j.getInt("scoreone") + (j.getInt("scoretwo")*2) + (j.getInt("scorethree")*3) + (j.getInt("scorefour")*4) + (j.getInt("scorefive")*5);
      ///new
      int score = -(j.getInt("scoreone")*2) - (j.getInt("scoretwo")) + (j.getInt("scorefour")) + (j.getInt("scorefive")*2);
      
      
      //new
   int[] list = {i,score};
   append(list,i);
     append(list,score);
   
   rankingList[i] = list;
   

   
 

   
   
  }

  

  
    for (int d = 0; d < rankingList.length ; d++) {
  
  for (int i = 0; i < rankingList.length - 1; i++) {
    
  
  
  if(rankingList[i][1] <  rankingList[i + 1][1])
{
int[] x = rankingList[i];
int[] y= rankingList[i + 1];

rankingList[i] = y;
rankingList[i + 1] = x;
}

  
  };
    }


 rankLoaded = true;
    
}

  
    
 
 
       

  


  for (int i = 0; i < rankingList.length; i++) {
    
     // println(rankingList[5][0]);
    
    float calculate = (height/3.0 - scrollNum ) + (height/16.0)*i;
  

  if(calculate > height/3.05  && calculate < height - height/16.0 ){
    
           String statue_name = statue_list[rankingList[i][0]].getName();
    String[] statue_name2 = match(statue_name, "^[^_]*_(.*)$");
    
    ///new
    //if(getWidth(statue_name2[1],font) > width/10.0){
    
    
    //}
    
    ///new
    
    
    text((i+1)+". "+statue_name2[1] +"  "+rankingList[i][1], offset_sides, calculate);
 
  }

  

    };

  textAlign(RIGHT, CENTER);



  for (int i = 0; i < statueSize.list().length; i++) {
    
    
  
      




    
    float calculate = (height + scrollNum) - ((height/16.0)*statueSize.list().length ) + (height/16.0)*i ;
  
  if(calculate > height/3.0  && calculate < height - height/17.0 ){
    
        String statue_name = statue_list[rankingList[i][0]].getName();
    String[] statue_name2 = match(statue_name, "^[^_]*_(.*)$");
  
     text((i+1)+". "+statue_name2[1] +"  "+rankingList[i][1], width -offset_sides,calculate);
   };
 
  };
};


public void imageInit() {
  
  
       for (int i = 0; i < folder.list().length; i++) {
      
     String x[] = listPaths(statue_paths.get(i));

    
     boolean detection = false;
     for (int o = 0; o < x.length; o++) {
         
     String[] regexcheck =  match( x[o], "(?i).json$(?-i)") ;
  
    
      if(regexcheck != null){
      detection = true;
     
      }else{
      
       statue_image_paths.append( x[o]);
      }
      
      
 
   
     }
     if(detection == false){
       
   
    
      jsonIMG = new JSONObject();
            String statue_name = statue_list[i].getName();
    String[] statue_name2 = match(statue_name, "^[^_]*_(.*)$");

          jsonIMG.setString("sculpture", statue_name2[1]);
          jsonIMG.setInt("scoreone", 0);
          jsonIMG.setInt("scoretwo", 0);
          jsonIMG.setInt("scorethree",0 );
          jsonIMG.setInt("scorefour",0);
          jsonIMG.setInt("scorefive",0);
                                        
  

         saveJSONObject(jsonIMG, statue_paths.get(i)+"/score"+  ".json");
     }
     
   
  }
  statue_image_paths.shuffle(this);
  
}









public void mouseWheel(MouseEvent event ) {


  if (clickTracker == 1 || clickTracker ==  4 ||  clickTracker ==  10) {
    int min = 0;

    int max = 30 * folder.list().length ;
    scroll_num = event.getCount();
    if ((scroll_num2 + scroll_num * 8) < min || (scroll_num2 + scroll_num * 8) > max) {
    } else {
      scroll_num2 += scroll_num * 8;
    }
  }

  if (educbool2 == true) {

  int min = 0;
    
    
    int max = educationList.length-dialogWindows.length;



    scroll_num = event.getCount();
    if ((scroll_num2 + scroll_num ) < min || (scroll_num2 + scroll_num ) > max) {
    } else {
      scroll_num2 += scroll_num;


      for (int i = 0; i < dialogWindows.length; i++) {

        if (MarkedOption    == i+int(scroll_num2) ) {
          dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
        } else {

          dialogWindows[i] = educationList[i+int(scroll_num2)];
        }
      }
    }
  };
  
  
  
    if (workbool2 == true) {

    int min = 0;
    int max = fieldOfWork.length-dialogWindows.length;



    scroll_num = event.getCount();
    if ((scroll_num2 + scroll_num ) < min || (scroll_num2 + scroll_num ) > max) {
    } else {
      scroll_num2 += scroll_num;


      for (int i = 0; i < dialogWindows.length; i++) {

        if (MarkedOption2    == i+int(scroll_num2) ) {
          dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
        } else {

          dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
        }
      }
    }
  };
  
  
}


public void mouseOver(){

   
   if(clickTracker == 0){
      
      
         if (mouseX > coordinates1[0] && mouseX < coordinates1[2] && mouseY > coordinates1[1] && mouseY < coordinates1[3] ) {
        ////continue here
        cursor(HAND);
     strokeWeight(4);
     stroke(0);
  
 
         line(coordinates1[0],coordinates1[3] + height/220.0,coordinates1[2],coordinates1[3]  + height/220.0);
         
          
        }else{
            cursor(ARROW);  
        }
      
   }
   
   
      if(clickTracker == 1){
      
      
         if (mouseX > coordinates1[0] && mouseX < coordinates1[2] && mouseY > coordinates1[1] && mouseY < coordinates1[3] ) {
        ////continue here

     strokeWeight(4);
     stroke(255);
  
 
         line(coordinates1[0],coordinates1[3] + height/110.0,coordinates1[2] - height/120.0,coordinates1[3]  + height/110.0);
         
          
        }
   }
      
      
     if(clickTracker == 3){

        if (mouseX > coordinates1[0] - (coordinates1[2]/2.0) && mouseX < coordinates1[0] + (coordinates1[2]/2.0)&& mouseY > coordinates1[1] - (coordinates1[3]/2.0) && mouseY < coordinates1[1] + (coordinates1[3]/2.0)) {
        ////continue here
        
         rect(coordinates1[0],coordinates1[1],coordinates1[2],coordinates1[3]);
          
        };

       

        if (mouseX > coordinates2[0] - (coordinates2[2]/2.0) && mouseX < coordinates2[0] + (coordinates2[2]/2.0)&& mouseY > coordinates2[1] - (coordinates2[3]/2.0) && mouseY < coordinates2[1] + (coordinates2[3]/2.0)) {
        ////continue here
        
         rect(coordinates2[0],coordinates2[1],coordinates2[2],coordinates2[3]);
          
        };
  
        
      

        if (mouseX > coordinates3[0] - (coordinates3[2]/2.0) && mouseX < coordinates3[0] + (coordinates3[2]/2.0)&& mouseY > coordinates3[1] - (coordinates3[3]/2.0) && mouseY < coordinates3[1] + (coordinates3[3]/2.0)) {
        ////continue here
        
          rect(coordinates3[0],coordinates3[1],coordinates3[2],coordinates3[3]);
 
        };
         

        if (mouseX > coordinates4[0] - (coordinates4[2]/2.0) && mouseX < coordinates4[0] + (coordinates4[2]/2.0)&& mouseY > coordinates4[1] - (coordinates4[3]/2.0) && mouseY < coordinates4[1] + (coordinates4[3]/2.0)) {
        ////continue here
        rect(coordinates4[0],coordinates4[1],coordinates4[2],coordinates4[3]);
          
      
        };
  

        if (mouseX > coordinates5[0] - (coordinates5[2]/2.0) && mouseX < coordinates5[0] + (coordinates5[2]/2.0)&& mouseY > coordinates5[1] - (coordinates5[3]/2.0) && mouseY < coordinates5[1] + (coordinates5[3]/2.0)) {
        ////continue here
        
          rect(coordinates5[0],coordinates5[1],coordinates5[2],coordinates5[3]);
          
    
        };
    
    };
    
      if(clickTracker == 2){
        
          stroke(255);

       rectMode(CENTER);
           
                  if(ageBool){
                    
                    if(!ageBool2){
                                          
                                             if ( mouseY >  (height/8.0  +(height/14.0))-((height/14.2)/2.0)  && mouseY <  (height/8.0  +(height/14.0))+((height/14.2)/2.0))  {

       rect(width/2.0, height/8.0  +(height/14.0),width- 2,height/14.2);
          
        };}
                  };
                  
                   if(perresident){
                       if(!perresident2){
        
          if ( mouseY >  (height/8.0  +(height/14.0)*2)-((height/14.2)/2.0)  && mouseY <  (height/8.0  +(height/14.0)*2)+((height/14.2)/2.0))  {

       rect(width/2.0, height/8.0  +(height/14.0)*2,width- 2,height/14.2);
          
        };}
                   }
                   
                    if(educbool){
                        if(!educbool2){
          if ( mouseY >  (height/8.0  +(height/14.0)*3)-((height/14.2)/2.0)  && mouseY <  (height/8.0  +(height/14.0)*3)+((height/14.2)/2.0))  {

       rect(width/2.0, height/8.0  +(height/14.0)*3,width- 2,height/14.2);
          
        };
                        }
                    }
                       if(workbool){
                           if(!workbool2){
                  
            if ( mouseY >  (height/8.0  +(height/14.0)*4)-((height/14.2)/2.0)  && mouseY <  (height/8.0  +(height/14.0)*4)+((height/14.2)/2.0))  {

       rect(width/2.0, height/8.0  +(height/14.0)*4,width- 2,height/14.2);
          
        };
                           }
                       }
      
      
      
        
        
      };
};

public void mouseClicked() {

  switch(clickTracker) {
  case 0:
    exitFuncClick();
    if (mouseButton == LEFT) {
      if (mouseX > coordinates1[0] && mouseX < coordinates1[2] && mouseY > coordinates1[1] && mouseY < coordinates1[3]) {

        clickTracker =  clickTracker + 1;
        textFont(font);
          cursor(cursor);
          runOnce = false;
              }
    };

    break;
  case 1:
    exitFuncClick();
    if (mouseButton == LEFT) {
      if (mouseX > coordinates1[0] && mouseX < coordinates1[2] && mouseY > coordinates1[1] && mouseY < coordinates1[3]) {

        clickTracker =  clickTracker + 1;
         runOnce = false;
               textSize(60);
      }
    };
    break;

  case 2:
    exitFuncClick();
    if (ageBool2) {



      if (mouseButton == LEFT) {

        if (mouseX >    coordinates8[0]+width/40.0 && mouseX < coordinates8[2]&& mouseY > coordinates8[1] && mouseY < coordinates8[3]) {

          ageNumber = ageNumber + 1;
        }
      };


     if (mouseButton == LEFT) {
     
        if (mouseX > coordinates8[0]-(width/40.0)*2 && mouseX < coordinates8[2]-(width/40.0)*3 && mouseY > coordinates8[1] && mouseY < coordinates8[3]) {
          ageNumber = ageNumber - 1;
        }
      }
    }



    if (perresident2) {



      if (mouseButton == LEFT) {
        if (mouseX > coordinates6[0] && mouseX < coordinates6[2] && mouseY > coordinates6[1] && mouseY < coordinates6[3]) {

          permamentResidentAnswer2 = 0;
        }
      };


      if (mouseButton == LEFT) {
        if ((mouseX > coordinates7[0] && mouseX < coordinates7[2] && mouseY > coordinates7[1] && mouseY < coordinates7[3])) {



          permamentResidentAnswer2 = 1;
        }
      }
    }


    if (workbool2 == true) {

      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > height-height/2.72 && mouseY < (height-height/2.72)+(((height/2.72)/5.0))-1) {

          workanswer = fieldOfWork[int(scroll_num2) ];
          MarkedOption2 =  int(scroll_num2)  ;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption2   == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
            }
          }
        }
      }      
      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate1 && mouseY < DialogWindowCordinate2) {



          workanswer = fieldOfWork[int(scroll_num2)+1 ];
          MarkedOption2 =  int(scroll_num2) + 1;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption2   == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
            }
          }
        }
      }

      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate2 && mouseY < DialogWindowCordinate3) {



          workanswer = fieldOfWork[int(scroll_num2)+2 ];
          MarkedOption2 =  int(scroll_num2) + 2;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption2    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
            }
          }
        }
      }
       if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate3 && mouseY < DialogWindowCordinate4) {



          workanswer = fieldOfWork[int(scroll_num2)+3 ];
          MarkedOption2 =  int(scroll_num2) + 3;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption2    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
            }
          }
        }
      }
       if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate4 && mouseY < DialogWindowCordinate5) {



          workanswer = fieldOfWork[int(scroll_num2)+4 ];
          MarkedOption2 =  int(scroll_num2) + 4;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption2    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+fieldOfWork[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = fieldOfWork[i+int(scroll_num2)];
            }
          }
        }
      }
    }
    
    
    if (educbool2 == true) {

      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > height-height/2.72 && mouseY < (height-height/2.72)+(((height/2.72)/5.0))-1) {

          educanswer = educationList[int(scroll_num2) ];
          MarkedOption =  int(scroll_num2)  ;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption   == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = educationList[i+int(scroll_num2)];
            }
          }
        }
      }      
      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate1 && mouseY < DialogWindowCordinate2) {



          educanswer = educationList[int(scroll_num2)+1 ];
          MarkedOption =  int(scroll_num2) + 1;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption   == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = educationList[i+int(scroll_num2)];
            }
          }
        }
      }

      if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate2 && mouseY < DialogWindowCordinate3) {



          educanswer = educationList[int(scroll_num2)+2 ];
          MarkedOption =  int(scroll_num2) + 2;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = educationList[i+int(scroll_num2)];
            }
          }
        }
      }
       if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate3 && mouseY < DialogWindowCordinate4) {



          educanswer = educationList[int(scroll_num2)+3 ];
          MarkedOption =  int(scroll_num2) + 3;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = educationList[i+int(scroll_num2)];
            }
          }
        }
      }
       if (mouseButton == LEFT) {

        if (mouseX >0 && mouseX < width-1 && mouseY > DialogWindowCordinate4 && mouseY < DialogWindowCordinate5) {



          educanswer = educationList[int(scroll_num2)+4 ];
          MarkedOption =  int(scroll_num2) + 4;


          for (int i = 0; i < dialogWindows.length; i++) {

            if (MarkedOption    == i+int(scroll_num2) ) {
              dialogWindows[i] =  "x    "+educationList[i+int(scroll_num2)] + "    x" ;
            } else {

              dialogWindows[i] = educationList[i+int(scroll_num2)];
            }
          }
        }
      }
    }




/////SELECTION IN MENU

    if (mouseButton == LEFT) {
      if ((mouseX > coordinates1[0] && mouseX < coordinates1[2] && mouseY > coordinates1[1] && mouseY < coordinates1[3]) ||(ageBool && mouseX > 0 && mouseX < width && mouseY > coordinates1[1] && mouseY < coordinates1[3]) ) {
        // email = "email:";

        //keyboard = true;
        ageBool = true;
        age = "age:";
         ageBool2 = true;
   
        perresident2 = false;
        educbool2 = false;
        workbool2 = false;
             fieldsnotfilled = false;
      } else if ((mouseX > coordinates2[0] && mouseX < coordinates2[2] && mouseY > coordinates2[1] && mouseY < coordinates2[3])||(  perresident &&mouseX > 0 && mouseX < width && mouseY > coordinates2[1] && mouseY < coordinates2[3])) {


ageBool2 = false;
        perresident = true;
        perresident2 = true;
        educbool2 = false;
        workbool2 = false;
             fieldsnotfilled = false;
        resident = "permament resident in Helsinki:";
      } else if ((mouseX > coordinates3[0] && mouseX < coordinates3[2] && mouseY > coordinates3[1] && mouseY < coordinates3[3])||(educbool &&mouseX > 0 && mouseX < width && mouseY > coordinates3[1] && mouseY < coordinates3[3])) {


      ageBool2 = false;
        perresident2 = false;
        
               if(!educbool2){
                 scroll_num2 = 0;
          dialogWindows[0] = educationList[0];
  dialogWindows[1] = educationList[1];
  dialogWindows[2] = educationList[2];
  dialogWindows[3] = educationList[3];
  dialogWindows[4] = educationList[4];
        }
        educbool = true;
        
 
        
        educbool2 = true;
        workbool2 =false;
             fieldsnotfilled = false;


        education = "highest attained level of education:";
      } else if ((mouseX > coordinates4[0] && mouseX < coordinates4[2] && mouseY > coordinates4[1] && mouseY < coordinates4[3])||(workbool&&mouseX > 0  && mouseX < width && mouseY > coordinates4[1] && mouseY < coordinates4[3])) {

        work = "field of work:";
ageBool2 = false;
        educbool2 = false;
        perresident2 = false;
                  if(!workbool2){
                    
                       scroll_num2 = 0;
          dialogWindows[0] = fieldOfWork[0];
  dialogWindows[1] = fieldOfWork[1];
  dialogWindows[2] = fieldOfWork[2];
  dialogWindows[3] = fieldOfWork[3];
  dialogWindows[4] = fieldOfWork[4];
        }
        
        
        workbool = true;
          workbool2 = true;
          fieldsnotfilled = false;
      } else if (mouseX > coordinates5[0] && mouseX < coordinates5[2] && mouseY > coordinates5[1] && mouseY < coordinates5[3]) {
        
        
       
        
        if(ageBool == true && permamentResidentAnswer2 != 3  &&  workanswer != "" &&  educanswer != ""){
        
        
        json = new JSONObject();
        
          json.setInt("age", ageNumber);
          json.setInt("residency", permamentResidentAnswer2);
          json.setString("education", educanswer);
          json.setString("work",workanswer);
        //  json.setJSONArray("statues",statue_json);

          saveJSONObject(json, "/data/voters/"+ voterCount + ".json");
          
          clickTracker = 3;
 notifPass = true;
     
        
        
        
        
        }else{
        
         
        fieldsnotfilled = true;
        
        
        
        }

        
    ageBool2 = false;
        educbool2 = false;
        workbool2 =false;
        perresident2 = false;
      }
    }
    break;
    
    case 3: 
    exitFuncClick();

   if(notifPass){
  if (mouseButton == LEFT) {
       notifPass = false;
     }

   }else{
    

      
      
      if (mouseButton == LEFT) {

        if (mouseX > coordinates1[0] - (coordinates1[2]/2.0) && mouseX < coordinates1[0] + (coordinates1[2]/2.0)&& mouseY > coordinates1[1] - (coordinates1[3]/2.0) && mouseY < coordinates1[1] + (coordinates1[3]/2.0)) {
     
        
   voted = 3;
          
        }
        };
            if (mouseButton == LEFT) {

        if (mouseX > coordinates2[0] - (coordinates2[2]/2.0) && mouseX < coordinates2[0] + (coordinates2[2]/2.0)&& mouseY > coordinates2[1] - (coordinates2[3]/2.0) && mouseY < coordinates2[1] + (coordinates2[3]/2.0)) {

           voted = 4;

          
        }
        };
        
              if (mouseButton == LEFT) {

        if (mouseX > coordinates3[0] - (coordinates3[2]/2.0) && mouseX < coordinates3[0] + (coordinates3[2]/2.0)&& mouseY > coordinates3[1] - (coordinates3[3]/2.0) && mouseY < coordinates3[1] + (coordinates3[3]/2.0)) {
     
        
           voted = 5;
          
        }
        };
              if (mouseButton == LEFT) {

        if (mouseX > coordinates4[0] - (coordinates4[2]/2.0) && mouseX < coordinates4[0] + (coordinates4[2]/2.0)&& mouseY > coordinates4[1] - (coordinates4[3]/2.0) && mouseY < coordinates4[1] + (coordinates4[3]/2.0)) {

        
 voted = 1;
          
        }
        };
              if (mouseButton == LEFT) {

        if (mouseX > coordinates5[0] - (coordinates5[2]/2.0) && mouseX < coordinates5[0] + (coordinates5[2]/2.0)&& mouseY > coordinates5[1] - (coordinates5[3]/2.0) && mouseY < coordinates5[1] + (coordinates5[3]/2.0)) {
   
        
         voted = 2;
          
        }
        };
     }
    break;
 
    case 4:
       if (mouseButton == LEFT) {
          clickTracker = 0;
      scroll_num2 = 0;
      votedStatues = 0;
      age = "age";
      resident = "permament resident in Helsinki";
      education = "highest attained level of education";
       work = "field of work";
       ageNumber = 50;
        permamentResidentAnswer= "Yes / No";
        permamentResidentAnswer2 = 3;
        ageBool = false;
        ageBool2 = false;
         MarkedOption = -10;
         MarkedOption2 = -10;
          perresident = false;
          perresident2 = false;
          educbool = false;
          educbool2 = false;
          educanswer = "" ;
          fieldsnotfilled = false;
           workbool = false;
           workbool2 = false;
            workanswer = "" ;
            voterCount = jsonfolder.list().length;
             rankLoaded = false;
                 textFont(font2);
               cursor(ARROW);
               imageMode(CORNER);
                 runOnce = false;
              //   statue_json = new JSONArray();
            
            
             imageInit();
       
       
       }
    case 10:
    
       if (mouseButton == LEFT) {
          clickTracker = 0;
      scroll_num2 = 0;
      votedStatues = 0;
      age = "age";
      resident = "permament resident in Helsinki";
      education = "highest attained level of education";
       work = "field of work";
       ageNumber = 50;
        permamentResidentAnswer= "Yes / No";
        permamentResidentAnswer2 = 3;
        ageBool = false;
        ageBool2 = false;
         MarkedOption = -10;
         MarkedOption2 = -10;
          perresident = false;
          perresident2 = false;
          educbool = false;
          educbool2 = false;
          educanswer = "" ;
          fieldsnotfilled = false;
           workbool = false;
           workbool2 = false;
            workanswer = "" ;
            voterCount = jsonfolder.list().length;
             rankLoaded = false;
                 textFont(font2);
               cursor(ARROW);
               imageMode(CORNER);
                 runOnce = false;
              //   statue_json = new JSONArray();
            
            
             imageInit();
       
       
       }
  }
}


public float getHeight(String string, PFont font) {
  float textHeight;
  float minY = Float.MAX_VALUE;
  float maxY = Float.NEGATIVE_INFINITY;


  for (Character c : string.toCharArray()) {
    PShape character = font.getShape(c); // create character vector
    for (int i = 0; i < character.getVertexCount(); i++) {
      minY = min(character.getVertex(i).y, minY);
      maxY = max(character.getVertex(i).y, maxY);
    }
  }

  return  textHeight = maxY - minY;
}




public float getWidth(String string, PFont font) {
  
  if(string.length() == 0){
  return 0;
  
  }else{
  float textWidth = textWidth(string); // call Processing method

  whitespace = (font.width(string.charAt(string.length() - 1)) * font.getSize()
    - font.getGlyph(string.charAt(string.length() - 1)).width) / 2;
  textWidth -= whitespace; // subtract whitespace of last character

  whitespace = (font.width(string1.charAt(0)) * font.getSize() - font.getGlyph(string.charAt(0)).width) / 2;
  return textWidth -= whitespace; // subtract whitespace of first character
  }
};

public float[] textCoordinates(String string, PFont font, float locx, float locy) {
  float widthoftext = getWidth(string, font);
  float heightoftext = getHeight(string, font);
  float [] coordinates = {locx - widthoftext/2.0, locy - heightoftext/2.0, locx  + widthoftext/2.0, locy + heightoftext/2.0};

  return coordinates;
};

public float[] textCoordinatesLEFT(String string, PFont font, float locx, float locy) {
  float widthoftext = getWidth(string, font);
  float heightoftext = getHeight(string, font);
  float [] coordinates = {locx, locy - heightoftext/2.0, locx  + widthoftext, locy + heightoftext/2.0};

  return coordinates;
};

public float[] arraymaker(Float a, float b, float c , float d) {

  float [] coordinates = {a, b , c ,d };

  return coordinates;
  
};




public void buttonEffect(float[] coordinates) {
  if (mouseX > coordinates[0] && mouseX < coordinates[2] && mouseY > coordinates[1] && mouseY < coordinates[3]) {
    noFill();
    stroke(255);

    rectMode(CORNERS);
    rect(coordinates[0], coordinates[1], coordinates[2], coordinates[3]);
  }
}

public void exitFunc() {
  stroke(255);
  strokeWeight(2);
  noFill();
  line(width/140.0, width/140.0, width/60.0, width/60.0);
  line(width/60.0, width/140.0, width/140.0, width/60.0);
  // rect(width/140.0,width/140.0,width/60.0,width/60.0);
}



public void exitFuncClick() {

  if (mouseButton == LEFT) {
    if (mouseX > width/140.0 && mouseX < width/60.0 && mouseY > width/140.0 && mouseY <width/60.0) {
      
      
      if(clickTracker > 2){
      clickTracker = 10;
      }else{
      
      
      
       json = new JSONObject();
      
      
      
      
      clickTracker = 0;
      scroll_num2 = 0;
      votedStatues = 0;
      age = "age";
      resident = "permament resident in Helsinki";
      education = "highest attained level of education";
       work = "field of work";
       ageNumber = 50;
        permamentResidentAnswer= "Yes / No";
        permamentResidentAnswer2 = 3;
        ageBool = false;
        ageBool2 = false;
         MarkedOption = -10;
         MarkedOption2 = -10;
          perresident = false;
          perresident2 = false;
          educbool = false;
          educbool2 = false;
          educanswer = "" ;
          fieldsnotfilled = false;
           workbool = false;
           workbool2 = false;
            workanswer = "" ;
            voterCount = jsonfolder.list().length;
             rankLoaded = false;
               textFont(font2);
               cursor(ARROW);
               imageMode(CORNER);
               runOnce = false;
           //    statue_json = new JSONArray();
            
            
             imageInit();
      }
    }
  };
}
