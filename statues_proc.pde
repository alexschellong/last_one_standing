import java.util.*;
import processing.video.*;
Movie introVid;
Movie fire;

String path = "C:/Users/alexs/Desktop/statues2";
String jsonpath = "C:/Users/alexs/Desktop/statues_proc/data/voters";


JSONObject json;
JSONObject jsonIMG;
JSONObject jsonScore;

float mover;
float mover2;

 boolean notifPass = true ;
   

boolean runOnce = false;

PImage img;
PImage intro;

boolean rankLoaded = false;

int voterCount;

int voted = 10;


File[] statue_list = listFiles(path);
StringList statue_paths =  new StringList(listPaths(path));
StringList statue_image_paths =   new StringList();
File folder = new File(path);

File jsonfolder = new File(jsonpath);
float scroll_num;
float scroll_num2 = 0;






int clickTracker = 0;

int votedStatues = 0;

PImage cursor;

PFont font;
PFont font2;

float[] coordinates1;
float[] coordinates2;
float[] coordinates3;
float[] coordinates4;
float[] coordinates5;
float[] coordinates6;
float[] coordinates7;
float[] coordinates8;




float whitespace;

String string1 = "author1";





String[] dialogWindows =  new String[5];

// String email = "email";
String age = "age";
String resident = "permament resident in Helsinki";
String education = "highest attained level of education";
String work = "field of work";

String[] educationList = {"Elementary school", "Vocational school diploma", "High school diploma", "Bachelor's degree", "Master's degree", "Doctorate"};
String[] fieldOfWork = {"Architecture and engineering", "Arts, culture and entertainment", "Business, management and administration", "Communications", "Community and social services", " Education", "Science and technology", "Installation, repair and maintenance", "Farming, fishing and forestry", "Government", "Health and medicine", "Law and public policy", "Sales"};


int ageNumber = 50;
String permamentResidentAnswer= "Yes / No";
int permamentResidentAnswer2 = 3;



//boolean keyboard = false;
boolean ageBool = false;
boolean ageBool2 = false;


int MarkedOption = -10;
int MarkedOption2 = -10;


boolean perresident = false;
boolean perresident2 = false;

boolean educbool = false;
boolean educbool2 = false;
String educanswer = "" ;

boolean fieldsnotfilled = false;

boolean workbool = false;
boolean workbool2 = false;
String workanswer = "" ;

float DialogWindowCordinate1, DialogWindowCordinate2, DialogWindowCordinate3, DialogWindowCordinate4, DialogWindowCordinate5;



void setup() {

   //size(1280,720);

  fullScreen();
  frameRate(60);
 
  cursor = loadImage("cursor1-01.png");

  //cursor(cursor2);

  font = createFont("berthold-akzidenz-grotesk-be-italic.ttf", 12, true);
    font2 = createFont("HKGrotesk-Medium.otf", 12, true);
  
  textFont(font2);
  strokeCap(SQUARE);
  
 mover = 0;
  mover2 = 0;
  
    fire = new Movie(this, "C:/Users/alexs/Desktop/statues_proc/data/fire1920.mp4");
fire.loop();

  intro = loadImage("C:/Users/alexs/Desktop/statues_proc/data/statues intro-01.jpg");
  
  
   voterCount = jsonfolder.list().length;

  DialogWindowCordinate1 = (height-height/2.72) +((height/2.72)/5.0)  -1;
  DialogWindowCordinate2 = (height-height/2.72) +((height/2.72)/5.0)*2-1;
  DialogWindowCordinate3 = (height-height/2.72)+((((height/2.72)/5.0))*3)-1;
  DialogWindowCordinate4 = (height-height/2.72 +(((height/2.72)/5.0)*4)-1);
  DialogWindowCordinate5 = (height-height/2.72)+((((height/2.72)/5.0))*5)-1;
  
  
  imageInit();
  
  //statue_json = new JSONArray();





}

void draw() {

  //println(clickTracker);

  switch(clickTracker) {
  case 0: 

     
    fill(0);
    textSize(50);
    textAlign(CENTER, CENTER);
    
      if(runOnce == false){
      
          coordinates1 = textCoordinates("Proceed", font2, width/2.0, height - height/8.2);
          runOnce = true;
        
      }

    //page 1
    image(intro, 0, 0,width,height);
    
  

    //text("INTRO", width/2.0, height/8.0);
  
    text("Proceed", width/2.0, height - height/7.48);
  
   

        
mouseOver();

   // buttonEffect(coordinates1);
    break;
  case 1:
      textSize(60);
  
  
   if(runOnce == false){
     
        coordinates1 = textCoordinatesLEFT("continue", font, width/16.0, height/3.4);
        runOnce = true;
  
   }
  
    //page 2
    background(0);
    
     image(fire, 0, 0,width,height);
     if(is_movie_finished(fire)){
     fire.jump(0);
     
     };
    
         fill(255);
    
      textAlign(LEFT, CENTER);
    text("continue", width/16.0, height/3.4);
    
        textAlign(RIGHT, CENTER);

    text(voterCount+" people voted", width - width/16.0, height/3.4);
  

    exitFunc();
    



   

    textSize(40);
   // ranking(folder, statue_list, scroll_num2);
//new
artlist(statue_image_paths,scroll_num2);
//new


    fill(255);
    textSize(180);
    textAlign(CENTER, CENTER);
    text("Last One Standing", width/2.0, height/8.0);




  
     

    textAlign(CENTER, CENTER);
    
    line(width - width/72.0 ,height/2.48,width - width/72.0 ,height-height/30.0);
    makeTriangle(width - width/72.0, height/2.48 ,"up");
    makeTriangle(width - width/72.0,height-height/30.0,"down");
    mouseOver();
    //buttonEffect(coordinates1);
    break;
    //page 3
  case 2:
  
  

    background(0);
    exitFunc();
  
    coordinates5 = textCoordinates("submit & continue", font, width/2.0 , height/8.0 + (height/14.0)*6);
  

    if ( perresident == true) {
      coordinates2 = textCoordinatesLEFT(resident, font, width/80.0, height/8.0 + (height/14.0)*2);
      coordinates6 = textCoordinates("Yes", font, width -  width/9.2, height/8.0 + (height/14.0)*2);
      coordinates7 = textCoordinates("No", font, width - width/28.0, height/8.0 + (height/14.0)*2);
      textAlign(LEFT, CENTER);
      text(resident, width/80.0, height/8.0 + (height/14.0)*2);
      textAlign(RIGHT, CENTER);

      text(permamentResidentAnswer, width - width/80.0, height/8.0 + (height/14.0)*2);
      textAlign(CENTER, CENTER);

//buttonEffect(coordinates2);
//      buttonEffect(coordinates6);
//      buttonEffect(coordinates7);
    } else {
      
      coordinates2 = textCoordinates(resident, font, width/2.0, height/8.0 + (height/14.0)*2);
      //buttonEffect(coordinates2);
      text(resident, width/2.0 , height/8.0 + (height/14.0)*2);
    };

    if ( educbool == true) {
      coordinates3 = textCoordinatesLEFT(education, font, width/80.0, height/8.0 + (height/14.0)*3);
      textAlign(LEFT, CENTER);
      text(education, width/80.0, height/8.0  +(height/14.0)*3);
      textAlign(RIGHT, CENTER);

      text(educanswer, width - width/80.0, height/8.0 + (height/14.0)*3);
      textAlign(CENTER, CENTER);

      //buttonEffect(coordinates3);


      if (educbool2 == true) {
        
              fill(255);
          
               makeTriangle(width - width/68.0, height/1.5 ,"up");
              makeTriangle(width - width/68.0,height-height/30.0,"down");
              line(width - width/68.0, height/1.5,width - width/68.0,height-height/30.0);
          
  

        rectMode(CORNERS);
        noFill();
        stroke(255);
        strokeWeight(1);








        textSize(30);
        text(dialogWindows[0], width/2.0, ((height-height/2.72)+((height-height/2.72)+(((height/2.72)/5.0))-1))/2.0);
        rect(0, height-height/2.72, width-width/30.0, (height-height/2.72)+(((height/2.72)/5.0))-1);

        text(dialogWindows[1], width/2.0, (DialogWindowCordinate1+ DialogWindowCordinate2)/2.0);
        rect(0, DialogWindowCordinate1, width-width/30.0, DialogWindowCordinate2);

        text(dialogWindows[2], width/2.0, (DialogWindowCordinate2+ DialogWindowCordinate3)/2.0);
        rect(0, DialogWindowCordinate2, width-width/30.0, DialogWindowCordinate3);

        text(dialogWindows[3], width/2.0, (DialogWindowCordinate3+ DialogWindowCordinate4)/2.0);
        rect(0, DialogWindowCordinate3, width-width/30.0, DialogWindowCordinate4);

        text(dialogWindows[4], width/2.0, (DialogWindowCordinate4+ DialogWindowCordinate5)/2.0);
        rect(0, DialogWindowCordinate4, width-width/30.0, DialogWindowCordinate5);

        textSize(60);
      };
    } else {
      coordinates3 = textCoordinates(education, font, width/2.0 , height/8.0 + (height/14.0)*3);
      text(education, width/2.0 , height/8.0  +(height/14.0)*3);
      //buttonEffect(coordinates3);
    };
    
    
    
    if(workbool){
      
      
        coordinates4 = textCoordinatesLEFT(work, font, width/80.0, height/8.0 + (height/14.0)*4);
      textAlign(LEFT, CENTER);
      text(work, width/80.0, height/8.0  +(height/14.0)*4);
      textAlign(RIGHT, CENTER);

      text(workanswer, width - width/80.0, height/8.0 + (height/14.0)*4);
      textAlign(CENTER, CENTER);

      //buttonEffect(coordinates4);
    
          if (workbool2 == true) {
            
            fill(255);
          
               makeTriangle(width - width/68.0, height/1.5 ,"up");
              makeTriangle(width - width/68.0,height-height/30.0,"down");
              line(width - width/68.0, height/1.5,width - width/68.0,height-height/30.0);
          
          
        rectMode(CORNERS);
        noFill();
        stroke(255);
        strokeWeight(1);








        textSize(30);
        text(dialogWindows[0], width/2.0, ((height-height/2.72)+((height-height/2.72)+(((height/2.72)/5.0))-1))/2.0);
        rect(0, height-height/2.72, width-width/30.0, (height-height/2.72)+(((height/2.72)/5.0))-1);

        text(dialogWindows[1], width/2.0, (DialogWindowCordinate1+ DialogWindowCordinate2)/2.0);
        rect(0, DialogWindowCordinate1, width-width/30.0, DialogWindowCordinate2);

        text(dialogWindows[2], width/2.0, (DialogWindowCordinate2+ DialogWindowCordinate3)/2.0);
        rect(0, DialogWindowCordinate2, width-width/30.0, DialogWindowCordinate3);

        text(dialogWindows[3], width/2.0, (DialogWindowCordinate3+ DialogWindowCordinate4)/2.0);
        rect(0, DialogWindowCordinate3, width-width/30.0, DialogWindowCordinate4);

        text(dialogWindows[4], width/2.0, (DialogWindowCordinate4+ DialogWindowCordinate5)/2.0);
        rect(0, DialogWindowCordinate4, width-width/30.0, DialogWindowCordinate5);

        textSize(60);
          
          
          }
    
    
    }else{
    
       coordinates4 = textCoordinates(work, font, width/2.0 , height/8.0 + (height/14.0)*4 );
    text(work, width/2.0 , height/8.0 + (height/14.0)*4);
        //buttonEffect(coordinates4);
    }


    if (permamentResidentAnswer2 == 1 || permamentResidentAnswer2 == 0 ) {

      rectMode(CORNERS);
      noFill();
      stroke(255);
      strokeWeight(2);
      switch(permamentResidentAnswer2) {
      case 0:
   
      
        rect(coordinates6[0], coordinates6[1], coordinates6[2], coordinates6[3]);
        break;

      case 1:
        rect(coordinates7[0], coordinates7[1], coordinates7[2], coordinates7[3]);
        break;
      }

      //rect();
    };

    
    text("submit & continue", width/2.0 , height/8.0 + (height/14.0)*6);





    //buttonEffect(coordinates5);



    
      if(ageBool){
     
      
        coordinates1 = textCoordinatesLEFT(age, font, width/80.0, height/8.0 + (height/14.0));
      textAlign(LEFT, CENTER);
      text(age, width/80.0, height/8.0  +(height/14.0));
      textAlign(RIGHT, CENTER);
      
       rectMode(CORNERS);
       coordinates8 = textCoordinates(str(ageNumber), font,width - width/24.0, height/8.0 + (height/14.0));
       if(ageBool2){
           fill(255);
         makeTriangle(width - width/9.6,height/5.12,"left" );
         makeTriangle(width - width/33.8,height/5.12,"right" );
         noFill();

       //   rect(coordinates8[0]+width/40.0,coordinates8[1],coordinates8[2],coordinates8[3]);
      //rect(coordinates8[0]-(width/40.0 )*2,coordinates8[1],coordinates8[2]-(width/40.0)*3,coordinates8[3]);
       }
      text(ageNumber, width - width/24.0, height/8.0 + (height/14.0));
      textAlign(CENTER, CENTER);

      //buttonEffect(coordinates1);
        
    
      
          
          }
    
    
    else{
    
         coordinates1 = textCoordinates(age, font, width/2.0, height/8.0 + height/14.0);
    text(age, width/2.0, height/8.0 + height/14.0);
        //buttonEffect(coordinates1);
    }

if(fieldsnotfilled){


rectMode(CENTER);
stroke(255);
textAlign(CENTER,CENTER);
text("Please fill out all the fields",width/2.0,height-height/4.3);
rect(width/2.0,height-height/4.5,width/2.6,height/8.8);



}


    //if(keyboard){

    //  float rectSize = width/18;

    //  rectMode(CORNER);
    //  stroke(10,50,100);
    //  strokeWeight(2);
    //  fill(255);

    //  //firstrow

    //  rect((width - (rectSize*10))/2.0,height -(rectSize*3) ,rectSize,rectSize);
    //  rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize*3),rectSize,rectSize);
    //    rect((width - (rectSize*10))/2.0+(rectSize)*2,height-(rectSize*3),rectSize,rectSize);
    //     rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize*3),rectSize,rectSize);
    //      rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize*3),rectSize,rectSize);
    //       rect((width - (rectSize*10))/2.0+(rectSize)*5,height-(rectSize*3),rectSize,rectSize);
    //        rect((width - (rectSize*10))/2.0+(rectSize)*6,height-(rectSize*3),rectSize,rectSize);
    //           rect((width - (rectSize*10))/2.0+(rectSize)*7,height -(rectSize*3),rectSize,rectSize);
    //        rect((width - (rectSize*10))/2.0+(rectSize)*8,height -(rectSize*3),rectSize,rectSize);
    //           rect((width - (rectSize*10))/2.0+(rectSize)*9,height -(rectSize*3),rectSize,rectSize);

    //             //secondrow
    //           rect((width - (rectSize*9))/2.0,height -(rectSize*2) ,rectSize,rectSize);
    //           rect((width - (rectSize*9))/2.0+(rectSize),height -(rectSize*2),rectSize,rectSize);
    //            rect((width - (rectSize*9))/2.0+(rectSize)*2,height -(rectSize*2),rectSize,rectSize);
    //                rect((width - (rectSize*9))/2.0+(rectSize)*3,height -(rectSize*2),rectSize,rectSize);
    //                    rect((width - (rectSize*9))/2.0+(rectSize)*4,height -(rectSize*2),rectSize,rectSize);
    //                        rect((width - (rectSize*9))/2.0+(rectSize)*5,height -(rectSize*2),rectSize,rectSize);
    //                            rect((width - (rectSize*9))/2.0+(rectSize)*6,height-(rectSize*2),rectSize,rectSize);
    //                                rect((width - (rectSize*9))/2.0+(rectSize)*7,height -(rectSize*2),rectSize,rectSize);
    //                                    rect((width - (rectSize*9))/2.0+(rectSize)*8,height -(rectSize*2),rectSize,rectSize);

    //                                    //thirdrow
    //                                              rect(((width - (rectSize*7))/2.0+(rectSize))-rectSize*2.5,height -(rectSize),rectSize*0.75,rectSize);
    //                                                rect(((width - (rectSize*7))/2.0+(rectSize))-rectSize*1.75,height -(rectSize),rectSize*0.75,rectSize);
    //                                        rect((width - (rectSize*7))/2.0,height -(rectSize) ,rectSize,rectSize);
    //                                         rect((width - (rectSize*7))/2.0+(rectSize),height -(rectSize),rectSize,rectSize);
    //                                           rect((width - (rectSize*7))/2.0+(rectSize)*2,height -(rectSize),rectSize,rectSize);
    //                                               rect((width - (rectSize*7))/2.0+(rectSize)*3,height -(rectSize),rectSize,rectSize);
    //                                                   rect((width - (rectSize*7))/2.0+(rectSize)*4,height -(rectSize),rectSize,rectSize);
    //                                                       rect((width - (rectSize*7))/2.0+(rectSize)*5,height -(rectSize),rectSize,rectSize);
    //                                                           rect((width - (rectSize*7))/2.0+(rectSize)*6,height -(rectSize),rectSize,rectSize);
    //                                                           rect((width - (rectSize*7))/2.0+(rectSize)*7,height -(rectSize),rectSize*1.5,rectSize);









    //second keyboard



    //firstrow

    //rect((width - (rectSize*10))/2.0,height -(rectSize*3) ,rectSize,rectSize);
    //rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize*3),rectSize,rectSize);
    //  rect((width - (rectSize*10))/2.0+(rectSize)*2,height-(rectSize*3),rectSize,rectSize);
    //   rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize*3),rectSize,rectSize);
    //    rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize*3),rectSize,rectSize);
    //     rect((width - (rectSize*10))/2.0+(rectSize)*5,height-(rectSize*3),rectSize,rectSize);
    //      rect((width - (rectSize*10))/2.0+(rectSize)*6,height-(rectSize*3),rectSize,rectSize);
    //         rect((width - (rectSize*10))/2.0+(rectSize)*7,height -(rectSize*3),rectSize,rectSize);
    //      rect((width - (rectSize*10))/2.0+(rectSize)*8,height -(rectSize*3),rectSize,rectSize);
    //         rect((width - (rectSize*10))/2.0+(rectSize)*9,height -(rectSize*3),rectSize,rectSize);

    //           //secondrow
    //         rect((width - (rectSize*10))/2.0,height -(rectSize*2) ,rectSize,rectSize);
    //         rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize*2),rectSize,rectSize);
    //          rect((width - (rectSize*10))/2.0+(rectSize)*2,height -(rectSize*2),rectSize,rectSize);
    //              rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize*2),rectSize,rectSize);
    //                  rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize*2),rectSize,rectSize);
    //                      rect((width - (rectSize*10))/2.0+(rectSize)*5,height -(rectSize*2),rectSize,rectSize);
    //                          rect((width - (rectSize*10))/2.0+(rectSize)*6,height-(rectSize*2),rectSize,rectSize);
    //                              rect((width - (rectSize*10))/2.0+(rectSize)*7,height -(rectSize*2),rectSize,rectSize);
    //                                  rect((width - (rectSize*10))/2.0+(rectSize)*8,height -(rectSize*2),rectSize,rectSize);
    //                                      rect((width - (rectSize*10))/2.0+(rectSize)*9,height -(rectSize*2),rectSize,rectSize);

    //                                  //thirdrow
    //                                         rect((width - (rectSize*10))/2.0,height -(rectSize) ,rectSize,rectSize);
    //         rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize),rectSize,rectSize);
    //          rect((width - (rectSize*10))/2.0+(rectSize)*2,height -(rectSize),rectSize,rectSize);
    //              rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize),rectSize,rectSize);
    //                  rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize),rectSize,rectSize);
    //                      rect((width - (rectSize*10))/2.0+(rectSize)*5,height -(rectSize),rectSize,rectSize);
    //                          rect((width - (rectSize*10))/2.0+(rectSize)*6,height-(rectSize),rectSize,rectSize);
    //                              rect((width - (rectSize*10))/2.0+(rectSize)*7,height -(rectSize),rectSize,rectSize);
    //                                  rect((width - (rectSize*10))/2.0+(rectSize)*8,height -(rectSize),rectSize,rectSize);
    //                                      rect((width - (rectSize*10))/2.0+(rectSize)*9,height -(rectSize),rectSize,rectSize);



    ///third keyboard

    //first row
    //rect((width - (rectSize*10))/2.0,height -(rectSize*2) ,rectSize,rectSize);
    // rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize*2),rectSize,rectSize);
    //   rect((width - (rectSize*10))/2.0+(rectSize)*2,height-(rectSize*2),rectSize,rectSize);
    //    rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize*2),rectSize,rectSize);
    //     rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize*2),rectSize,rectSize);
    //      rect((width - (rectSize*10))/2.0+(rectSize)*5,height-(rectSize*2),rectSize,rectSize);
    //       rect((width - (rectSize*10))/2.0+(rectSize)*6,height-(rectSize*2),rectSize,rectSize);
    //          rect((width - (rectSize*10))/2.0+(rectSize)*7,height -(rectSize*2),rectSize,rectSize);
    //       rect((width - (rectSize*10))/2.0+(rectSize)*8,height -(rectSize*2),rectSize,rectSize);
    //          rect((width - (rectSize*10))/2.0+(rectSize)*9,height -(rectSize*2),rectSize,rectSize);

    //                     //second row
    //                      rect((width - (rectSize*10))/2.0,height -(rectSize) ,rectSize,rectSize);
    // rect((width - (rectSize*10))/2.0+(rectSize),height -(rectSize),rectSize,rectSize);
    //   rect((width - (rectSize*10))/2.0+(rectSize)*2,height-(rectSize),rectSize,rectSize);
    //    rect((width - (rectSize*10))/2.0+(rectSize)*3,height -(rectSize),rectSize,rectSize);
    //     rect((width - (rectSize*10))/2.0+(rectSize)*4,height -(rectSize),rectSize,rectSize);
    //     rect((width - (rectSize*7))/2.0+(rectSize)*7,height -(rectSize),rectSize*1.5,rectSize);

    //}



mouseOver();

    break;
    //page 3
      case 3:
      if(notifPass == true){
              exitFunc();
       textSize(45);
      textAlign(CENTER,CENTER);
      textLeading(55);
    background(0);
     exitFunc();
    text("The ranking of the works, you have successfully voted on,\n will be revealed once the poll is complete or exited\n by clicking the x button in the upper left corner.",width/2.0,height/2.0);

    
    
    }else{
      
   
      
 if(votedStatues == folder.list().length){
 
 clickTracker = 4;
 break;
 };
     
   
     
      background(0);
      fill(255);
      textSize(30);
      textAlign(CENTER,RIGHT);
      text(votedStatues + " / "+folder.list().length, width - width/35.0,  width/40.0 );
        
      imageMode(CENTER);
      img = loadImage( statue_image_paths.get(votedStatues ));
 

     
        

            float AR = ( float(img.width)/ float(img.height)) ;

   
   
           
        image(img, width/2.0, height/2.8,  height/1.55 * AR, height/1.55);
        
        
        
        
        
        if(voted != 10){
        String target =  statue_image_paths.get(votedStatues);          
       
  

         
          int index = target.lastIndexOf('\\');
      
         jsonScore =  loadJSONObject(statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
            int score;
         switch(voted){
         
         case 1: 
         score = jsonScore.getInt("scoreone");
         jsonScore.setInt("scoreone", score + 1);
         saveJSONObject(jsonScore,statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
         break;
          case 2: 
          score = jsonScore.getInt("scoretwo");
         jsonScore.setInt("scoretwo", score + 1);
         saveJSONObject(jsonScore,statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
         break;
          case 3: 
            score = jsonScore.getInt("scorethree");
         jsonScore.setInt("scorethree", score + 1);
         saveJSONObject(jsonScore,statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
         break;
          case 4: 
            score = jsonScore.getInt("scorefour");
         jsonScore.setInt("scorefour", score + 1);
         saveJSONObject(jsonScore,statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
         break;
          case 5: 
            score = jsonScore.getInt("scorefive");
         jsonScore.setInt("scorefive", score + 1);
         saveJSONObject(jsonScore,statue_image_paths.get(votedStatues).substring(0,index +1 )+  "score.json");
         break;
         
         }
        // println();
       json.setInt(statue_image_paths.get(votedStatues).substring(index),voted);
        saveJSONObject(json, "/data/voters/"+ (voterCount ) + ".json");
        votedStatues = votedStatues + 1;
        voted = 10;
        }
  
  textSize(60);
 text("How would you rate this artwork?", width/2.0,height/1.32);
 

    textSize(80);
 
   text("2         1         0         1         2", width/2.0,height/1.110);
    textSize(35);
      text("(Please pick 0 if you do not recognize it.)", width/2.0,height/1.018);
   textAlign(CENTER,CENTER);
        textSize(35);
   text(" + ", width/2.0 + width/3.2,height/1.145);
   
      text(" — ", width/2.0 - width/3.2,height/1.1445);
      
      rectMode(CENTER);
      noFill();

      coordinates1 = arraymaker(width/1.9999, height/1.139,width/25.0, width/25.0);

      

      coordinates2 =  arraymaker(width/1.9999 + (width/7.6), height/1.139,width/25.0, width/25.0);

         coordinates3 =  arraymaker(width/1.9999 + (width/7.6)*2, height/1.139,width/25.0, width/25.0);
 
        coordinates4 =   arraymaker(width/1.9999 - (width/7.6)*2, height/1.139,width/25.0, width/25.0);

 coordinates5 =   arraymaker(width/1.9999 - (width/7.6), height/1.139,width/25.0, width/25.0);

      
      mouseOver();
      

   
     
      exitFunc();
    }
      break;
      case 4:
      background(0);
      textFont(font);
      textAlign(CENTER,CENTER);
       textSize(50);
      text("Thank you for voting!", width/2.0, height/10.0);
     // results_list(folder, statue_list, scroll_num2);
         textSize(38);
         
     ranking(folder, statue_list, scroll_num2);
      break;
      
        case 10:
      background(0);
      textFont(font);
      textAlign(CENTER,CENTER);
       textSize(50);
      text("Thank you for voting!", width/2.0, height/10.0);
     // results_list(folder, statue_list, scroll_num2);
         textSize(38);
     ranking(folder, statue_list, scroll_num2);
      break;
  }
}
