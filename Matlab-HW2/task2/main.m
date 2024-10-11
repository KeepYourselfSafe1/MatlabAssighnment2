% Prompt user for input message and how many values they want to shift it.
text = input('Enter a message to encrypt: ', 's');
shift = input('Enter a shift value (1-25): ');

% Call the caesar function to encrypt the input message
output = caesar(text, shift);

% Display the original and encrypted messages
fprintf('Original Message: %s\n', text);
fprintf('Encrypted Message: %s\n', output);