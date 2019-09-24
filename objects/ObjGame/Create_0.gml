randomize();
Hand = ds_list_create();

globalvar numbDice, numbFrozen, numbPlayers, numbAI, Points, roundPoints, threshold, winningTotal,
block, currentPlayer, startMenu, OptionMenu, Setup, Name, WinnerColor, textColor, Wins, scores;


PC = true;

numbDice = 5;
numbPlayers = 3;
numbAI = 2;
Humans = numbPlayers-numbAI;
Points = 0;
roundPoints = 0;
threshold = 400;
winningTotal = 10000;

numbFrozen = 0;
block = false;
Setup = false;
startMenu = true;
currentPlayer = -1;
lobby = false;
Tutorial = false;
EditRoom = false;
playSelect = false;
Name = "Player";

scrColorPalette();

Passed = false;
pass = true;
bustState = false;
Win = noone;
Wins = ds_map_create();
scores = ds_list_create();
AISelectPoints = 0;
AiChooseTurn = -1;
bustTimer1 = -1;
bustTimer2 = -1;
SwitchPlayersTimer = -1;
save = ds_list_create();

AISelectTime = 30;
wait = 80;

playerList = ds_list_create();
playerNames = ds_list_create();
for (var i = 1; i<=10; i++;){
	ds_list_add(playerNames, Name + string(i));
}


WinnerColor = c_aqua;
textColor = c_silver;
Green = make_color_rgb(90,180,100);
Blue = make_color_rgb(120,180,200);
draw_set_color(textColor);
scale = 1;
RPscaleModify = 1;
maxScaleMod = 1.3;

frame = 0;

Margin = 50;

Width = room_width/2;
Height = room_height/2;
xx = room_width/2;
xx2 = (room_width/6);
xx3 = (room_width/6)*5;
tweening = 0;
x1 = room_width/2;
x2 = (room_width/6);
x3 = (room_width/6)*5;
y1 = 50+Margin;
y2 = 120+Margin;
y3 = 190+Margin;
y4 = 230+Margin;
y5 = 260+Margin;
y6 = 330+Margin;



/*if file_exists("Save1.ini"){
	loadLocalGame();
}else{
saveLocalGame();
}
*/
Humans = numbPlayers-numbAI;

setupStartMenu();

server = noone;

BG15 = room_width/105;
BG6 = room_height/150;

for (var i=0; i<BG15; i++){
	for (var j=0; j<BG6; j++){
		instance_create_layer(i*120,j*190,"Instances_2",objBackground);
	}
}
