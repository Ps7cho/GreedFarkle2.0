randomize();
Hand = ds_list_create();

globalvar numbDice, numbFrozen, numbPlayers, numbAI, Points, roundPoints, threshold, winningTotal,
block, currentPlayer, startMenu, OptionMenu, Setup, Name, WinnerColor, textColor, Wins, scores;


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
OptionMenu = false;
OnlineMenu = false;
currentPlayer = -1;
lobby = false;
Tutorial = false;
EditRoom = false;
playSelect = false;
Name = "Player";
TempName = Name;

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
draw_set_color(textColor);

doubleTap = 0;
frame = 0;

Width = room_width/2;
Height = room_height/2;
xx = room_width/2;
xx2 = (room_width/6);
xx3 = (room_width/6)*5;
tweening = 0;
x1 = room_width/2;
x2 = (room_width/6);
x3 = (room_width/6)*5;
y1 = 50;
y2 = 120;
y3 = 190;
y4 = 230;
y5 = 260;
y6 = 330;

if file_exists("Save1.ini"){
	loadLocalGame();
}else{
saveLocalGame();
}
Humans = numbPlayers-numbAI;

setupStartMenu();

