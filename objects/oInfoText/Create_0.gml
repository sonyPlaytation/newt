
spd = 0.50;
letters = 0;
text = "DEFAULT\nSecond Line";
length = string_length(text);
text_current = "";
w = 0;
h = 0;
border = 12;
corner = 15;
done = false;
font = fKaren

alpha = 0;
active = false;

textsound[1] = t1;

typist = scribble_typist()
	//typist.sound(textsound,0.8,1.2,0.6);
	typist.in(0.8,1)
	