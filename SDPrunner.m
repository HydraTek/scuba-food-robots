clc
clear

%%

%start game
game_run = input('To begin playing enter 1 into the command window: ');
scene = simpleGameEngine('retro_pack.png',16,16,5,[121,22,22]);

%set up variables for sprites
blank=1;
character=30;

%set up the area variable and blank landscape(land) and foreground (fg) 
area=0;
land=zeros(16);
land(:)=blank;
fg=zeros(16);
fg(:)=blank;
fg(128)=character;

%movement
while game_run==1
    drawScene(scene, land, fg);
    input=getKeyboardInput(scene);
    currentPosition=find(fg==character);
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
    fg(currentPosition)=blank;
    fg(newPosition)=character;
    drawScene(scene, land, fg);
end

