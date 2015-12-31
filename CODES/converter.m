% Spam filter tool to classify emails as spam or non-spam
% I am using one of the powerful supervised learning algorithms called SVM
% SVM (Support Vector Machines)
% The filter is trained using SpamAssassin Public Corpus dataset

% The kernel or similarity function used is linear Kernel (or no kernel)  


load('file.mat');
load('file2.mat');

y = ones(length(a),1);
save file2.mat X y;

X = [];

for i=1:length(a)
    disp(i); 
    filename = a(i,:);
    file_contents = readFile(filename);
    word_indices  = processEmail(file_contents);
    x = emailFeatures(word_indices);
    X = [X; x'];
             

%save file2.mat X;
save file2.mat X y;





