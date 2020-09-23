program PointToPoint;

type
    ListPtr = ^ListItem;
    ListItem = record
        value: integer;
        next: ListPtr;
    end;

var
    pp: ^ListPtr;
    last: ListPtr;
    first: ListPtr;
    tmp: ListPtr;
    n: integer;
begin
    first := nil;
    last := nil;
    while not SeekEof do
    begin
        read(n);
        if first = nil then
        begin
            new(first);
            last := first;
        end
        else 
        begin   
            new(last^.next);
            last := last^.next;
        end;
        last^.value := n;
        last^.next := nil;
    end;

    pp := @first;
    while pp^ <> nil do
    begin
        if pp^^.value mod 2 = 0 then
        begin
            tmp := pp^;
            pp^ := pp^^.next;
            dispose(tmp)
        end
        else
            pp := @(pp^^.next);   
    end;

    tmp := first;
    while tmp <> nil do
    begin
        write(tmp^.value, ' ');
        tmp := tmp^.next;
    end
end.
