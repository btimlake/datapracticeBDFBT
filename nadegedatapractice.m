load Data_RegretEnvy.csv

csvread(/Users/bentimberlake/Documents/MATLAB/datapracticeBDFBT/Data_RegretEnvy.csv, 2, 1)

data = Data_RegretEnvy.csv

choiceduration = DataRegretEnvy(2:4401, 22); % calls entire column of choiceduration
age = DataRegretEnvy(2:4401,3);
allvalues = length(DataRegretEnvy);

% Groups: 1=old 2=young

% Average decision times by
    % age
    
    agecutoff = median(DataRegretEnvy(2:4401,3));
    % call choiceduration for subjects older than median
    
    for i=1:allvalues 
    
        if age < agecutoff;
            averageCD = choiceduration(i)
        end
    end
    
DataRegretEnvy.choiceduration

mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==4))

mean(DataRegretEnvy.choiceduration(DataRegretEnvy.age < 55)) % now that these include the 53-year-old subject, it is the same as group 2 
mean(DataRegretEnvy.choiceduration(DataRegretEnvy.group==2))

mean(DataRegretEnvy.choiceduration(DataRegretEnvy.age > 55)) % now that these exclude the 53-year-old subject, it is the same as group 1 
mean(DataRegretEnvy.choiceduration(DataRegretEnvy.group==1))

Ages = unique(DataRegretEnvy.age); % list all ages
DataRegretEnvy.id(DataRegretEnvy.age==53) % which subject is/are 53?

% use dataset or table

SubjID = unique(DataRegretEnvy.id);
SubjAge = unique(DataRegretEnvy.age(DataRegretEnvy.id==s));
SubjGroup = unique(DataRegretEnvy.group);
SubjSex = unique(DataRegretEnvy.sex);
SubjEdu = unique(DataRegretEnvy.education);
SubjAvgRT='SubjAvgRT'
for s=1:length(SubjID)
averageRT(s) =  mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)));
end

for s=1:length(SubjID)
SubjGroup(s) =  DataRegretEnvy.group(DataRegretEnvy.id==SubjID(s));
end

% labeling attempt: 
T.Properties.RowNames
subjectaverages.Properties.ColumnNames = table(SubjID,SubjAge,SubjGroup,SubjSex,SubjEdu,SubjAvgRT);

%   For summary table: 
%     unique variables: age, group, sex, education
%     averaged variables: choiceduration, 
%   
% make a separate table with averages of RT by subject, maintaining age,
% group, sex and education variables
for s=1:length(SubjID)
subjectaverages(s,:) = [unique(DataRegretEnvy.id(DataRegretEnvy.id==s)) unique(DataRegretEnvy.age(DataRegretEnvy.id==s)) unique(DataRegretEnvy.group(DataRegretEnvy.id==s)) unique(DataRegretEnvy.sex(DataRegretEnvy.id==s)) unique(DataRegretEnvy.education(DataRegretEnvy.id==s)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)))];
end
    % note that it's important to have the rows 's' and the columns ':' in
    % the target variable
    % Is it possible to set variables up before for unique identifiers
    % without creating numerous "for" loops?
    % for now, labeled them by hand
    
SubjAvg = array2table(subjectaverages);

DataRegretEnvy.age(1)

subjectaverages = [SubjID, DataRegretEnvy.age(s), SubjGroup, SubjSex, SubjEdu, averageRT']


   % Average decision times by
    % age
    % call choiceduration for subjects older than median
    
% make a separate table with averages of RT by group
    for g=1:length(unique(DataRegretEnvy.group))
        groupaverages(g,:) = [unique(DataRegretEnvy.group(DataRegretEnvy.group==g)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.group==SubjGroup(g)))];
    end
    
    % call choiceduration for subjects young subjects (group 2)

    
    
    
    
    % diff EV
    
    % trial type (competitive?)
    
    % education
    
    
% Analysis
% look at some averages of decision times
% compare: age
%      dEV
%      competition
%      education?
% 
% look at average rating for each type of outcome, then compare disappointment to regret
% - average w/in subject
% - compare across subjects
% average of scale, for type of outcome (won alone, lost alone, won competitive, lost competitive)

% 
% Effect of R/D on subsequent trial
% 
% Both: work with data in pivot tables and graphs; find some comparisons
%      - Next week: figure out what to pursue in MATLAB