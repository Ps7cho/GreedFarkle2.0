				//recive text from typing
			var text = keyboard_string;
				//replace name value with text 
			ds_list_replace(playerNames,pos,text);// (from startmenu Editbutton)
				//return to lobby
			EditRoom = false;
			lobby = true;
			instance_deactivate_layer("EditRoom");
			instance_activate_layer("Lobby");
			keyboard_virtual_hide();