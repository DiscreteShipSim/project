%Common pre

function [fire, transition] = COMMON_PRE(transition)
% function [fire, trans] = COMMON_PRE(trans)

pArrPort = get_place('pArr_Port');
DockArr = get_place('DockArr');
s_admin = get_place('s_admin');
Docked = get_place('Docked');
d_admin = get_place('d_admin');
ready_to_leave = get_place('ready_to_leave');
DockDep = get_place('DockDep');
finishLoad = get_place('finishLoad');
finishUnload = get_place('finishUnload');
Departed = get_place('Departed');

global global_info;

if (strcmpi(transition.name, 'tarr')),
    
   % index = mod(global_info.cr_index, 3)+1;
    %global_info.cr_index = global_info.cr_index + 1;
    %transition.new_color = global_info.cr(index);
    %fire = 1;
    %return
     fire = lt(pArrPort.tokens, 3);

    
elseif (strcmpi(transition.name, 'twait')),
    fire = lt(DockArr.tokens, 3);

elseif (strcmpi(transition.name, 'DArr1')),
    granted = request('DArr1', ... 
        {'small',1,'medium',1,'big',1});
    %tokID1 = tokenEXColor('DockArr',1,{'A'});
    %fire = lt(Docked.tokens, 3);
    %fire = and(tokID1, granted);
    fire = granted;
elseif (strcmpi(transition.name, 'DArr2')),
    granted = request('DArr2', ... 
        {'medium',1,'small',1});
    %tokID1 = tokenEXColor('DockArr',1,{'B'});
    %fire = lt(Docked.tokens, 3);
    %fire = and(tokID1, granted);
    fire = granted;
elseif (strcmpi(transition.name, 'DArr3')),
    granted = request('DArr3', ... 
        {'big',1});
    %tokID1 = tokenEXColor('DockArr',1,{'C'});
    %fire = lt(Docked.tokens, 3);
    fire = granted;
   % fire = and(tokID1, granted);

elseif (strcmpi(transition.name, 't_load')),
    fire = lt(finishLoad.tokens, 3);

elseif (strcmpi(transition.name, 't_unload')),
    fire = and(lt(finishUnload.tokens, 2),lt(finishLoad.tokens, 3));
        
elseif (strcmpi(transition.name, 't_request_to_leave')),
    fire = lt(ready_to_leave.tokens, 3);
                
elseif (strcmpi(transition.name, 't_depart')),
    fire = lt(DockDep.tokens, 3);

elseif (strcmpi(transition.name, 'Ddep1')),
    %tokID1 = tokenEXColor('finishLoad',1,{'A'});
    fire = lt(Docked.tokens, 3);
    %fire = (tokID1);   
    
elseif (strcmpi(transition.name, 'Ddep2')),
    %tokID1 = tokenEXColor('finishLoad',1,{'B'});
    fire = lt(Docked.tokens, 3);
    %fire = (tokID1);    
elseif (strcmpi(transition.name, 'Ddep3')),
    %tokID1 = tokenEXColor('finishLoad',1,{'C'});
    fire = lt(Docked.tokens, 3);
    %fire = (tokID1);    
else
    error([transition.name, ...
        ' is neither "tarr", "twait", or "DArr1" ?????...']);
end;

