bgZoom = 0.9;
stageName = 'stage';

var bg:BGSprite = new BGSprite('bg', -600, -200, Paths.image('backgrounds/stage/stageback'), null, 0.9, 0.9);
sprites.add(bg);
add(bg);

var stageFront:BGSprite = new BGSprite('stageFront', -650, 600, Paths.image('backgrounds/stage/stagefront'), null, 0.9, 0.9);
stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
stageFront.updateHitbox();
sprites.add(stageFront);
add(stageFront);

var stageCurtains:BGSprite = new BGSprite('stageCurtains', -500, -300, Paths.image('backgrounds/stage/stagecurtains'), null, 1.3, 1.3);
stageCurtains.setGraphicSize(Std.int(stageCurtains.width * 0.9));
stageCurtains.updateHitbox();
sprites.add(stageCurtains);
add(stageCurtains);