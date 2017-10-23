function [goodCentres, goodRadii] = red_detection(Iin)
Igray = gray_adjust(Iin);
[hue,saturation,value,Ihsv] = hsv_adjust_gaus(Iin);
[Mred, Mhue, Msaturation, Mvalue] = hsv_mask_gaus(hue,saturation,value);
%BW = edge_adjust(Igray);
%M = Mred; %& BW;
BW = edge_adjust(Igray);
M=Mred;

%M= morphological_adjust(M);
rRange = [16 64];

[centersR, radiiR,m] = imfindcircles(M,rRange,'Method','PhaseCode');
goodCentres = [];
goodRadii = [];
if size(m,2)>0
goodM = m(1)-0.1;
else
    goodM = 0;
end
centersR = round(centersR);
radiiR = round(radiiR);
imshow(imoverlay(hsv2rgb(Ihsv), M, 'red'));
%if size(radiiR,2)~=0
%[centersB, radiiB] = imfindcircles(BW,rRange,'Method','TwoStage');
%viscircles(centersB, radiiB,'EdgeColor','b');
%end
for i = 1:size(radiiR,1)
    %Sign =  Iin(centersR(i,2)-radiiR(i):centersR(i,2)+radiiR(i),centersR(i,1)-radiiR(i):centersR(i,1)+radiiR(i),:);
    %m = mean2(imfilter(rgb2gray(Sign), fspecial('sobel')))
    
    goodCentres(end+1,:) = centersR(i,:);
      goodRadii(end+1) = radiiR(i);
    
end
%     goodCentres = centersR;
%     goodRadii = radiiR;
%imshow(imoverlay(Iin, M, 'green'));
viscircles(goodCentres, goodRadii,'EdgeColor','w');
end