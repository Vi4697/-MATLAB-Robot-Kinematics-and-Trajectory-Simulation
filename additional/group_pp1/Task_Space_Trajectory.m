function [q] = Task_Space_Trajectory(p_offset, t0, tf,timestep,move_step,take_or_place)
%% if take_or_place is 0, take the object,else place the object
  num_step = (tf - t0)/timestep;
  %d_1 = p_offset(3)/num_step;
  if take_or_place == 0
      d_1 = -move_step;
      d = (p_offset(3)+abs(d_1));
  else
      d_1 = move_step;
      d = (p_offset(3)-abs(d_1));
  end
  q = zeros(num_step,6);
   for i=1:num_step
      d = d  + d_1;
      Ti06 = [1, 0, 0, p_offset(1);
              0, -1, 0, p_offset(2);
              0, 0, -1, d];
      q(i,:) = my_inv(Ti06);
  end
end
