program MoveHello;
uses crt;
const
    Message = 'Hello, World!';

procedure ShowMessage(x, y: integer; msg: string);
begin
    GotoXY(x, y);
    write(msg);
    GotoXY(1, 1)
end;

procedure HideMessage(x, y: integer; msg: string);
var
    len, i: integer;
begin
    len := length(msg);
    GotoXY(x, y);
    for i := 1 to len do
        write(' ');
    GotoXY(1, 1)
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer);
begin
    HideMessage(x, y, msg);
    x := x + dx;
    y := y + dy;
    ShowMessage(x, y, msg)
end;

var
    CurX, CurY: integer;
    ch: char;
begin
    clrscr;
    CurX := (ScreenWidth - length(Message)) div 2;
    CurY := ScreenHeight div 2;
    ShowMessage(CurX, CurY, Message);
    while true do
    begin
        ch := ReadKey;
        if ch <> #0 then
            break;
        ch := ReadKey;
        case ch of
            #75:
            begin
                if CurX = 1 then
                begin
                    HideMessage(CurX, CurY, Message);
                    CurX := ScreenWidth - length(Message) + 1;
                end;
                MoveMessage(CurX, CurY, Message, -1, 0);
            end;
            #77:
            begin
                if CurX = ScreenWidth - length(Message) then
                begin
                    HideMessage(CurX, CurY, Message);
                    CurX := 0;
                end;
                MoveMessage(CurX, CurY, Message, 1, 0);
            end;
            #72:
            begin
                if CurY = 1 then
                begin
                    HideMessage(CurX, CurY, Message);
                    CurY := ScreenHeight + 1;
                end;
                MoveMessage(CurX, CurY, Message, 0, -1);
            end;
            #80:
            begin
                if CurY = ScreenHeight then
                begin
                    HideMessage(CurX, CurY, Message);
                    CurY := 0;
                end;
                MoveMessage(CurX, CurY, Message, 0, 1);
            end;
        end;
    end;
    clrscr
end.
