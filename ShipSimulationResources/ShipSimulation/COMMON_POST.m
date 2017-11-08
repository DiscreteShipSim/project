%COMMON_POST.m

function [] = COMMON_POST(transition)
% COMMON_POST file codes the post firing actions.
% Here, right after firing, the fired transition 
% set the value of semaphore to the other 
% transition so that the other one fires next

global global_info;

if strcmp(transition.name, 't_arr'), 
    release('t_wait');
elseif strcmp(transition.name, 't_wait'), % transition.name 't2'
    release('t_arr');
    
elseif strcmp(transition.name, 't_DArr1'), % transition.name 't2'

elseif strcmp(transition.name, 't_DArr2'), % transition.name 't2'

elseif strcmp(transition.name, 't_DArr3'), % transition.name 't2'

elseif strcmp(transition.name, 't_load1'), % transition.name 't2'
    release('t_load1');

elseif strcmp(transition.name, 't_load2'), % transition.name 't2'
    release('t_load2');

elseif strcmp(transition.name, 't_load3'), % transition.name 't2'
    release('t_load3'); 
    
elseif strcmp(transition.name, 't_unload1'), % transition.name 't2'
    release('t_unload1');
    
elseif strcmp(transition.name, 't_unload2'), % transition.name 't2'
    release('t_unload2');
    
elseif strcmp(transition.name, 't_unload3'), % transition.name 't2'
    release('t_unload3');

elseif strcmp(transition.name, 't_request_to_leave'), % transition.name 't2'
    
elseif strcmp(transition.name, 't_depart'), % transition.name 't2'
    release('t_request_to_leave');
    
elseif strcmp(transition.name, 't_Ddep1'), % transition.name 't2'
    release('t_DArr1');

elseif strcmp(transition.name, 't_Ddep2'), % transition.name 't2'
    release('t_DArr2');

elseif strcmp(transition.name, 't_Ddep3'), % transition.name 't2'
    release('t_DArr3');


else
%    disp('This is not possible'); 
%    error('something wrong in COMMON_POST'); 
end;
