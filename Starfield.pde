int screenSize = 600;
double trueSpeed = 0.3;
double trueSize = 0.3;
double trueDepth = 30;
double trueSizeIncrease = 0.015;
float mX;
float mY;
Particle[] particles;

public void setup()
{
	background(255);
	size(screenSize,screenSize);
	particles = new Particle[1000];
	
	for (int i = 0; i < particles.length; i++) {
		particles[i] = new NormalParticle();
	}
	for (int i = 0; i < particles.length/50; i++) {
		particles[i] = new OddballParticle();
	}
	for (int i = 0; i < particles.length/500; i++) {
		particles[i] = new JumboParticle();
	}
}

void draw()
{
	fill((float)(trueSpeed*10)-3,150);
	rect(-100,-100,screenSize+200,screenSize+200);
	for (int i = 0; i < particles.length; i++) {
		particles[i].move();
		particles[i].show();
		particles[i].respawn();
	}
	text("Speed: " + (int)(trueSpeed*100), 10,10);
}

interface Particle {
	public void show();
	public void move();
	public void respawn();
}

class NormalParticle implements Particle{
	double pX, pY, pAngle, pSpeed, pSize, depth;
	int extraPix;
	NormalParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pSpeed = trueSpeed;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
		extraPix = (int)(Math.random()*10000)+screenSize/2;
	}
	public void move() {
		pSpeed = trueSpeed;
		pX = (Math.cos(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pY-screenSize/2)/depth + pY);
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
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pSpeed = trueSpeed;
			pAngle = Math.random()*180;
			pSize = trueSize;
			extraPix = (int)(Math.random()*10000)+screenSize/2;
		}
	}
}

class OddballParticle implements Particle {
	double pX, pY, pAngle, pSpeed, pSize, depth, pColor, pRand;
	int extraPix;
	OddballParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pRand = (Math.random()*10)+5/trueSpeed;
		pSpeed = trueSpeed/pRand*10;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
		pColor = Math.random()*256;
		extraPix = (int)(Math.random()*100000)+screenSize/2;
	}
	public void move() {
		pSpeed = trueSpeed;
		pX = (Math.cos(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease*pRand*(pSpeed/1);
	}
	public void show() {
		translate(mX/2,mY/2);
		noStroke();
		fill(0);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		fill((int)pColor);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		resetMatrix();
	}
	public void respawn() {
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pSpeed = trueSpeed;
			pAngle = Math.random()*180;
			pSize = trueSize;
			pColor = Math.random()*256;
			pRand = (Math.random()*10)+5/trueSpeed;
			extraPix = (int)(Math.random()*100000)+screenSize/2;
		}
	}
}

class JumboParticle implements Particle {
	double pX, pY, pAngle, pSpeed, pSize, depth, pColR, pColG, pColB, pRand;
	int extraPix, extraPix1;
	JumboParticle() {
		pX = Math.random()*screenSize;
		pY = Math.random()*screenSize;
		pRand = (Math.random()*50)+100/trueSpeed;
		pSpeed = trueSpeed/pRand*200;
		pAngle = Math.random()*180;
		pSize = trueSize;
		depth = trueDepth;
		pColR = Math.random()*256;
		pColG = Math.random()*256;
		pColB = Math.random()*256;
		extraPix = (int)(Math.random()*1000000)+screenSize/2;
	}
	public void show() {
		pSpeed = trueSpeed;
		pX = (Math.cos(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pX-screenSize/2)/depth + pX);
		pY = (Math.sin(pAngle)*((Math.random()*4)-2+pSpeed*2) + (pY-screenSize/2)/depth + pY);
		pSize = pSize + trueSizeIncrease*pRand*(pSpeed/1);
	}
	public void move() {
		translate(mX/2,mY/2);
		noStroke();
		fill(0);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		fill((int)pColR,(int)pColG,(int)pColB);
		ellipse((float)pX, (float)pY, (float)(pSize), (float)(pSize));
		resetMatrix();
	}
	public void respawn() {
		if (pX > screenSize+extraPix || pX < 0-extraPix || pY > screenSize+extraPix || pY < 0-extraPix) {
			pX = screenSize/2;
			pY = screenSize/2;
			pSpeed = trueSpeed;
			pAngle = Math.random()*180;
			pSize = trueSize;
			pColR = Math.random()*256;
			pColG = Math.random()*256;
			pColB = Math.random()*256;
			pRand = (Math.random()*50)+100/trueSpeed;
			extraPix = (int)(Math.random()*1000000)+screenSize/2;
		}	
	}
}

void mouseMoved() {
	mX = mouseX-screenSize/2;
	mY = mouseY-screenSize/2;
}

void keyPressed() {
	if (keyCode == UP && trueSpeed < 3) {
		trueSpeed = trueSpeed + 0.025;
	}
	if (keyCode == DOWN && trueSpeed > 0.3) {
		trueSpeed = trueSpeed - 0.025;
	}
}