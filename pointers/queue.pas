program Queue;
type 
    QueuePtr = ^QueueItem;
    QueueItem = record
        data: longint;
        next: QueuePtr;
    end;
    QueueOfLongints = record
        first, last: QueuePtr;
    end;

procedure QOLInit(var queue: QueueOfLongints);
begin
    queue.first := nil;
    queue.last := nil
end;

procedure QULPut(var queue: QueueOfLongints; n: longint);
begin
    if queue.first = nil then
    begin
        new(queue.first);
        queue.last := queue.first
    end
    else
    begin
        new(queue.last^.next);
        queue.last := queue.last^.next;
    end;
    queue.last^.data := n;
    queue.last^.next := nil
end;

function QULGet(var queue: QueueOfLongints; var n: longint): boolean;
var
    tmp: QueuePtr;
begin
    if queue.first = nil then
    begin
        QULGet := false;
        exit
    end;
    n := queue.first^.data;
    tmp := queue.first;
    queue.first := queue.first^.next;
    if queue.first = nil then
        queue.last := nil;
    dispose(tmp);
    QULGet := true;
end;

function QULIsEmpty(var queue: QueueOfLongints): boolean;
begin
    QULIsEmpty := queue.first = nil
end;

var
    n: longint;
    q: QueueOfLongints;
begin
    QOLInit(q);
    while not SeekEof do
    begin
        read(n);
        QULPut(q, n);
    end;

    while QULGet(q, n) do
        writeln(n);
end.
