function [goodCentres, goodRadii] = red_detection(Iin)
    Igray = gray_adjust(Iin);
    [hue,saturation,value] = hsv_adjust(Iin);
    [Mred, Mhue, Msaturation, Mvalue] = hsv_mask(hue,saturation,value); 
    %BW = edge_adjust(Igray);
    M = Mred; %& BW;
    %M= morphological_adjust(M);
    rRange = [16 64];
    [centersR, radiiR] = imfindcircles(M,rRange,'Method','TwoStage','ObjectPolarity','bright');
    goodCentres = [];
    goodRadii = [];
    centersR = round(centersR);
    radiiR = round(radiiR);
    goodCentres = centersR;
    goodRadii = radiiR;
    
    
    imshow(imoverlay(Iin, M, 'green'));    
    viscircles(goodCentres, goodRadii,'EdgeColor','w');
end