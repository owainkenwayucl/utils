% Implementation of Octave's "fputs" so that we can run scripts written in
% Octave on Matlab.

% Owain Kenway

% Note: Experimentation shows that Octave's fputs drops any lines that are not
%       strings so this implementation does this too.

function fputs(fid, line)
  if isstring(line)
    fprintf(fid, '%s', line);
  end
end

