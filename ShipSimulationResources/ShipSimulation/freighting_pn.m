% Freighting_pn
% the main file to run simulation 

clear all; clc; 

global global_info; % user data 
global_info.PRINT_LOOP_NUMBER = 1; 
%global_info.semafor = 1;
global_info.MAX_LOOP = 1;
global_info.STOP_AT = 50;

% for color generation
global_info.cr = {'SmallColor', 'MediumColor', 'BigColor'}; % color rotation 'A'-'X'
global_info.cr_index = 0; % initially color rotation index = 0

pns = pnstruct('ship_sim_pdf'); % create petri net structure

dyn.m0 = {'p_Arr_Port',0};
dyn.ft = {'t_arr',0.5, 't_unload1', 2, 't_unload2', 5, 't_unload3', 8, ...
    't_load1', 2, 't_load2', 5, 't_load3', 8 , ...
    't_DArr1', 2, 't_DArr2', 3, 't_DArr3', 4, ...
    't_Ddep1', 2, 't_Ddep2', 3, 't_Ddep3', 4, 'allothers',0.1};

dyn.ip = {'t_DArr1',1,'t_DArr2',1, 't_DArr3', 10, ...
    };

dyn.re = {'small',1,inf, 'medium',1,inf,'big',1,inf, 'workers',25,inf, 'maritime_pilot', 1, inf ...
    'crane', 3, inf, 'containerloader',6 , inf
 };



prnsys(pns, dyn);
pni = initialdynamics(pns, dyn);


sim = gpensim(pni); % perform simulation runs
occupancy_matrix = occupancy(sim, {'t_unload1','t_unload2','t_unload3'});
disp('Occupancy Matrix: ');
disp(occupancy_matrix);
prnss(sim); % print the simulation results 
plotp(sim, {'p_DockDep','p_Departed','p_ready_to_leave','p_Docked'}); % plot the results
prnschedule(sim);
prnfinalcolors(sim);
%plotp(sim, {'finishLoad','finishUnload'}); % plot the results
%cotree(pni,1,11)