draw_self();

//Draw roam.
draw_set_color(c_white);
//draw_circle(goalX, goalY, 8, false);
//draw_line(x, y, goalX, goalY);

//Draw detect player range.
draw_set_color(c_white);
draw_circle(x, y, detectPlayerRange, true);