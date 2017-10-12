function [M, Hmask,Smask,Vmask] = hsv_mask(H,S,V)
    Hmask = ((H > 0.7) & (H < 1));
    Smask = (S > 0.2) & (S < 1);
    Vmask = (V > 0.2) & (V < 1);    
    M = Hmask & Smask & Vmask;
end