function serialArray = CreateSerialArray(y1, y2, y3)
% CREATESERIALARRAY 1D array sine array ready for transmission
% Convert each datapoint into MSB and LSB hex chars ready for
% transmission to the ESP32
%
% y1,y2,y3 - 1D arrays contaning 24 datapoints.
%
    z = horzcat(y1, y2, y3);

    % Round first then convert to hex characters.
    r1 = round(z);
    h1 = dec2hex(r1, 4);

    % Split each 16-bit char into 2, 8-bit chars then convert to decimal.
    % i.e MSB and LSB of the data to be transmitted.
    t1msb = hex2dec(h1(:, 1:2));
    t1lsb = hex2dec(h1(:, 3:4));
    
    % Convert to a horizontal array.
    t1msb = permute(t1msb, [2 1]);
    t1lsb = permute(t1lsb, [2 1]);

    %Interleave the two arrays to alternate MSB and LSB.
    serialArray = reshape([t1msb ; t1lsb], 1, []);
end