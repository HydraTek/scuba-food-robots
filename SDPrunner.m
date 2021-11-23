clc
clear

%%

%start game
game_run = input('To begin playing enter 1 into the command window: ');
scene = simpleGameEngine('retro_pack.png',16,16,5,[121,22,22]);

%set up variables for sprites
blank=1;
character=30;
house=[491:493;523:525];
enemy=28;

%set up the area variable and blank landscape(land) and foreground (fg) 
area=0;
land=zeros(16);
land(:)=blank;
fg=zeros(16);
fg(:)=blank;
fg(128)=character;

%initialize first sceen
area=1;
%fg=generateArea(fg,enemy);
drawScene(scene, generateArea(land,fg,enemy));
%runGame(scene,game_run,fg,character,blank,enemy);

%run game
function runGame(sc,gr,f,char,bnk,e)
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
        f(currentPosition)=bnk;
        f(newPosition)=char;
        drawScene(sc, generateArea(f,e));
    end
end

  



