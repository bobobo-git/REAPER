-- Schleife durch alle Tracks in Ihrem Projekt
reaper.ClearConsole()
for i = 0, reaper.CountTracks(0) - 1 do
    local track = reaper.GetTrack(0, i)
    local retval,track_name = reaper.GetTrackName(track, "")
    
    -- Schleife durch alle Items auf dem aktuellen Track
    for j = 0, reaper.CountTrackMediaItems(track) - 1 do
        local item1 = reaper.GetTrackMediaItem(track, j)
        local item1_start = reaper.GetMediaItemInfo_Value(item1, "D_POSITION")
        local item1_end = item1_start + reaper.GetMediaItemInfo_Value(item1, "D_LENGTH")
        local item1_name = reaper.GetTakeName(reaper.GetActiveTake(item1))
        
        -- Vergleichen Sie dieses Item mit allen anderen Items auf dem gleichen Track
        for k = j + 1, reaper.CountTrackMediaItems(track) - 1 do
            local item2 = reaper.GetTrackMediaItem(track, k)
            local item2_start = reaper.GetMediaItemInfo_Value(item2, "D_POSITION")
            local item2_end = item2_start + reaper.GetMediaItemInfo_Value(item2, "D_LENGTH")
            local item2_name = reaper.GetTakeName(reaper.GetActiveTake(item2))
            
            -- Überprüfen Sie, ob die Items genau überlappen
            if (item1_start == item2_start and item1_end == item2_end) then
                -- Items überlappen, geben Sie die Informationen aus
                reaper.ShowConsoleMsg("Übereinanderliegende Items auf Track " .. i + 1 .. ": " .. track_name .. "\n")
                reaper.ShowConsoleMsg("Item 1 Name: " .. item1_name .. "\n")
                reaper.ShowConsoleMsg("Item 1 Position: " .. item1_start .. " - " .. item1_end .. "\n")
                reaper.ShowConsoleMsg("Item 2 Name: " .. item2_name .. "\n")
                reaper.ShowConsoleMsg("Item 2 Position: " .. item2_start .. " - " .. item2_end .. "\n")
            end
        end
    end
end

