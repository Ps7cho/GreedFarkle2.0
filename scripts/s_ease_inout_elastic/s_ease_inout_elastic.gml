///s_ease_inout_elastic(start, end, position, <elasticity 1-0>, <duration>,)
var _pos = argument[2];
var _chng = argument[1]-argument[0];
var _mid = (argument[0]+argument[1]) / 2;
var _e=.3;
if(argument_count>3)
  _e=argument[3];
var _d = 5;
if(argument_count>4)
  _d=argument[4];

if (_pos < .5)
  return s_ease_in_elastic(argument[0],_mid,_pos*2,_e,_d)
else
  return s_ease_out_elastic(_mid,argument[1],(_pos-.5)*2,_e,_d);