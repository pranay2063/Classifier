% Spam filter tool to classify emails as spam or non-spam
% This is an optional ungraded task of Coursera ML STANFORD course 
% I am using one of the powerful supervised learning algorithms called SVM
% SVM (Support Vector Machines)
% The filter is trained using SpamAssassin Public Corpus dataset

% The kernel or similarity function used is linear Kernel (or no kernel)  

%% =========== Part 1: Train Linear SVM for Spam Classification ========
%  In this section, train a linear classifier to determine if an
%  email is Spam or Not-Spam.

% Load the dataset
% There will be X,y in the environment

load('TrainData.mat');
% load('ValidData.mat');

fprintf('\nTraining Linear SVM (Spam Classification)\n')
printf('(this may take 1 to 2 minutes) ...\n')

% t_C = [0.1 0.3];

C = 0.03;
% mx = -1;

% for i=1:length(t_C)
%     t_model = svmTrain(X, y, t_C(i), @linearKernel);
%     t_p = svmPredict(t_model, Xval);
%     t_acc = sum(t_p == yval)/size(yval, 1);
%     if t_acc > mx 
%        C = t_C(i);
%        mx  = t_acc;	  	
%     end
% end

% After finding the proper C , obtain training data 
model = svmTrain(X, y, C, @linearKernel);
p_train = svmPredict(model, X);
% p_valid = svmPredict(model, Xval);
train_acc = (sum(p_train == y)/size(y,1)) * 100;
% valid_acc = (sum(p_valid == yval)/size(yval,1)) * 100;

fprintf('\nTraining accuracy = %d\n', train_acc);
% fprintf('\nCross Validation accuracy = %d\n', valid_acc);
pause;


%% =================== Part 4: Test Spam Classification ================
% After training the classifier, we can evaluate it on a test set.

load('TestData.mat');

p_test = svmPredict(model, Xtest1);
test_acc = (sum(p_test == ytest1)/size(ytest1,1)) * 100;

fprintf('\nTest accuracy = %d\n', test_acc);

%% =================== Part 6: Try Your Own Emails =====================
% After training the filter or classifier, it can be used to evaluate any email

filename = 'spamSample2.txt';

file_contents = readFile(filename);
word_indices  = processEmail(file_contents);
x             = emailFeatures(word_indices);

p_sample = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p_sample);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');













