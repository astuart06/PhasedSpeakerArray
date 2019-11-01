function trans_packet = CreateTransmissionPacket(type, data)
    type_dec = hex2dec(type);
    delimiter_dec = double(TypeConst.delimiter);
    % Size is number of data bytes plus size, type and delimiter (total 3).
    size_dec = size(data, 2) + 3;
    
    trans_packet  = [size_dec, type_dec, data, delimiter_dec]; 
end
