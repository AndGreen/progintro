program diamond;

procedure printSpaces(k: integer);
var
	i: integer;
begin
	for i := 1 to k do
		write(' ');
end;

procedure printLine(n, k: integer);
begin
	printSpaces(n + 1 - k);
	write('*');
	if k > 1 then
	begin
		printSpaces(2 * k - 3);
		write('*');
	end;
	writeln
end;

var 
	n, k, h, i: integer;
begin
	repeat
		writeln('Enter the diamond''s height (positive odd): ');
		readln(h);
	until (h > 0) and (h mod 2 = 1);

	n := h div 2;
	
	for k := 1 to n + 1 do
		printLine(n, k);

	for k := n downto 1 do
		printline(n, k);
end.

