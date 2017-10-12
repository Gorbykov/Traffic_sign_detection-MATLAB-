function [H, S, V] = hsv_adjust(Iin)
    Ihsv = rgb2hsv(Iin);
    H = Ihsv(:,:, 1);
    S = Ihsv(:,:, 2);
    V = Ihsv(:,:, 3);
end