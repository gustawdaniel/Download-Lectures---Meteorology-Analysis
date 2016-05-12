t_symulacji = 100;
dt =  0.1;

A = [[1,dt];[0,1]];
B = [dt^2/2;dt];
C = [1,0];

u = 0;
% xt = [Pt;vt];
Q = [0;0];
blad_modelu = 0.5; 
% - odchylenie standardowe
blad_obserwacji = 10;

b_obs_cov = blad_obserwacji^2;
b_mod_cov = blad_modelu^2*[[dt^4/4,dt^3/2];[dt^3/2,dt]];

Q_loc = [];
vel = [];
Q_loc_meas = [];

for t=0:dt:t_symulacji
    Q = A*Q+B*u+[dt^2/2*randn;dt*randn]*blad_modelu;
    y=(C*Q+blad_obserwacji*randn);
    Q_loc=[Q_loc;Q(1)];
    vel = [vel; Q(2)];
    Q_loc_meas = [Q_loc_meas;y];
    
    plot(0:dt:t,Q_loc,'-r.');
    hold on
    plot(0:dt:t,Q_loc_meas,'-k.');
    axis([0,100,-80,80]);
    pause(0.001);
end

%%

Q=[0;0];
Q_est = Q;
Q_loc_est = [];
P_est = b_mod_cov;
P = P_est;
P_mag_est = [];
predict_state = [];
predict_var = [];
predict_vel = [];

for t=1:length(Q_loc)
    Q_est = A*Q_est+B*u;
    Q_loc_estimate = [Q_loc_est;Q_est];
    P = A*P*A' + P_est;
    P_mag_est = [P_mag_est;P];
    
    K=P*C'*inv(C*P*C'+b_obs_cov);
    Q_est = Q_est + K*(Q_loc_meas(t)-C*Q_est); 
    P = (eye(2) - K*C)*P;
    predict_state = [predict_state; Q_est(1)];
    predict_vel = [predict_vel;Q_est(2)];
    predict_var = [predict_var;P(1)];
end

plot(0:dt:t_symulacji,predict_state)
