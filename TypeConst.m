classdef TypeConst
    properties (Constant)
        % The channel hex byte is also used to set the command and
        % address byte within the DAC.
        ch_A = '11';
        ch_B = '12';
        ch_C = '14';
        ch_D = '18';
        period = '21';
        dac_count = '22';
        timer_state = '23';
        delimiter = 'e';
    end
end
