for k=1:25
    Itest = imread(['test_image/i' int2str(k) '.jpg']);
    M = red_detection(Itest);
    imshow(imoverlay(Itest, M, 'green'));
    B = edge_adjust(rgb2gray(Itest));
    rRange = [15 60];
    [centersB, radiiB] = imfindcircles(B,rRange,'Method','TwoStage'	);
    %     viscircles(centersB, radiiB,'EdgeColor','b');
    [centersR, radiiR] = imfindcircles(M,rRange,'Method','TwoStage'	);
    %     viscircles(centersR, radiiR,'EdgeColor','r');
    goodCentres = [];
    goodRadii = [];
    centersB = round(centersB);
    radiiB = round(radiiB);
    centersR = round(centersR);
    radiiR = round(radiiR);
    for i = 1:size(radiiR)
        for j = 1:size(radiiB)
            if abs(centersB(j) - centersR(i)) <15
                goodCentres(end+1,:) = centersR(i,:);
                goodRadii(end+1) = radiiR(i);
                centersB(i,:) = [0 0];
                radiiB(i) = 0;
            end
        end
    end
    for i =1:size(radiiB)
        if radiiB(i)~=0
            cut = M(centersB(i,2)-radiiB(i):centersB(i,2)+radiiB(i),centersB(i,1)-radiiB(i):centersB(i,1)+radiiB(i));
            if mean(double(cut(:)))>0.3
                goodCentres(end+1,:) = centersB(i,:);
                goodRadii(end+1) = radiiB(i);
            end
        end
    end
    viscircles(goodCentres, goodRadii,'EdgeColor','w');
    for i =1:size(goodRadii)
        Sign =  Itest(goodCentres(i,2)-goodRadii(i):goodCentres(i,2)+goodRadii(i),goodCentres(i,1)-goodRadii(i):goodCentres(i,1)+goodRadii(i),:);
        %Mcircle = strel('disk',round(size(Sign,1)/2));
        Sign = Sign;%.*uint8(Mcircle.Neighborhood);
        imwrite(Sign,['found' int2str(k) '_' int2str(i) '.png' ]);
    end
    pause(0.1);
 end