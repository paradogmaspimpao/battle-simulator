%% arquivo principal da aplicacao

superEffective(fire,grass).
superEffective(grass,water).
superEffective(water,fire).
superEffective(ghost,ghost).

ineffective(ghost,normal).
ineffective(normal,ghost).

normalEffective(normal,fire).
normalEffective(normal,water).
normalEffective(normal,grass).
normalEffective(ghost,fire).
normalEffective(ghost,water).
normalEffective(ghost,grass).

normalEffective(X,X):- dif(X,ghost).



main :-
         random_member(C, [fire, grass, water, normal, ghost]),
         read(Op),
         write('You chose '), writeln(Op),
         write('The computer chose '), writeln(C).

         
    
    