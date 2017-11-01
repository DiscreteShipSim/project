% Freighting_pn
% the main file to run simulation 

clear all; clc; 

global global_info; % user data 
global_info.PRINT_LOOP_NUMBER = 1; 
%global_info.semafor = 1;
global_info.MAX_LOOP = 500;

pns = pnstruct('ship_sim_pdf'); % create petri net structure

dyn.m0 = {'pArr_Port',30};
dyn.ft = {'tarr','1','twait','1','DArr1','1','DArr2','1','DArr3','1', ...
    't_load','1','t_unload','1','t_request_to_leave','1','t_depart','1', ...
    'Ddep1','1','Ddep2','1','Ddep3','1'
    }
dyn.ip = {'t_load',3,'t_unload',10};
prnsys(pns, dyn);
pni = initialdynamics(pns, dyn);

sim = gpensim(pni); % perform simulation runs

prnss(sim); % print the simulation results 
plotp(sim, {'pArr_Port','Departed'}); % plot the results
%plotp(sim, {'finishLoad','finishUnload'}); % plot the results
%cotree(pni,10,10)