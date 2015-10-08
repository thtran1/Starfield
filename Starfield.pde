int screenSize = 600;
double trueSpeed = 0.1;
double trueSize = 0.1;
double trueDepth = 30;
double trueSizeIncrease = 0.015;
float mX;
float mY;
Particle[] particles;

public void setup()
{
	background(0);
	size(screenSize,screenSize);
	particles = new Particle[1000];
	
	for (int i = 0; i < particles.length; i++) {
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
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
	text(mX + ", " + mY, 10,10);
}
class NormalParticle implements Particle{
	double pX, pY, pAngle, pSpeed, pSize, depth;
	NormalParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = trueSpeed;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
	}
	public void move() {
		pX = (Math.cos(pAngle)*((Math.random()*4)+trueSpeed-1) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)+trueSpeed-1) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease;
	}
	public void show() {
		translate(mX/2,mY/2);
		noStroke();
		fill(255);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		resetMatrix();
	}
	public void respawn() {
		int extraPix = (int)(Math.random()*1000)+screenSize/2;
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pAngle = Math.random()*180;
			pSize = trueSize;
		}
	}
}
interface Particle {
	public void show();
	public void move();
	public void respawn();
}
class OddballParticle implements Particle {
	double pX, pY, pAngle, pSpeed, pSize, depth;
	OddballParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = trueSpeed/500;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
	}
	public void move() {
		pX = (Math.cos(pAngle)*((Math.random()*4)+trueSpeed-1) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)+trueSpeed-1) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease*20;
	}
	public void show() {
		translate(mX/2,mY/2);
		noStroke();
		fill(255);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		resetMatrix();
	}
	public void respawn() {
		int extraPix = (int)(Math.random()*1000)+screenSize/2;
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pAngle = Math.random()*180;
			pSize = trueSize;
		}
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

void mouseMoved() {
	mX = mouseX-screenSize/2;
	mY = mouseY-screenSize/2;
}