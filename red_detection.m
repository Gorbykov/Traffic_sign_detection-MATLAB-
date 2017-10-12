function Iout = red_detection(Iin)
    
    Igray = gray_adjust(Iin);
    [hue,saturation,value] = hsv_adjust(Iin);
    [Mred, Mhue, Msaturation, Mvalue] = hsv_mask(hue,saturation,value); 
    BW = edge_adjust(Igray);
    M = Mred & BW;
    M= morphological_adjust(M);
    Iout = M;
end