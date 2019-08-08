### feature_all: 

SELECT * FROM pyrenees.features_all;

create table pyrenees.problem_level 
select * 
FROM pyrenees.features_all
where decisionPoint='probStart' or decisionPoint='userEnd'; 

select * from features_all
where decisionPoint='userStart'; 

SELECT count(*) AS NUMBEROFCOLUMNS FROM information_schema.columns 
WHERE table_name ='features_all'; 


### problem_level: 

SELECT * FROM pyrenees.problem_level;

alter table problem_level add column problemDecision tinytext; 

SET SQL_SAFE_UPDATES = 0;

update problem_level 
inner join problem_decisions on (problem_level.userID = problem_decisions.userID and problem_level.problem = problem_decisions.problem)
set problem_level.problemDecision = problem_decisions.problemDecision; 

ALTER TABLE `pyrenees`.`problem_level` 
CHANGE COLUMN `problemDecision` `problemDecision` TINYTEXT NULL DEFAULT NULL AFTER `decisionPoint`;

ALTER TABLE `problem_level` DROP  `pctCorrectCondIndeSelect`, DROP `pctCorrectCondIndeApply`, DROP `pctCorrectCondIndeAll`, DROP `nCondIndeProb`, DROP `AvgTimeOnStepWithHintKC`, DROP `durationSinceLastHintKC`, DROP `pctCorrectBayesSelect`, DROP `pctCorrectDefCondSelect`, DROP `pctCorrectTotTheoSelect`, DROP `pctCorrectBayesApply`, DROP `pctCorrectDefCondApply`, DROP `pctCorrectTotTheoApply`, DROP `pctCorrectBayesAll`, DROP `pctCorrectDefCondAll`, DROP `pctCorrectTotTheoAll`, DROP `nDefCondProb`, DROP `nTotTheoProb`, DROP `nBayesProb`, DROP `kcOrderingPb`, DROP `timeOnCurrentProblem`, DROP `timeOnTutoringProblem`, DROP `timeOnTutoringProblemWE`, DROP `timeOnTutoringProblemPS`, DROP `avgTimeOnStepProblem`, DROP `avgTimeOnStepProblemWE`, DROP `avgTimeOnStepProblemPS`, DROP `nTotalHintProblem`, DROP `performanceDifficulty`, DROP `principleDifficulty`, DROP `principleCategory`;

SELECT count(*) AS NUMBEROFCOLUMNS FROM information_schema.columns 
WHERE table_name ='problem_level'; 

select distinct problemDecision from problem_level; 

update problem_level
set problemDecision = step 
where problemDeciion = Step_rand;
