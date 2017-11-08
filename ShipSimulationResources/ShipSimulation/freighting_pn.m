% Freighting_pn
% the main file to run simulation 

clear all; clc; 

global global_info; % user data 
global_info.PRINT_LOOP_NUMBER = 1; 
%global_info.semafor = 1;
global_info.MAX_LOOP = 1;
global_info.STOP_AT = 10;

% for color generation
global_info.cr = {'SmallColor', 'MediumColor', 'BigColor'}; % color rotation 'A'-'X'
global_info.cr_index = 0; % initially color rotation index = 0

pns = pnstruct('ship_sim_pdf'); % create petri net structure

dyn.m0 = {'p_Arr_Port',0};
dyn.ft = {'t_arr',0.05,'allothers',0.1};
dyn.ip = {'t_DArr1',1,'t_DArr2',1, 't_DArr3', 10, ...
    };

dyn.re = {'small',1,inf, 'medium',1,inf,'big',1,inf, 'workers',25,inf
 };
prnsys(pns, dyn);
pni = initialdynamics(pns, dyn);

sim = gpensim(pni); % perform simulation runs

prnss(sim); % print the simulation results 
plotp(sim, {'p_Arr_Port','p_Departed'}); % plot the results
prnschedule(sim);
prnfinalcolors(sim);
%plotp(sim, {'finishLoad','finishUnload'}); % plot the results
%cotree(pni,10,10)