function Igray = gray_adjust(Iin)
    Igray = rgb2gray(Iin);
    Igray = imadjust(Igray);
end