/*

This file add placeholders for some ftblib-related
functions, if mod isnt present.

This allow scripts to run without errors.

*/

#modloaded !ftblib
#priority 5000
#reloadable

import crafttweaker.player.IPlayer;

$expand IPlayer$nickname() as string {
  return this.name;
}

$expand IPlayer$nicknameChat() as string {
  return this.name;
}
