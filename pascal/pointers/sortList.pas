program ListOnlyOdd.pas;
type
    ListPtr = ^ListItem;
    ListItem = record
        value: integer;
        next: ListPtr;
    end;
var
    n: integer;
    tmp: ListPtr;
    list: ListPtr;
    pp: ^ListPtr;
begin
    list := nil;
    while not SeekEof do
    begin
        read(n);
        pp := @list; 
        while (pp^ <> nil) and (pp^^.value < n) do
            pp := @(pp^^.next);
        new(tmp);
        tmp^.next := pp^;
        tmp^.value := n;
        pp^ := tmp;
    end;  
 
    tmp := list;
    while tmp <> nil do 
    begin
        writeln(tmp^.value);
        tmp := tmp^.next;
    end;
end.
