% Freighting_pn
% the main file to run simulation 

clear all; clc; 

global global_info; % user data 
global_info.PRINT_LOOP_NUMBER = 1; 
%global_info.semafor = 1;
global_info.MAX_LOOP = 1;
global_info.STOP_AT = 5;

% for color generation
global_info.cr = {'A', 'B', 'C'}; % color rotation 'A'-'X'
global_info.cr_index = 0; % initially color rotation index = 0

pns = pnstruct('ship_sim_pdf'); % create petri net structure

dyn.m0 = {'pArr_Port',2};
dyn.ft = {'tarr',0.05,'allothers',0.1}
dyn.ip = {'t_load',3,'t_unload',10};
prnsys(pns, dyn);
pni = initialdynamics(pns, dyn);

sim = gpensim(pni); % perform simulation runs

prnss(sim); % print the simulation results 
plotp(sim, {'pArr_Port','Departed'}); % plot the results
prnfinalcolors(sim);
%plotp(sim, {'finishLoad','finishUnload'}); % plot the results
%cotree(pni,10,10)