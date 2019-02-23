///ease_in_elastic(start, end, position, <elasticity 1-0>, <duration>,)
var _s,_p;
var _chng = argument[1]-argument[0];
var _e=.3;
if(argument_count>3)
  _e=argument[3];
var _d = 5;
if(argument_count>4)
  _d=argument[4];

var _pos = argument[2];
if (_pos == 0 || _chng == 0) 
    return argument[0]; 
else if (_pos == 1) 
    return argument[1];

_p = _d * _e;

if (sign(_chng) == -1) 
  _s = _p * 0.25;
else
  _s = _p / (2 * pi) * arcsin (1);


return -(_chng * power(2,10 * (--_pos)) * sin((_pos * _d - _s) * (2 * pi) / _p)) + argument[0];