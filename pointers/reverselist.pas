program DynamicList;
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
    { exception block }
    new(last);
    last^.value := n;
    last^.next := nil;
    while not SeekEof do
    begin
        read(n);
        { exception block }
        new(first);
        first^.value := n;
        first^.next := last;
        last := first;
    end; 
    iterator := first;
    while iterator <> nil do
    begin
        write(iterator^.value, ' ');
        iterator := iterator^.next;
    end;
end.
