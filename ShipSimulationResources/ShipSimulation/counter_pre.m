function [fire, transition] = counter_pre(transition)
global global_info;
t1 = get_trans('t_unload');
t1_place = get_place('p_finishUnload');
t2 = get_trans('t_load');
t2_place = get_place('p_finishload');
pvalue = get_priority(transition.name);
if ge(t1.times_fired,3),
% stop simulation, after 3 t1-firing
    %global_info.STOP_SIMULATION = 1;
    priorset('t_load',pvalue+1);
    %global_info.semafor =2;
elseif ge(t2.times_fired, 4),
    priorset('t_load',pvalue+1);
else
end;
