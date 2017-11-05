%Common pre

function [fire, transition] = COMMON_PRE(transition)
% function [fire, trans] = COMMON_PRE(trans)

pArrPort = get_place('p_Arr_Port');
DockArr = get_place('p_DockArr');
s_admin = get_place('p_sadmin');
Docked = get_place('p_Docked');
d_admin = get_place('p_dadmin');
ready_to_leave = get_place('p_ready_to_leave');
DockDep = get_place('p_DockDep');
finishLoad = get_place('p_finishLoad');
finishUnload = get_place('p_finishUnload');
Departed = get_place('p_Departed');

global global_info;

if (strcmpi(transition.name, 't_arr')),
    
   % index = mod(global_info.cr_index, 3)+1;
    %global_info.cr_index = global_info.cr_index + 1;
    %transition.new_color = global_info.cr(index);
    %fire = 1;
    %return
     fire = lt(pArrPort.tokens, 3);

    
elseif (strcmpi(transition.name, 't_wait')),
    fire = lt(DockArr.tokens, 3);

elseif (strcmpi(transition.name, 't_DArr1')),
    granted = request('t_DArr1', ... 
        {'small',1});
    priorset('t_DArr1', 0); 
    fire = granted;
    
elseif (strcmpi(transition.name, 't_DArr2')),
    granted = request('t_DArr2', ... 
        {'medium',1});
    priorset('t_DArr2', 0); 
    fire = granted;
    
elseif (strcmpi(transition.name, 't_DArr3')),
    granted = request('t_DArr3', ... 
        {'big',1});
    priorset('t_DArr3', 0); 
    fire = granted;
    
elseif (strcmpi(transition.name, 't_load')),
    fire = lt(finishLoad.tokens, 3);

elseif (strcmpi(transition.name, 't_unload')),
    fire = lt(finishUnload.tokens, 2);
        
elseif (strcmpi(transition.name, 't_request_to_leave')),
    fire = lt(ready_to_leave.tokens, 3);
                
elseif (strcmpi(transition.name, 't_depart')),
    fire = lt(DockDep.tokens, 3);

elseif (strcmpi(transition.name, 't_Ddep1')),

    fire = lt(Docked.tokens, 3);
    priorset('t_DArr1', 1); 
    
elseif (strcmpi(transition.name, 't_Ddep2')),
    fire = lt(Docked.tokens, 3);
    priorset('t_DArr2', 1); 
    
elseif (strcmpi(transition.name, 't_Ddep3')),
    fire = lt(Docked.tokens, 3);
    priorset('t_DArr3', 1); 
    
else
    error([transition.name, ...
        ' is neither "t_arr", "t_wait", or "t_DArr1" ?????...']);
end;

