%call this function with the current position as the input and the function
%will wait for the user input and then output the new position of the
%character
function newPosition = movement(currentPosition)
    input=getKeyboardInput();
    if isequal(input,'rightarrow')
        newPosition=currentPosition;
    end
    if isequal(input,'leftarrow')
        newPosition=currentPosition;
    end
    if isequal(input,'uparrow')
        newPosition=currentPosition;
    end
    if isequal(input,'downarrow')
        newPosition=currentPosition;
    end
end