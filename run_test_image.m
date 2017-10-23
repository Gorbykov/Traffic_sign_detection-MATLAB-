newDirName = ['found_signs_' datestr(datetime('now'),'ddmmyyHHMMSS')];
    mkdir(newDirName);
    
for k=1:25
    Itest = imread(['test_image/i' int2str(k) '.jpg']);
    [goodCentres, goodRadii] = red_detection(Itest);
    cd(newDirName);
    for i =1:size(goodRadii,2)
        Sign =  Itest(goodCentres(i,2)-goodRadii(i):goodCentres(i,2)+goodRadii(i),goodCentres(i,1)-goodRadii(i):goodCentres(i,1)+goodRadii(i),:);
        %Mcircle = strel('disk',round(size(Sign,1)/2));
        Sign = Sign;%.*uint8(Mcircle.Neighborhood);
        imwrite(Sign,['found' int2str(k) '_' int2str(i) '.png' ]);
    end
    title(int2str(k));
    cd('..');
    pause;
end
 