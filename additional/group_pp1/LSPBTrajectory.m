function q = LSPBTrajectory(si, v0, sf, vf, ti, tf, timestep)
    % si, v0, sf and vf are 1xM vectors
    % si: the initial position of the manipulator
    % sf: the final position of the manipulator
    % v0: the initial velocity of the manipulator
    % vf: the final velocity of the manipulator
    % ti, tf and timestep are doubles
    % q: NxM array of trajectory values
tb = 0.2*tf;

v = (sf - si)./(tf-tb);
alpha = v./tb;

time = (ti:timestep:tf)';
qq = zeros(length(si), length(time));

for i=1:length(time)
    t=time(i);
    if ((ti <= t) && (t <= ti+tb))
        q = si + alpha./2. * t^2;
        % qdot = alpha*t;
    elseif ((ti+tb <= t) && (t <= ti+tf-tb))
        q = (si + sf - v.*tf)/2 + v.*t;
        % qdot = v;
    elseif ((ti+tf-tb <= t) && (t <= ti+tf))
        q = sf - alpha./2*tf^2 - alpha./2*t^2 + alpha*(tf*t);
        % qdot = -alpha.*t + alpha.*tf;
    else
        q = [0, 0, 0, 0, 0, 0];
        % qdot = 0;
    end
    qq(:,i) = q';
    
end

q = qq';
end