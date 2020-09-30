program Deque;

type
    LongItem2Ptr = ^LongItem2;
    LongItem2 = record
        value: longint;
        prev, next: LongItem2Ptr;
    end;
    
    LongDeque = record
        first, last: LongItem2Ptr;
    end;

procedure LongDequeInit(var deque: LongDeque);
begin
    deque.first := nil;
    deque.last := nil;
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    tmp^.value := n;
    tmp^.prev := nil;
    if deque.first = nil then
    begin
        tmp^.next := nil;
        deque.last := tmp;
        deque.first := tmp;
    end
    else
    begin
        tmp^.next := deque.first;
        deque.first^.prev := tmp;
        deque.first := tmp; 
    end;
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
var
    tmp: LongItem2Ptr; 
begin
    new(tmp);
    tmp^.value := n;
    tmp^.next := nil;
    if deque.last = nil then
    begin
        tmp^.prev := nil;
        deque.last := tmp;
        deque.first := tmp;
    end
    else
    begin 
        tmp^.prev := deque.last;
        deque.last^.next := tmp;
        deque.last := tmp; 
    end;
end;

function LongDequePopFront(var deque: LongDeque; var n: longint)
                                                        :boolean;
begin
    if deque.first = nil then
    begin
        LongDequePopFront := false;
        exit;
    end;
    n := deque.first^.value;
    if deque.first^.next <> nil then
    begin
        deque.first := deque.first^.next;
        dispose(deque.first^.prev);
        deque.first^.prev := nil;
    end
    else
        deque.first := nil;
    LongDequePopFront := true;
end;

function LongDequePopBack(var deque: LongDeque; var n: longint)
                                                        :boolean;
begin
    if deque.last = nil then
    begin
        LongDequePopBack := false;
        exit;
    end;
    n := deque.last^.value;
    if deque.last^.prev <> nil then
    begin
        deque.last := deque.last^.prev;
        dispose(deque.last^.next);
        deque.last^.next := nil;
    end
    else
        deque.last := nil;
    LongDequePopBack := true;
end;

procedure LongDequeRemoveItem(var deque: LongDeque; item: longint);
var
    tmp: LongItem2Ptr;
    iterator: LongItem2Ptr;
begin
    iterator := deque.first;
    while iterator <> nil do
    begin
        if iterator^.value = item then
        begin
            tmp := iterator;
            iterator := iterator^.next;
            
            if tmp^.prev = nil then
                tmp^.next^.prev := nil
            else if tmp^.next = nil then
                tmp^.prev^.next := nil
            else
            begin
                tmp^.next^.prev := tmp^.prev;
                tmp^.prev^.next := tmp^.next;
            end;
            dispose(tmp);        
        end
        else
            iterator := iterator^.next;
    end;
end;

function LongDequeIsEmpty(var deque: LongDeque) : boolean;
begin
    if deque.first = nil then
        LongDequeIsEmpty := true
    else
        LongDequeIsEmpty := false;
end;
var
    n: longint;
    deq: LongDeque;
begin
    while not SeekEof do
    begin
        read(n);
        LongDequePushFront(deq, n);
    end;
    
    LongDequeRemoveItem(deq, 4);

    while LongDequePopFront(deq, n) do
        writeln(n);
end.
