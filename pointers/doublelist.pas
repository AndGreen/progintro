program DoubleList;
type
    itemptr = ^item;
    
    item = record
        value: integer;
        next: itemptr;
    end;
var
    n: integer;
    last: itemptr;
    first: itemptr;
    iterator: itemptr;
begin
    read(n);
    new(last);
    last^.value := n;
    first := last;
    while not SeekEof do
    begin
        read(n);
        new(last^.next);
        last := last^.next;
        last^.value := n;
    end;
    
    iterator := first;
    while iterator <> nil do
    begin
        write(iterator^.value, ' ');
        write(iterator^.value, ' ');
        iterator := iterator^.next;
    end
end.
