myMainTestSet = mainNightTestSet;
mySelfTestSet = selfNightTestSet;
myLabels = string(mainClassifier.Labels);

l = length(myMainTestSet.Files);
c = length(mainClassifier.Labels);
correct = zeros(l, 1);
guess = zeros(l, 1);

mainGuess = zeros(l, 1);
selfGuess = zeros(l, 1);
mainScores = zeros(l, c);
selfScores = zeros(l, c);
for i=1:l
    [mainG, mainS] = mainClassifier.predict(readimage(myMainTestSet,i));
    [selfG, selfS] = selfClassifier.predict(readimage(mySelfTestSet,i));
    mainGuess(i) = mainG;
    mainScores(i,:) = mainS;
    selfGuess(i) = selfG;
    selfScores(i,:) = selfS;
end

combinedScores = mainScores + selfScores;
manualConfusionMatrix = zeros(c,c);
for k=1:length(combinedScores)
    [myMax, myIndex] = max(combinedScores(k,:));
    guess(k) = myIndex;
    if strcmp(string(mainClassifier.Labels(guess(k))), string(myMainTestSet.Labels(k)))
        correct(k) = 1;
    end
    q = find(myLabels == string(myMainTestSet.Labels(k)));
    manualConfusionMatrix(q, guess(k)) = manualConfusionMatrix(q, guess(k)) + 1;
end

labelCount = countEachLabel(myMainTestSet);
for k=1:length(manualConfusionMatrix)
    manualConfusionMatrix(k,:) = manualConfusionMatrix(k,:) ./ labelCount.Count(k);
end
manualConfusionMatrix
percentCorrect = sum(correct)/length(correct)
