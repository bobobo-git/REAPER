local playing = reaper.GetToggleCommandState(1007)
if playing == 1 then

    tr = reaper.GetTrack(0, 0)
    if tr then
    -- only if track exists
       reaper.SetMediaTrackInfo_Value(tr, "B_MUTE", 1)
   end

     -- Transport: Stop
    reaper.Main_OnCommandEx(1016, 0, 0)
else
    local looping = reaper.GetToggleCommandState(1068)
    if looping == 1 then
        -- Go to start of loop
        reaper.Main_OnCommandEx(40632, 0, 0)
    end
    -- Transport: Play
   tr = reaper.GetTrack(0, 0)
   if tr then
   -- only if track exists
          reaper.SetMediaTrackInfo_Value(tr, "B_MUTE", 0)
   end
   reaper.Main_OnCommandEx(1007, 0, 0)
    
end
