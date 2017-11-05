%COMMON_POST.m

function [] = COMMON_POST(transition)
% COMMON_POST file codes the post firing actions.
% Here, right after firing, the fired transition 
% set the value of semaphore to the other 
% transition so that the other one fires next

global global_info;

if strcmp(transition.name, 't_arr'), 
    %global_info.semaphore = 'twait'; % t1 releases semafor to t2
    release('t_wait');
elseif strcmp(transition.name, 't_wait'), % transition.name 't2'
    %global_info.semaphore = 'tarr'; % t2 releases semafor to t1
    release('t_arr');
    
elseif strcmp(transition.name, 't_DArr1'), % transition.name 't2'
    %global_info.semaphore = 'twait'; % t2 releases semafor to t1
  %  release('Ddep1');

elseif strcmp(transition.name, 't_DArr2'), % transition.name 't2'
    %global_info.semaphore = 'twait'; % t2 releases semafor to t1
   % release('Ddep2');

elseif strcmp(transition.name, 't_DArr3'), % transition.name 't2'
    %global_info.semaphore = 'twait'; % t2 releases semafor to t1
    % release('Ddep3');

elseif strcmp(transition.name, 't_load'), % transition.name 't2'
    release('t_unload');
elseif strcmp(transition.name, 't_unload'), % transition.name 't2'

elseif strcmp(transition.name, 't_request_to_leave'), % transition.name 't2'
    %global_info.semaphore = 't_load'; % t2 releases semafor to t1
    release('t_load');
elseif strcmp(transition.name, 't_depart'), % transition.name 't2'
    %global_info.semaphore = 't_request_to_leave'; % t2 releases semafor to t1
    release('t_request_to_leave');
elseif strcmp(transition.name, 't_Ddep1'), % transition.name 't2'
    %global_info.semaphore = 't_depart'; % t2 releases semafor to t1
    release('t_DArr1');
    release('t_depart');

elseif strcmp(transition.name, 't_Ddep2'), % transition.name 't2'
    %global_info.semaphore = 't_depart'; % t2 releases semafor to t1
    release('t_DArr2');
    release('t_depart');

elseif strcmp(transition.name, 't_Ddep3'), % transition.name 't2'
    %global_info.semaphore = 't_depart'; % t2 releases semafor to t1
    release('t_DArr3');
    release('t_depart');

else
%    disp('This is not possible'); 
%    error('something wrong in COMMON_POST'); 
end;
