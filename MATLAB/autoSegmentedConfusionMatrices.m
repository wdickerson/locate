% Make a confusion matrix from the question images!
mainConfMatrix12 = evaluate(mainClassifier12, mainTestSet12);
mainNightConfMatrix12 = evaluate(mainClassifier12, mainNightTestSet12);

selfConfMatrix12 = evaluate(selfClassifier12, selfTestSet12);
selfNightConfMatrix12 = evaluate(selfClassifier12, selfNightTestSet12);
