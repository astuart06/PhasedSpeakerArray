% Setup Serial Port
delete(instrfindall);
clear all;
% Setup serial port
s = serial('COM16', 'BaudRate', 115200);
fopen(s);

% Update the sample period
period_us_data = UpdateSamplePeriod(200);
trans_packet = CreateTransmissionPacket(TypeConst.period, period_us_data);
fwrite(s, trans_packet);
pause(1);

% Data is an array with sine wave data for every speaker position (12 in
% total), with a specified amplitude. 
data = CreateSineArray(10000);

% Temp edit to test just one speaker - disable DAC-B-1
data(2:12, :) = 0;
%data(12, :) = 0;

ch_A_data = CreateSerialArray(data(1, :), data(5, :), data(9, :));
ch_B_data = CreateSerialArray(data(2, :), data(6, :), data(10, :));
ch_C_data = CreateSerialArray(data(3, :), data(7, :), data(11, :));
ch_D_data = CreateSerialArray(data(4, :), data(8, :), data(12, :));

% Transmit Channel A
trans_packet = CreateTransmissionPacket(TypeConst.ch_A, ch_A_data);
fwrite(s, trans_packet);
pause(1);

% Transmit Channel B
 trans_packet = CreateTransmissionPacket(TypeConst.ch_B, ch_B_data);
 fwrite(s, trans_packet);
 pause(1);

 % Transmit Channel C
 trans_packet = CreateTransmissionPacket(TypeConst.ch_C, ch_C_data);
 fwrite(s, trans_packet);
 pause(1);

 % Transmit Channel D
 trans_packet = CreateTransmissionPacket(TypeConst.ch_D, ch_D_data);
 fwrite(s, trans_packet);