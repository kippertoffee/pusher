
require "Globals"
require "Definitions"
require "Pitches"

require "Data/PushColors"
require "Data/PushCommands"
require "Data/PushControls"

require "OscClient"
require "OscVoiceMgr"

require "Pusher"
require "PusherActivity"
require "PusherControl"
require "PusherMidi"
require "PusherWidget"

require "Activity/RootActivity"
require "Activity/TransportActivity"
require "Activity/PatternActivity"
require "Activity/NotesActivity"

require "Activity/DisplayActivity"
require "Activity/DeviceDialog"
require "Activity/ScaleDialog"
require "Activity/TrackDialog"
require "Activity/VolumeDialog"

require "Control/Button"
require "Control/Dial"
require "Control/Display"
require "Control/Pad"

local pusher = nil

function start_pusher()
   if (pusher ~= nil) then
      pusher:release()
   end
   pusher = Pusher("Ableton Push MIDI 1", "Ableton Push MIDI 1")
end

renoise.tool():add_menu_entry {
  name = "Main Menu:Tools:Pusher:Start Pusher",
  invoke = start_pusher
}

function timed_start()
   LOG("================================================================================")
   start_pusher()
   renoise.tool():remove_timer(timed_start)
end

renoise.tool():add_timer(timed_start,500)
