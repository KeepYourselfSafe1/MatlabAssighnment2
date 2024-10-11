function caesar_cipher = caesar(textInput, shiftValue)
% Convert the input text to its ASCII (numeric) representation
textToDouble = double(textInput);
% Shift each character's ASCII value by the given shiftValue
shiftedDouble = textToDouble+shiftValue;
% Get the length of the shifted ASCII array
doubleLength = length(shiftedDouble);

% Loop through each character in the shifted array
for i = 1:doubleLength
    % Ensure shifted characters wrap around the alphabet if they exceed 'z' (ASCII 122)
    while shiftedDouble(i) > 122
        shiftedDouble(i) = shiftedDouble(i)-26;
    end
    % Ensure shifted characters wrap around the alphabet if they fall below 'a' (ASCII 97)
    while shiftedDouble(i) < 97
        shiftedDouble(i) = shiftedDouble(i)+26;
    end
end
% Convert the shifted ASCII values back to characters
caesar_cipher = char(shiftedDouble);
end