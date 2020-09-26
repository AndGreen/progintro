program Trees;

type 
    TreeNodePtr = ^TreeNode;
    TreeNode = record
        data: longint;
        left, right: TreeNodePtr;
    end;
    
    TreeNodePos = ^TreeNodePtr;

function SearchTree(var p: TreeNodePtr; val: longint)
                                        : TreeNodePos;
begin
    if (p = nil) or (p^.data = val) then
        SearchTree := @p
    else
    if val < p^.data then
        SearchTree := SearchTree(p^.left, val)
    else
        SearchTree := SearchTree(p^.right, val)
end;

function AddToTree(var p: TreeNodePtr; val: longint): boolean;
var
    pos: TreeNodePos;
begin
    pos := SearchTree(p, val);
    if pos^ = nil then
    begin
        new(pos^);
        pos^^.data := val;
        pos^^.left := nil;
        pos^^.right := nil;
        AddToTree := true
    end
    else
        AddToTree := false;
end;

function IsInTree(p: TreeNodePtr; val: longint): boolean;
var
    pos: TreeNodePos;
begin
    pos := SearchTree(p, val);
    IsInTree := pos^ <> nil
end;

function SumTree(p: TreeNodePtr): longint;
begin
    if p = nil then
        SumTree := 0
    else
        SumTree :=
            SumTree(p^.left) + p^.data + SumTree(p^.right);
end;

var
    n: longint;
    root: TreeNodePtr = nil;
begin
    while not SeekEof do
    begin
        read(n);
    end;
end.
