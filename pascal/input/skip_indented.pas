program SkipIndented;
var
    c: char;
    lineStarted, printing: boolean;
begin
    lineStarted := false;
    printing := false;
    while not eof do
    begin
        read(c);
        if c = #10 then
        begin
            if lineStarted and printing then
                writeln;
           lineStarted := false;
        end
        else
        begin
            if not lineStarted then
            begin
                printing := (c <> ' ') and (c <> #9);
                lineStarted := true
            end;
            if printing then
                write(c)
        end
    end
end.
