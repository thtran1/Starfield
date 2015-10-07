int screenSize = 400;
Particle[] particles;

public void setup()
{
	background(0);
	size(screenSize,screenSize);
	particles = new Particle[1000];
	for (int i = 0; i < particles.length; i++) {
		particles[i] = new NormalParticle();
	}
}
void draw()
{
	fill(0,100);
	rect(-100,-100,screenSize+200,screenSize+200);
	for (int i = 0; i < particles.length; i++) {
		particles[i].move();
		particles[i].show();
		particles[i].respawn();
	}
}
class NormalParticle implements Particle{
	double pX, pY, pAngle, pSpeed, pSize, depth;
	NormalParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = 0.5;
		pAngle = Math.random()*300;
		pSize = 0.1;
		depth = 50;
	}
	public void move() {
		pX = (Math.cos(pAngle)*pSpeed + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*pSpeed + (pY-screenSize/2)/depth + pY);
		pSize = pSize + 0.01;
	}
	public void show() {
		noStroke();
		fill(255);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
	}
	public void respawn() {
		int extraPix = (int)(Math.random()*500)+1;
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pSize = 1;
		}
	}
}
interface Particle {
	public void show();
	public void move();
	public void respawn();
}
class OddballParticle implements Particle {
	public void show() {

	}
	public void move() {

	}
	public void respawn() {

	}
}
class JumboParticle implements Particle {
	public void show() {

	}
	public void move() {
		
	}
	public void respawn() {
		
	}
}

