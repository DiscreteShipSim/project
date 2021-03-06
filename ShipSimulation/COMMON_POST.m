%COMMON_POST.m

function [] = COMMON_POST(transition)
% COMMON_POST file codes the post firing actions.
% Here, right after firing, the fired transition 
% set the value of semaphore to the other 
% transition so that the other one fires next

global global_info;

if strcmp(transition.name, 'tarr'), 
    global_info.semaphore = 'twait'; % t1 releases semafor to t2

elseif strcmp(transition.name, 'twait'), % transition.name 't2'
    global_info.semaphore = 'tarr'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'DArr1'), % transition.name 't2'
    global_info.semaphore = 'twait'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'DArr2'), % transition.name 't2'
    global_info.semaphore = 'twait'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'DArr3'), % transition.name 't2'
    global_info.semaphore = 'twait'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 't_load'), % transition.name 't2'
    global_info.semaphore = 'DArr1'; % t2 releases semafor to t1
    global_info.semaphore = 'DArr2'; % t2 releases semafor to t1
    global_info.semaphore = 'DArr3'; % t2 releases semafor to t1
    global_info.semaphore = 't_unload'; % t2 releases semafor to t1

elseif strcmp(transition.name, 't_unload'), % transition.name 't2'
    global_info.semaphore = 'DArr1'; % t2 releases semafor to t1
    global_info.semaphore = 'DArr2'; % t2 releases semafor to t1
    global_info.semaphore = 'DArr3'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 't_request_to_leave'), % transition.name 't2'
    global_info.semaphore = 't_load'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 't_depart'), % transition.name 't2'
    global_info.semaphore = 't_request_to_leave'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'Ddep1'), % transition.name 't2'
    global_info.semaphore = 't_depart'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'Ddep2'), % transition.name 't2'
    global_info.semaphore = 't_depart'; % t2 releases semafor to t1
    
elseif strcmp(transition.name, 'Ddep3'), % transition.name 't2'
    global_info.semaphore = 't_depart'; % t2 releases semafor to t1
 
else
%    disp('This is not possible'); 
%    error('something wrong in COMMON_POST'); 
end;
