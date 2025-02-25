clear all
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% alpha = 3.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sweep up

C_b_alpha3_sweep_up = [  -0.87009E-04 -0.64185E-04];
C_t_alpha3_sweep_up = [-0.40566E-01  0.40499E-02 ];

phi_b_alpha3_sweep_up = 180*atan(C_b_alpha3_sweep_up(2)/C_b_alpha3_sweep_up(1))/pi
phi_t_alpha3_sweep_up = 180*atan(C_t_alpha3_sweep_up(2)/C_t_alpha3_sweep_up(1))/pi


C_b_alpha3_sweep_down = [  -0.13876E-03  0.17655E-03 ];
C_t_alpha3_sweep_down = [  0.22515E-01 -0.11449E-02 ];

phi_b_alpha3_sweep_down = 180*atan(C_b_alpha3_sweep_down(2)/C_b_alpha3_sweep_down(1))/pi
phi_t_alpha3_sweep_down = 180*atan(C_t_alpha3_sweep_down(2)/C_t_alpha3_sweep_down(1))/pi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% alpha = 5.0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% sweep up

C_b_alpha5_sweep_up = [-0.26079E-04  0.14709E-03];
C_t_alpha5_sweep_up = [ 0.32494E-01  0.17340E-01 ];

phi_b_alpha5_sweep_up = 180*atan(C_b_alpha5_sweep_up(2)/C_b_alpha5_sweep_up(1))/pi
phi_t_alpha5_sweep_up = 180*atan(C_t_alpha5_sweep_up(2)/C_t_alpha5_sweep_up(1))/pi

% sweep down 
C_b_alpha5_sweep_down = [-0.70388E-04  0.22203E-03 ];
C_t_alpha5_sweep_down = [0.20413E-01 -0.17648E-01 ];

phi_b_alpha5_sweep_down = 180*atan(C_b_alpha5_sweep_down(2)/C_b_alpha5_sweep_down(1))/pi
phi_t_alpha5_sweep_down = 180*atan(C_t_alpha5_sweep_down(2)/C_t_alpha5_sweep_down(1))/pi