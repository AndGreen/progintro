program Pointers;
type
    ItemPtr = ^Item;
    Item = record
        value: char;
        next: ItemPtr;
    end;
var 
    pp: ^char;
    list: ItemPtr;
begin
    new(list);
    list^.value := 'a';
    pp := @list^.value;
    write(pp^);

    { val: ^integer; - pointer to int 
      val^ - value of address, whom pointer links
      @number - get address of vareable}
end.
