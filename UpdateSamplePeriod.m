function data = UpdateSamplePeriod(period_us)
% UPDATESAMPLEPERIOD DAC write period.
% Takes the specified period in us and converts it into 2 bytes
% as requred by the register on the ESP32.
% 
% period_us - period in microseconds.
%
    MSB = idivide(int16(period_us), int16(256));
    LSB = mod(period_us, 256);
        
    data = [MSB, LSB];
end
