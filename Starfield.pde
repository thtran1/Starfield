int screenSize = 400;
NormalParticle[] aPart = new NormalParticle[10];

void setup()
{
	background(0);
	size(screenSize,screenSize);
	for (int i = 0; i < aPart.length; i++) {
		aPart[i] = new NormalParticle();
	}
}
void draw()
{
	fill(0);
	rect(-100,-100,screenSize+200,screenSize+200);
	for (int i = 0; i < aPart.length; i++) {
		aPart[i].move();
		aPart[i].show();
	}
}
class NormalParticle
{
	double pX, pY, pAngle, pSpeed, pSize;
	NormalParticle() {
		pX = screenSize/2;
		pY = screenSize/2;
		pSpeed = 1;
		pAngle = Math.random()*300;
		pSize = 1;
	}
	void move() {
		pX = (Math.cos(pAngle)*pSpeed + pX);
		pY = (Math.sin(pAngle)*pSpeed + pY);
	}
	void show() {
		noStroke();
		fill(255);
		ellipse((float)pX, (float)pY, 10, 10);
		//abs((float)((screenSize/2)+pY))/50
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

