%% arquivo principal da aplicacao


%% menu de instalacao de um pacote
readInput :- write('Digite o nome do pacote: '), read(Package), 
write(Package).


main :-
        open('db.txt', read, Str),
        read_file(Str,Lines),
        close(Str),
        write('Linhas\n'), write(Lines), nl.
    
    read_file(Stream,[]) :-
        at_end_of_stream(Stream).
    
    read_file(Stream,[X|L]) :-
        \+ at_end_of_stream(Stream),
        read_line_to_codes(Stream, Codes),
        atom_chars(X, Codes),
        read_file(Stream,L), !.