clc
clear

%%

%start game
game_run = input('To begin playing enter 1 into the command window: ');
scene = simpleGameEngine('retro_pack.png',16,16,5,[121,22,22]);

%set up variables for sprites
blank=1;
character=243;
house=[491:493;523:525];
tree=33;

%set up the area variable and blank landscape(land) and foreground (fg) 
area=0;
motion=0;
back=zeros(16); %changing this size will change the size of the plane, just change front accordingly to the same dimensions
back(:)=blank;
front=zeros(16);
front(:)=blank;
front(128)=character;

%initialize first sceen
area=1;
back=generateBack(back,area,house);
%front=generateFront(front,area);
interactive=generateInt(back,area);
drawScene(scene,back,front);
runGame(scene,game_run,back,front,character,blank);

%run game
function runGame(sc,gr,b,f,char,bnk)
    while gr==1
        %allow player to move via the arrow keys and then update scene to new
        %character position
        input=getKeyboardInput(sc);
        currentPosition=find(f==char);
        if isequal(input,'rightarrow')
            newPosition=currentPosition+16;
        end
        if isequal(input,'leftarrow')
            newPosition=currentPosition-16;
        end
        if isequal(input,'uparrow')
            newPosition=currentPosition-1;
        end
        if isequal(input,'downarrow')
            newPosition=currentPosition+1;
        end
        
        %allow character to activate interactable objects
        if isequal(input,'space')
            
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

