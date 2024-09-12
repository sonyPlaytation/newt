/// @description final countdown

doesBlink = endVar;
if (instance_exists(owner)) variable_instance_set(owner, variableString, doesBlink);

alarm_set(0, -1);
instance_destroy();


