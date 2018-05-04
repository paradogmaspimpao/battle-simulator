%% arquivo principal da aplicacao

superEffective(fire,grass).
superEffective(grass,water).
superEffective(water,fire).
superEffective(ghost,ghost).

ineffective(ghost,normal).
ineffective(normal,ghost).

notVeryEffective(water,grass).
notVeryEffective(fire,water).
notVeryEffective(grass,fire).

normalEffective(normal,fire).
normalEffective(normal,water).
normalEffective(normal,grass).
normalEffective(ghost,fire).
normalEffective(ghost,water).
normalEffective(ghost,grass).
normalEffective(fire,ghost).
normalEffective(fire,normal).
normalEffective(water,ghost).
normalEffective(water,normal).
normalEffective(grass,ghost).
normalEffective(grass,normal).

notVeryEffective(X,X):- dif(X,ghost).

attack(Human,Computer, 'You\'re super effective', 4):- superEffective(Human,Computer).
attack(Human,Computer, 'You\'re normally effective',3):- normalEffective(Human,Computer).
attack(Human,Computer, 'You\'re not very effective',2):- notVeryEffective(Human,Computer).
attack(Human,Computer, 'You\'re ineffevtive',1):- ineffective(Human,Computer).

defend(Human,Computer, 'It\'s super effective',4):- superEffective(Computer,Human).
defend(Human,Computer, 'It\'s normally effective',3):- normalEffective(Computer,Human).
defend(Human,Computer, 'It\'s not very effective',2):- notVeryEffective(Computer,Human).
defend(Human,Computer, 'It\'s ineffevtive',1):- ineffective(Computer,Human).

battle(Human,Computer, 'The opponent faints! You win!'):-
        attack(Human,Computer,AtkMsg, AtkNum),
        defend(Human,Computer,DefMsg,DefNum),
        AtkNum > DefNum,!,
        write('You chose '), write(Human),write('. '), writeln(AtkMsg),
        write('The opponent chose '), write(Computer),write('. '), writeln(DefMsg).
   
battle(Human,Computer, 'You faint! You lose!'):-
        attack(Human,Computer,AtkMsg, AtkNum),
        defend(Human,Computer,DefMsg,DefNum),
        AtkNum < DefNum,!,
        write('You chose '), write(Human),write('. '), writeln(AtkMsg),
        write('The opponent chose '), write(Computer),write('. '), writeln(DefMsg).

battle(Human,Computer, 'Both stay fit to fight! It\'s a Tie!'):-
        attack(Human,Computer,AtkMsg, AtkNum),
        defend(Human,Computer,DefMsg,DefNum),
        AtkNum == DefNum, dif(AtkNum,4), !,
        write('You chose '), write(Human),write('. '), writeln(AtkMsg),
        write('The opponent chose '), write(Computer),write('. '), writeln(DefMsg).

        
battle(Human,Computer, 'Both knocked out! It\'s a Tie!'):-
        attack(Human,Computer,AtkMsg, AtkNum),
        defend(Human,Computer,DefMsg,DefNum),
        AtkNum == DefNum, AtkNum == 4, !,
        write('You chose '), write(Human),write('. '), writeln(AtkMsg),
        write('The opponent chose '), write(Computer),write('. '), writeln(DefMsg).


main :-
        random_member(Computer, [fire, grass, water, normal, ghost]),
        read(Human),
        battle(Human,Computer,Result),
        writeln(Result).

         
    
    