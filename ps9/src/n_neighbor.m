function min_index = n_neighbor(x, index)
   d_min = intmax('int64');
   min_index = index;
   for i = index+50:length(x)
       d_cur = norm(x(index) - x(i));
       if d_cur < d_min
           d_min = d_cur;
           min_index = i; 
       end
   end
end