int screenSize = 600;
double trueSpeed = 0.5;
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
	for (int i = 0; i < particles.length/100; i++) {
		particles[i] = new OddballParticle();
	}
	for (int i = 0; i < particles.length/500; i++) {
		particles[i] = new JumboParticle();
	}
}
void draw()
{
	fill(0,200);
	rect(-100,-100,screenSize+200,screenSize+200);
	for (int i = 0; i < particles.length; i++) {
		particles[i].move();
		particles[i].show();
		particles[i].respawn();
	}
	text(mX + ", " + mY, 10,10);
}
interface Particle {
	public void show();
	public void move();
	public void respawn();
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
class OddballParticle implements Particle {
	double pX, pY, pAngle, pSpeed, pSize, depth, pColor, pRand;
	OddballParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = trueSpeed/pRand*10;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
		pColor = Math.random()*256;
		pRand = (Math.random()*10)+1;
	}
	public void move() {
		pX = (Math.cos(pAngle)*((Math.random()*4)+trueSpeed-1) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)+trueSpeed-1) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease*pRand;
	}
	public void show() {
		translate(mX/2,mY/2);
		noStroke();
		fill((int)pColor);
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
			pColor = Math.random()*256;
			pRand = (Math.random()*10)+5;
		}
	}
}
class JumboParticle implements Particle {
	double pX, pY, pAngle, pSpeed, pSize, depth, pColR, pColG, pColB, pRand, pCratSize, pCratXRand, pCratYRand;
	int extraPix;
	JumboParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = trueSpeed/pRand*200;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
		pColR = Math.random()*256;
		pColG = Math.random()*256;
		pColB = Math.random()*256;
		pRand = (Math.random()*10)+100;
		pCratSize = (Math.random()*5)+5;
		pCratYRand = Math.random()*10;
		pCratXRand = Math.random()*10;
		extraPix = (int)(Math.random()*10000)+screenSize/2;
	}
	public void show() {
		pX = (Math.cos(pAngle)*((Math.random()*4)+trueSpeed-1) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)+trueSpeed-1) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease*pRand;
	}
	public void move() {
		translate(mX/2,mY/2);
		noStroke();
		fill((int)pColR,(int)pColG,(int)pColB);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		fill((int)pColR-50,(int)pColG-50,(int)pColB-50);
		ellipse((float)(pX+((pSize + trueSizeIncrease*pRand)/pCratXRand)), (float)(pY+((pSize + trueSizeIncrease*pRand)/pCratYRand)), (float)(pSize/pCratSize), (float)(pSize/pCratSize));
		resetMatrix();
	}
	public void respawn() {
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pAngle = Math.random()*180;
			pSize = trueSize;
			pColR = Math.random()*256;
			pColG = Math.random()*256;
			pColB = Math.random()*256;
			pRand = (Math.random()*10)+100;
			pCratYRand = Math.random()*2;
			pCratXRand = Math.random()*2;
			extraPix = (int)(Math.random()*10000)+screenSize/2;
		}	
	}
}

void mouseMoved() {
	mX = mouseX-screenSize/2;
	mY = mouseY-screenSize/2;
}