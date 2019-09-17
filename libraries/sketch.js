var Button1x, Button1y, Button2x, Button2y, Button3x, Button3y, Button4x, Button4y, BellButtonx, BellButtony, HelpButtonx, HelpButtony;
var NumButtonSize = 90, BellButtonSize = 100, HelpButtonSize = 250;
var ButtonHighlight, NumButtonColor = 255;
var desiredFloor, baseFloor;
var img;
var sound1, sound2, sound3, sound4, soundbell, soundhelp;
var Button1Over = false, Button2Over = false, Button3Over = false, Button4Over = false, BellButtonOver = false, HelpButtonOver = false;
function preload() {
    soundFormats('wav');
    img = loadImage('data/infinity_gauntlet.png');

    //Load Sound for Button 1
    sound1 = loadSound('data/sound1.wav');

    //Load Sound for Button 2
    sound2 = loadSound('data/sound2.wav');

    //Load Sound for Button 3
    sound3 = loadSound('data/sound3.wav');

    //Load Sound for Button 4
    sound4 = loadSound('data/sound4.wav');

    //Load Sound for Bell Button
    soundbell = loadSound('data/soundbell.wav');

    //Load Sound for Help Button
    soundhelp = loadSound('data/soundhelp.wav');
}

function setup(){
    createCanvas(1000, 1500);
    baseFloor = "--";
    desiredFloor = baseFloor;
  
    ButtonHighlight = color(0);
    //Button 1 Loc
    Button1x = 195;
    Button1y = 640;

    //Button 2 Loc
    Button2x = 315;
    Button2y = 583;

    //Button 3 Loc
    Button3x = 435;
    Button3y = 550;

    //Button 4 Loc
    Button4x = 570;
    Button4y = 625;

    //Bell Button Loc
    BellButtonx = 675;
    BellButtony = 807;

    //Help Button Loc
    HelpButtonx = 400;
    HelpButtony = 820;

    ellipseMode(CENTER);
}

function draw(){
    update(mouseX, mouseY);
    background(0);
    image(img, 0, 0);


    textSize(48);
    fill(0);
    text(desiredFloor, 420, 1235);


    //Button 1 Display
    fill(0, 0);
    ellipse(Button1x, Button1y, NumButtonSize, NumButtonSize);

    //Button 2 Display
    fill(0, 0);
    ellipse(Button2x, Button2y, NumButtonSize, NumButtonSize);

    //Button 3 Display
    fill(0, 0);
    ellipse(Button3x, Button3y, NumButtonSize, NumButtonSize);

    //Button 4 Display
    fill(0, 0);
    ellipse(Button4x, Button4y, NumButtonSize, NumButtonSize);

    //Bell Button Display
    fill(0, 0);
    ellipse(BellButtonx, BellButtony, BellButtonSize, BellButtonSize);

    //Help Button Display
    fill(0, 0);
    ellipse(HelpButtonx, HelpButtony, HelpButtonSize, HelpButtonSize);

}

function update(x,y){
    //Button 1 Update
    if (OverButton(Button1x, Button1y, NumButtonSize)) {
        Button1Over = true;
    }
    else {
        Button1Over = false;
    }

    //Button 2 Update
    if (OverButton(Button2x, Button2y, NumButtonSize)) {
        Button2Over = true;
    }
    else {
        Button2Over = false;
    }

    //Button 3 Update
    if (OverButton(Button3x, Button3y, NumButtonSize)) {
        Button3Over = true;
    }
    else {
        Button3Over = false;
    }

    //Button 4 Update
    if (OverButton(Button4x, Button4y, NumButtonSize)) {
        Button4Over = true;
    }
    else {
        Button4Over = false;
    }

    //Bell Button Update
    if (OverButton(BellButtonx, BellButtony, BellButtonSize)) {
        BellButtonOver = true;
    }
    else {
        BellButtonOver = false;
    }

    //Help Button Update
    if (OverButton(HelpButtonx, HelpButtony, HelpButtonSize)) {
        HelpButtonOver = true;
    }
    else {
        HelpButtonOver = false;
    }
}

function touchStarted(){
    //Button 1 Mouse Pressed
    if (Button1Over) {
        sound1.play();
        desiredFloor = "1";
    }

    //Button 2 Mouse Pressed
    if (Button2Over) {
        sound2.play();
        desiredFloor = "2";
    }

    //Button 3 Mouse Pressed
    if (Button3Over) {
        sound3.play();
        desiredFloor = "3";
    }

    //Button 4 Mouse Pressed
    if (Button4Over) {
        sound4.play();
        desiredFloor = "4";
    }

    //Bell Button Mouse Pressed
    if (BellButtonOver) {
        soundbell.play();
    }

    //Help Button Mouse Pressed
    if (HelpButtonOver) {
        soundhelp.play();
    }
}

function OverButton(x,y,diameter){
    var disX = x - touchX;
    var disY = y - touchY;
    if (sqrt(sq(disX) + sq(disY)) < diameter / 2) {
        return true;
    } else {
        return false;
    }
}