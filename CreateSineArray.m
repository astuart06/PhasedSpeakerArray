function sineArray = CreateSineArray(amp)
% CREATESINEARRAY 2D sine wave array
% Create a 2D array with 12, 24 data point sine waves.
%
% Inputs
%   amp: Amplitude of all the sine waves, from 0 to 2^16.
% Outputs
%   sineArray: 12 sinewaves with phase change.
    ts=1/24;
    T=1;
    f=1;
    w = 2*pi*f;
    t=0:ts:T;
    t(end) =[];
    
    % Setup plot
    clf
    hold on    
    xlim([1 24]);
    
    % Preallocate array
    sineArray = zeros(12,24);
    
    for i = 1:12
        phase_rad = (pi/12)*(i - 1);
        sineArray(i, 1:24) = amp(i) * sin(w*t + phase_rad) + amp(i);
        plot(sineArray(i, 1:24));
    end  
end