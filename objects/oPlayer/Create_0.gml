///@implements ILight
ILight();

randomize();

spd = 5; ///@is {number}
hasTorch = false; ///@is {bool}
torchFuel = 0; ///@is {number}
torchTimer = 0; ///@is {number}

dead = false; ///@is {bool}
eaten = false; ///@is {bool}

heat = 60; ///@is {number}
sticks = 1; ///@is {int}

displayLightOffsetX = -40;
displayLightOffsetY = -100;


canLightNewTorch = false; ///@is {bool}
canStartNewFire = false; ///@is {bool}
