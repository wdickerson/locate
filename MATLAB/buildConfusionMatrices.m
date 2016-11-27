% Make a confusion matrix from the question images!
mainConfMatrix = evaluate(mainClassifier, mainTestSet);
mainNightConfMatrix = evaluate(mainClassifier, mainNightTestSet);

selfConfMatrix = evaluate(selfClassifier, selfTestSet);
selfNightConfMatrix = evaluate(selfClassifier, selfNightTestSet);
