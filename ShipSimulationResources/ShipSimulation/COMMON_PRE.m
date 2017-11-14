%Common pre

function [fire, transition] = COMMON_PRE(transition)
% function [fire, trans] = COMMON_PRE(trans)

pArrPort = get_place('p_Arr_Port');
DockArr = get_place('p_DockArr');
Docked = get_place('p_Docked');
ready_to_leave = get_place('p_ready_to_leave');


global global_info;

if (strcmpi(transition.name, 't_arr')),
     fire = lt(pArrPort.tokens, 3);

    
elseif (strcmpi(transition.name, 't_wait')),
    fire = lt(DockArr.tokens, 3);

elseif (strcmpi(transition.name, 't_DArr1')),
    granted = request('t_DArr1', ... 
        {'small',1});
    transition.new_color = global_info.cr(1);
    fire = granted;

    
elseif (strcmpi(transition.name, 't_DArr2')),
    granted = request('t_DArr2', ... 
        {'medium',1});
    transition.new_color = global_info.cr(2);
    fire = granted;
    
elseif (strcmpi(transition.name, 't_DArr3')),
    granted = request('t_DArr3', ... 
        {'big',1});
    transition.new_color = global_info.cr(3);
    fire = granted;
    
elseif (strcmpi(transition.name, 't_load1')),
    granted = request(transition.name, ... 
        {'workers',3, 'crane', 1, 'containerloader', 1}); 
    tokID1 = tokenEXColor('p_finishUnload',1,{'SmallColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted)  

elseif (strcmpi(transition.name, 't_load2')),
    granted = request(transition.name, ... 
        {'workers',5, 'crane', 1, 'containerloader', 3}); 
    tokID1 = tokenEXColor('p_finishUnload',1,{'MediumColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted)

elseif (strcmpi(transition.name, 't_load3')),
    granted = request(transition.name, ... 
        {'workers',6, 'crane', 1, 'containerloader', 3}); 
    tokID1 = tokenEXColor('p_finishUnload',1,{'BigColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted)

elseif (strcmpi(transition.name, 't_unload1')),
    granted = request(transition.name, ... 
        {'workers',3, 'crane', 1, 'containerloader', 1}); 
    tokID1 = tokenEXColor('p_Docked',1,{'SmallColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted);
    
elseif (strcmpi(transition.name, 't_unload2')),
    granted = request(transition.name, ... 
        {'workers',5, 'crane', 1, 'containerloader', 3}); 
    tokID1 = tokenEXColor('p_Docked',1,{'MediumColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted)
    
elseif (strcmpi(transition.name, 't_unload3')),
    granted = request(transition.name, ... 
        {'workers',6, 'crane', 1, 'containerloader', 3}); 
    tokID1 = tokenEXColor('p_Docked',1,{'BigColor'});
    transition.selected_tokens = tokID1;
    fire = and(tokID1,granted)
    
elseif (strcmpi(transition.name, 't_request_to_leave')),
    fire = lt(ready_to_leave.tokens, 4);
                
elseif (strcmpi(transition.name, 't_depart')),
    fire = lt(Docked.tokens, 4);

elseif (strcmpi(transition.name, 't_Ddep1')),
    granted = request('t_Ddep1', ... 
        {'maritime_pilot',1});
    tokID1 = tokenEXColor('p_DockDep',1,{'SmallColor'});
    transition.selected_tokens = tokID1;
    fire =tokID1;
    
elseif (strcmpi(transition.name, 't_Ddep2')),
    granted = request('t_Ddep2', ... 
        {'maritime_pilot',1});    
    tokID1 = tokenEXColor('p_DockDep',1,{'MediumColor'});
    transition.selected_tokens = tokID1;
    fire =tokID1; 
    
elseif (strcmpi(transition.name, 't_Ddep3')),
    granted = request('t_Ddep3', ... 
        {'maritime_pilot',1});    
    tokID1 = tokenEXColor('p_DockDep',1,{'BigColor'});
    transition.selected_tokens = tokID1;
    fire =tokID1;
    
else
    error([transition.name, ...
        ' is neither "t_arr", "t_wait", or "t_DArr1" ?????...']);
end;
