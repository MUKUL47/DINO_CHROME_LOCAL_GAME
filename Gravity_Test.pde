float h=100,w=250;
float upSpeed=17,downSpeed,e=400;
boolean underGravity=false,canJump=false,enemiesLeft=false;
PImage img,bird;
//
float enemyHeight=random(10,60);
float deBug=abs(w-275);
float enemyPos=510;//random(130,450)
float enemySpeed=4;
float counter=1;
//
void setup(){  
size(500,300);
img=loadImage("back.PNG");
 bird = loadImage("Bird.png");
frameRate(45);
}

void draw(){Graphics();Jump();spawnEnemies();

}

void Graphics(){
background(0); 
image(img, 0,0);
image(bird, h,w,50,50);
text("Score : "+(round(counter*enemySpeed)-4), 10, 12);
text("Speed : "+(enemySpeed-4), 430, 12);

if(gameOverCheck()){noLoop(); text("!!!GAMEOVER!!!", 200,100);}
else{text("PRESS SPACE TO AVOID OBSTACLES", 130, 100);}

}

void Jump(){
  
if(keyPressed && key==' ') canJump=true; 
if(!underGravity && canJump  ){
//Gravity decreases as distance from ground increases
upSpeed-=.5;
w-=upSpeed;
if((int)w<=75){underGravity=true;downSpeed=2;}
}
if(underGravity){
//Gravity increases as distance from ground decreases
downSpeed+=.7;
w+=downSpeed;
if((int)w>=250 ){underGravity=false;canJump=false;upSpeed=17;}
}
stroke(126);
strokeWeight(5);
}

void spawnEnemies(){
if(enemyPos>=-5){
rect(enemyPos,260,20,enemyHeight);enemyPos-=enemySpeed;
}
else{
  enemySpeed+=.19; enemyPos=510; deBug=abs(w-275); enemyHeight=random(5,100);counter++;
  
}}

boolean gameOverCheck(){
if(abs(round(enemyPos-h))<=5.75 && !underGravity ){return true;}
return false;
}
 
