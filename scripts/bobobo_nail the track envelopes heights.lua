--[[
 * ReaScript Name: nail the track envelopes heights
 * About: take all trackenvelopes and fixes the height (adding one pixel and substract afterweards)
 * In TCP when you mousewhell with Ctrl kicked in all tracks will in/decrfease heigt togethrer with all shown traxckenvelopes.
 * If the trackenvelopes got an explicit heigt this heigt is fixed
 * Author: bobobo (standing on the shoulder of giants, say the REAPER forum)
 * Author URI: https://reaper.bobobo.de
 * Repository: GitHub > X-Raym > REAPER-ReaScripts
 * Repository URI: https://github.com/X-Raym/REAPER-ReaScripts
 * Licence: GPL v3
 * Forum Thread: Script (Lua): Scripts for Layering
 * Forum Thread URI: http://forum.cockos.com/showthread.php?t=159961
 * REAPER: 5.0 pre 36
 * Version: 1.1
]]

--[[
 * Changelog:
 * v1.1 (2015-06-24)
  # Optimization
 * v1.0 (2015-06-09)
  + Initial Release
]]

unique_tracks = {}
trackcount = reaper.CountTracks()-1

for i = 0, trackcount do
  track = reaper.GetTrack(0, i) 
  envcount = reaper.CountTrackEnvelopes(track)-1
  for j = 0, envcount do
    --doit(track,j)
    env=reaper.GetTrackEnvelope(track, j)
    hh=reaper.GetEnvelopeInfo_Value(env, "I_TCPH")
    ok, env_chunk = reaper.GetEnvelopeStateChunk(env, "", false)
    hhn=hh+1 
    env_chunk = env_chunk:gsub('LANEHEIGHT %d+ ', 'LANEHEIGHT '..math.tointeger(hhn)..' ')
    reaper.SetEnvelopeStateChunk(env, env_chunk, 0) 
    env_chunk = env_chunk:gsub('LANEHEIGHT %d+ ', 'LANEHEIGHT '..math.tointeger(hh)..' ')
    reaper.SetEnvelopeStateChunk(env, env_chunk, 0) 
  end
end

