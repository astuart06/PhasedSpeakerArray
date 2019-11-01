function bit16_setpoints = VoltageTo16bitSetpoint(voltage_setpoints)
% VOLTAGETO16BITSETPOINT.
% Takes a specified voltage and converts it into a 16 number that
% when written to the DAC register will generate the required voltage. 
% 
% voltage_setpoints - Array of voltage setpoints between -2.5V and +2.5V
   
% Limit range between -2.5V and +2.5V.
    voltage_setpoints = min(max(voltage_setpoints, -2.5), 2.5);
    disp(voltage_setpoints);
    % Convert to a number between 0 and 2^16.
    bit16_setpoints = (voltage_setpoints * (2^16/5)) + 32768;
    % Round to integers, can't write decimal to DAC
    bit16_setpoints = round(bit16_setpoints);
end