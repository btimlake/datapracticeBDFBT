load Data_RegretEnvy.csv

csvread(/Users/bentimberlake/Documents/MATLAB/datapracticeBDFBT/Data_RegretEnvy.csv, 2, 1)

data = Data_RegretEnvy.csv

choiceduration = DataRegretEnvy(:, 22); % calls entire column of choiceduration
age = DataRegretEnvy(:,3);
allvalues = height(DataRegretEnvy);

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
% SubjGroup = unique(DataRegretEnvy.group);
SubjSex = unique(DataRegretEnvy.sex);
SubjEdu = unique(DataRegretEnvy.education);
SubjAvgRT='SubjAvgRT'
for s=1:length(SubjID)
averageRT(s) =  mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)));
end

for s=1:length(SubjID)
SubjGroup(s) =  unique(DataRegretEnvy.group(DataRegretEnvy.id==SubjID(s)));
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
    
SubjAvg = array2table(subjectaverages); % turn this info into a table
SubjAvg.Properties.VariableNames{1} = 'id'; % change labels
SubjAvg.Properties.VariableNames{2} = 'age';
SubjAvg.Properties.VariableNames{3} = 'group';
SubjAvg.Properties.VariableNames{4} = 'sex';
SubjAvg.Properties.VariableNames{5} = 'education';
SubjAvg.Properties.VariableNames{6} = 'avgRT';


DataRegretEnvy.age(1)

% show number of trials for each subject
for s=1:length(SubjID)
subjecttrials(s,:) = [unique(DataRegretEnvy.id(DataRegretEnvy.id==s)) max(DataRegretEnvy.trial(DataRegretEnvy.id==s))];
end

% subjectaverages = [SubjID, DataRegretEnvy.age(s), SubjGroup, SubjSex, SubjEdu, averageRT']


   % Average decision times by
    % age
    % call choiceduration for subjects older than median
    % call choiceduration for subjects young subjects (group 2)
    
% make a separate table with averages of RT by group
% for some reason, have to change syntax of last variable from how it is in
% the per-subject RT. I.e. here: DataRegretEnvy.group==g
% Actually never mind, this isn't how we should do group averages. We
% should base them on subjectaverage avgRT
    for g=1:length(unique(DataRegretEnvy.group));
        groupaverages(g,:) = [unique(DataRegretEnvy.group(DataRegretEnvy.group==g)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.group==g))];
    end
    
    % this one caculates group avg based on per-subj avgRT, rather than
    % averaging all trials. In this case, it is the same, because all
    % subjects conducted exactly 100 trials.
    for g=1:length(unique(SubjAvg.group));
        groupaveragesA(g,:) = [unique(SubjAvg.group(SubjAvg.group==g)) mean(SubjAvg.avgRT(SubjAvg.group==g))];
    end
    
GroupAvg = array2table(groupaverages); % turn this info into a table
GroupAvg.Properties.VariableNames{1} = 'group'; % change labels
GroupAvg.Properties.VariableNames{2} = 'avgRT';

    Players = unique(DataRegretEnvy.players)
    % trial type (competitive?)
% make a separate table with averages of RT by group, maintaining
% competition variable

% FIRST need to make a SubjAvg table with two avgRTs for each subject,
% depending on player condition

playerNumbers = p-1

for s=1:length(SubjID)
    for p=1:length(unique(DataRegretEnvy.players));
        playerNumbers = p-1;
subjectPlayTypeAverages(p,:) = [unique(DataRegretEnvy.id(DataRegretEnvy.id==s)) DataRegretEnvy.id(s)(DataRegretEnvy.players)==playerNumbers unique(DataRegretEnvy.age(DataRegretEnvy.id==s)) unique(DataRegretEnvy.group(DataRegretEnvy.id==s)) unique(DataRegretEnvy.sex(DataRegretEnvy.id==s)) unique(DataRegretEnvy.education(DataRegretEnvy.id==s)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)))];
    end
end

% Get p loop to work so it separates avgRT for one subject based on players
% (0 or 1)


DataRegretEnvy.players(s)==p 

for s=1:length(SubjID)
    
 s=2   
%     for p=1:length(Players)
    for p=0:1
%         p=1
      subjectCompAvg(p,:) = [unique(DataRegretEnvy.id(DataRegretEnvy.id==s)) DataRegretEnvy.players(s)==p unique(DataRegretEnvy.age(DataRegretEnvy.id==s)) unique(DataRegretEnvy.group(DataRegretEnvy.id==s)) unique(DataRegretEnvy.sex(DataRegretEnvy.id==s)) unique(DataRegretEnvy.education(DataRegretEnvy.id==s)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)))];
    end
    
    
        for g=1:length(unique(SubjAvg.group));
            for p=0:1
        groupPlayertypeAverages(g,:) = [unique(SubjAvg.group(SubjAvg.group==g)) SubjAvg.players==p mean(SubjAvg.avgRT(SubjAvg.group==g))];
            end
        end
    
                       length(unique(DataRegretEnvy.players==p
 (SubjAvg.group==g)
 
 
        unique(DataRegretEnvy.players(DataRegretEnvy.id==s))==p
% subjectCompAverages(s*p,:) = [DataRegretEnvy.id(DataRegretEnvy.id==s) DataRegretEnvy.players(unique(DataRegretEnvy.id==s)) unique(DataRegretEnvy.age(DataRegretEnvy.id==s)) unique(DataRegretEnvy.group(DataRegretEnvy.id==s)) unique(DataRegretEnvy.sex(DataRegretEnvy.id==s)) unique(DataRegretEnvy.education(DataRegretEnvy.id==s)) mean(DataRegretEnvy.choiceduration(DataRegretEnvy.id==SubjID(s)))];
end

unique(DataRegretEnvy.players(DataRegretEnvy.id==3))

    % education
    
    
    % diff EV
    
    
    
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