
spd = 0.50;
letters = 0;
text = "DEFAULT\nSecond Line";
length = string_length(text);
text_head = "";
text_body = "";
text_current = "";
w = 0;
h = 0;
border = 12;
corner = 15;
done = false;
font = fKaren
boxCol = #221428;

alpha = 0;
active = false;

textsound[1] = t1;


typist = scribble_typist()
	//typist.sound_per_char(textsound,0.01,1.2,0.6);
	typist.in(0.8,1)
	