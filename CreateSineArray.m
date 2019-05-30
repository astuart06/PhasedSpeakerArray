function sineArray = CreateSineArray(amplitude)
% CREATESINEARRAY 2D sine wave array
% Create a 2D array with 12, 24 data point sine waves.
%
% Amplitude: Amplitude of all the sine waves, from 0 to 2^16.
%
    ts=1/24;
    T=1;
    f=1;
    t=0:ts:T;
    y1=amplitude*sin(2*pi*f*t)+amplitude;
    % Delete last element in array which is a repeat of the first element.
    y1(end) =[];
    t(end) =[];
    
    % Create the offset sine waves from first set of points.
    sineArray = y1;

    clf
    hold on
 %   f1 = figure('Name', 'All Data Points');
    figure(1);
    title('Sine Array Datapoints');
    xlabel('Sample number');
    ylabel('16-bit DAC value');
   
    %stairs(t, y1);
    
    for i = 2:2:22
        y2 = circshift(y1, i);
        sineArray = [sineArray; y2];
    end    
    
    stairs(sineArray);    
%     legend({'offset = 0', ...
%         'offset = 2', ...
%         'offset = 4', ...
%         'offset = 6', ...
%         'offset = 8', ...
%         'offset = 10', ...
%         'offset = 12', ...
%         'offset = 14', ...
%         'offset = 16', ...
%         'offset = 18', ...
%         'offset = 20', ...
%         'offset = 22'});

end