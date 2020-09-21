program TestPointers;
var
    number: integer;
    point: ^integer;
    dynamic: ^string;
begin
    number := 44;
    writeln(number);
    point := @number;
    point^ := 23;
    new(dynamic);
    dynamic^ := 'Hello world! How are you?';
    writeln(number, dynamic^);
    dispose(dynamic);
end.
