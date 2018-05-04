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

attack(Human,Computer, 'You\'re super effective'):- superEffective(Human,Computer).
attack(Human,Computer, 'You\'re normally effective'):- normalEffective(Human,Computer).
attack(Human,Computer, 'You\'re not very effective'):- notVeryEffective(Human,Computer).
attack(Human,Computer, 'You\'re ineffevtive'):- ineffective(Human,Computer).

defend(Human,Computer, 'It\'s super effective'):- superEffective(Computer,Human).
defend(Human,Computer, 'It\'s normally effective'):- normalEffective(Computer,Human).
defend(Human,Computer, 'It\'s not very effective'):- notVeryEffective(Computer,Human).
defend(Human,Computer, 'It\'s ineffevtive'):- ineffective(Computer,Human).



main :-
         random_member(Computer, [fire, grass, water, normal, ghost]),
         read(Human),
         attack(Human,Computer,AtkMsg),
         defend(Human,Computer,DefMsg),
         write('You chose '), write(Human),write('. '), writeln(AtkMsg),
         write('The computer chose '), write(Computer),write('. '), writeln(DefMsg).

         
    
    