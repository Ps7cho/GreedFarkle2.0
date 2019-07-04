///sendPacket(MessageID,BufferSize,Data...);
/// @arg messageID
/// @arg buffersize
/// @arg data
/// @arg buffersize...
/// @arg data...
var messageID = argument[0];




var count = argument_count;

	buffer_seek(buffer, buffer_seek_start, 0);
	buffer_write(buffer, buffer_u8, GameID);
	buffer_write(buffer, buffer_u8, messageID);
	if count > 1 {
		for (var i = 1; i < count; i+=2;){
			var size = argument[i];
			switch size{
				case 1: var type = buffer_bool;		break;
				case 2: var type = buffer_string;	break;
				case 8: var type = buffer_u8;		 break;
				case 16: var type = buffer_u16;		 break;
				case 32: var type = buffer_u32;		 break;
			}
			buffer_write(buffer, type, argument[i+1]);	
		}
	}
	network_send_packet(socket, buffer, buffer_tell(buffer));
	