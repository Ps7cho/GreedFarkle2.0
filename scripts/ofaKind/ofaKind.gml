/// ofaKind(Number);
/// @argument0 hand
/// @argument1 number

var hand = argument0;
var number = argument1;

ds_list_sort(hand,true);
var numb = ds_list_size(hand);
if numb >= number{
	var list = ds_list_create();
	var listpos = ds_list_create();
	for (var rank = 0; rank <6; rank++){
		for (var i=0; i < numb; i++){
			var val = ds_list_find_value(hand, i);
			if val = rank {
				ds_list_add(list,val);
				if ds_list_size(list) = number{
					for (var f=number; f >= 0 ; f--){
						var pos = ds_list_find_index(hand, val);
						if pos >= 0 {
							ds_list_delete(hand,pos);
						}
					}
					ds_list_destroy(list);
					return val;	
				}
			}else{
				ds_list_clear(list);
			}
		}
	}
ds_list_destroy(list);
}
return -1;