draw_self();

//Draw health bar.
DrawBar(
	(hp / hpMax),
	x,
	y,
	128,
	16,
	4,
	c_green,
	c_grey
);