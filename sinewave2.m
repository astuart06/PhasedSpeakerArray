% Setup Serial Port
delete(instrfindall);
clear all;
% Setup serial port
s = serial('COM17', 'BaudRate', 115200);
fopen(s);

% Disable the timer interrupts
trans_packet = CreateTransmissionPacket(TypeConst.timer_state, 0);
fwrite(s, trans_packet);
pause(1);

% Update the sample period
period_us_data = UpdateSamplePeriod(300);
trans_packet = CreateTransmissionPacket(TypeConst.period, period_us_data);
fwrite(s, trans_packet);
pause(0.2);

% Update number of DACs
number_of_dacs = 6;
trans_packet = CreateTransmissionPacket(TypeConst.dac_count, number_of_dacs);
fwrite(s, trans_packet);
pause(0.2);

% Create test data
set_points = [-1 1 1 1 1 1 0 0 0 0 0 0];
set_points = VoltageTo16bitSetpoint(set_points);
test_data = CreateSerialArray(set_points);

zero_set_points = [0 0 0 0 0 0 0 0 0 0 0 0];
zero_set_points = VoltageTo16bitSetpoint(zero_set_points);
zero_test_data = CreateSerialArray(zero_set_points);

% =========================================================================
% Transmit Test Data
% Channel A
trans_packet = CreateTransmissionPacket(TypeConst.ch_A, zero_test_data);
fwrite(s, trans_packet);
pause(0.2);
% Channel B
trans_packet = CreateTransmissionPacket(TypeConst.ch_B, zero_test_data);
fwrite(s, trans_packet);
pause(0.2);
% Channel C
trans_packet = CreateTransmissionPacket(TypeConst.ch_C, zero_test_data);
fwrite(s, trans_packet);
pause(0.2);
% Channel D
trans_packet = CreateTransmissionPacket(TypeConst.ch_D, test_data);
fwrite(s, trans_packet);
pause(0.2);
% =========================================================================
% Enable the timer interrupts
trans_packet = CreateTransmissionPacket(TypeConst.timer_state, 1);
fwrite(s, trans_packet);
pause(1);

% Disable the timer interrupts
% trans_packet = CreateTransmissionPacket(TypeConst.timer_state, 0);
% fwrite(s, trans_packet);

% trans_packet = CreateTransmissionPacket(TypeConst.ch_B, test_data);
% fwrite(s, trans_packet);
% pause(1);
% 
% trans_packet = CreateTransmissionPacket(TypeConst.ch_C, test_data);
% fwrite(s, trans_packet);
% pause(1);
% 
% trans_packet = CreateTransmissionPacket(TypeConst.ch_D, test_data);
% fwrite(s, trans_packet);
% pause(1);
