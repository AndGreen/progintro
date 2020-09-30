program TestTmp;
type
    itemptr = ^item;
    item = record
        data: integer;
        next: itemptr;
    end;
var
    n: integer;
    first, tmp: itemptr;
begin
    first := nil;
    while not SeekEof do
    begin
        read(n);
        new(tmp);
        tmp^.data := n;
        tmp^.next := first;
        first := tmp;
    end;

    tmp := first;
    while tmp <> nil do
    begin
        write(tmp^.data, ' ');
        tmp := tmp^.next;
    end 
end.
