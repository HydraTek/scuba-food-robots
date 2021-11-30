clc
clear

%initialize scene using simpleGameEngine
scene = simpleGameEngine('retro_pack.png',16,16,5,[121,22,22]);

%set up variables for sprites
blank=1;
character=243;

%set up the area variable and blank landscape(land) and foreground (fg) 
area=0;
back=zeros(16); %changing this size will change the size of the plane, just change front accordingly to the same dimensions
back(:)=blank;
front=zeros(16);
front(:)=blank;
front(128)=character;
intspace=zeros(16);
intspace(:)=false;
inventory=(0:0:16);

%start game
game_run = input('To begin playing enter 1 into the command window: ');

%initialize first sceen
area=1;
back=generateBack(back,area);
%front=generateFront(front,area);
%interactive=generateInt(back,area);
drawScene(scene,back,front);
runGame(scene,game_run,back,front,character,blank);

%run game
function runGame(sc,gr,b,f,char,bnk)
    while gr==1
        %allow player to move via the arrow keys and then update scene to new
        %character position and have character facing new direction
        input=getKeyboardInput(sc);
        currentPosition=find(f==char);
        if isequal(input,'rightarrow')
            char=244;
            newPosition=currentPosition+16;
        end
        if isequal(input,'leftarrow')
            char=245;
            newPosition=currentPosition-16;
        end
        if isequal(input,'uparrow')
            char=246;
            newPosition=currentPosition-1;
        end
        if isequal(input,'downarrow')
            char=247;
            newPosition=currentPosition+1;
        end
        
        %allow player to interact with the item inventory
        %if isequal(input,'i')
            
        %end
        
        %allow player to activate interactable objects
        if isequal(input,'space')
            if is(currentPosition+1)==true
                activateObject(currentPosition+1);
            end
            if is(currentPosition-1)==true
                activateObject(currentPosition-1);
            end
            if is(currentPosition+16)==true
                activateObject(currentPosition+16);
            end
            if is(currentPosition-16)==true
                activateObject(currentPosition-16);
            end
        end
        
        %prevent character from walking through background objects
        if b(newPosition)==bnk
            f(currentPosition)=bnk;
            f(newPosition)=char;
            drawScene(sc, b, f);
        else
            newPosition=currentPosition;
            drawScene(sc, b, f);
        end
    end
end

