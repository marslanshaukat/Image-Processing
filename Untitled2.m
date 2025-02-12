methods  
   function rts = roots(polyobject)
      % Extract data for MATLAB version of roots function
      coef = double(polyobject.coefficients);
      rts = roots(coef);
   end
end