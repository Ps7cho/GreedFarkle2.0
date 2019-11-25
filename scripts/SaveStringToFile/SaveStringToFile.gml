///@des SaveStringToFile Saves a string out to a file.
/// @arg file name
/// @arg string

var filename = argument0;
var String = argument1;

var buffer = buffer_create(string_byte_length(String)+1,buffer_fixed, 1);
buffer_write(buffer, buffer_string, String);
buffer_save(buffer, filename);
buffer_delete(buffer);

//sendPacket(saveBuffer);