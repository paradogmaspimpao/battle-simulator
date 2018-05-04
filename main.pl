%% arquivo principal da aplicacao
:- use_module(library(random)).

main :-
    random_between(1, 3, Opcao),
    write(Opcao).
    
    