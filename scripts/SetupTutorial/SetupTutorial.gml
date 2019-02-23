///SetupTutorial

hand0 = ds_list_create(); 
hand0[| 0] = 2;
hand0[| 1] = 1;
hand0[| 2] = 5;
hand0[| 3] = 2;
hand0[| 4] = 3;
hand0[| 5] = "Use Space bar or double tap to roll the dice";


setupPlayers(1);

Hand = hand0;
TutorialHands();

hand1 = ds_list_create(); 
hand1[| 0] = 2;
hand1[| 1] = 4;
hand1[| 2] = 5;
hand1[| 3] = 0;
hand1[| 4] = 3;
hand1[| 5] = @"1 or 5 are the only scoring dice on their own.
Click or tap them to select";



hand2 = ds_list_create();
hand2[| 0] = 3;
hand2[| 1] = 3;
hand2[| 2] = 3;
hand2[| 3] = 2;
hand2[| 4] = 5;
hand2[| 5] = "3 of a kind is the number on the dice x100";

hand3 = ds_list_create();
hand3[| 0] = 3;
hand3[| 1] = 3;
hand3[| 2] = 3;
hand3[| 3] = 3;
hand3[| 4] = 5;
hand3[| 5] = "4 of a kind is the number x200";

hand4 = ds_list_create();
hand4[| 0] = 3;
hand4[| 1] = 3;
hand4[| 2] = 3;
hand4[| 3] = 3;
hand4[| 4] = 3;
hand4[| 5] = "5 of a kind is the number x400";

hand5 = ds_list_create();
hand5[| 0] = 0;
hand5[| 1] = 1;
hand5[| 2] = 2;
hand5[| 3] = 3;
hand5[| 4] = 4;
hand5[| 5] = "Straight is worth 2000";

hand6 = ds_list_create();
hand6[| 0] = 3;
hand6[| 1] = 3;
hand6[| 2] = 5;
hand6[| 3] = 1;
hand6[| 4] = 3;
hand6[| 5] = "Getting over " +string(threshold)+ " for the first time, lets you pass and keep your points.";

hand7 = ds_list_create();
hand7[| 0] = 3;
hand7[| 1] = 2;
hand7[| 2] = 5;
hand7[| 3] = 1;
hand7[| 4] = 3;
hand7[| 5] = "If you dont get any scoring Dice, you Bust!";


Setup = true;